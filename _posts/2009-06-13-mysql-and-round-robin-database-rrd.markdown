---
date: '2009-06-13 18:56:35'
layout: post
slug: mysql-and-round-robin-database-rrd
status: publish
title: MySQL and Round Robin Database (RRD)
wordpress_id: '7'
categories:
- Database
- MySQL
---

While looking for a MySQL RRD storage engine, I came across [Round-Robin Database Storage Engine (RRD)](http://www.shinguz.ch/MySQL/rrd.pdf) (pdf) which describes how to setup a MySQL table to act as a RRD. The PDF appears to have been created in February of 2007 but the benchmark result at the end of 600 inserts/second says this was achieved on a 1350 MHz AMD CPU which suggests the article may be older.

I replicated the configuration and tested it on my laptop (5400 RPM disk, 2.4 GHz Intel T7700 CPU). With the MyISAM database, a brieft test of about 50k inserts resulted in ~7000 inserts/second. But the 25m max rows means the trigger functionality (the part that makes the table behave like an RRD) wasn't really tested.

To make a more interesting test, I recreated the database with max rows set to 25920 (or one sample every 5 minutes for 90 days):

    
    CREATE TABLE statistic_rrd (
    rrd_key INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
        , attribute_key INT UNSIGNED NOT NULL DEFAULT '0'
        , start_utime INT UNSIGNED NOT NULL DEFAULT '0'
        , end_utime INT UNSIGNED DEFAULT NULL
        , logging_interval INT UNSIGNED NOT NULL DEFAULT '0'
        , value BIGINT UNSIGNED NOT NULL DEFAULT '0'
        , UNIQUE KEY (attribute_key, start_utime)
        , KEY start_time (start_utime)
        ) ROW_FORMAT = FIXED
        , MAX_ROWS = 25920
    ;
    
    CREATE TABLE statistic_rrd_key (
        rrd_key BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
    )
    ;
    INSERT INTO statistic_rrd_key VALUES (0);
    
    DROP TRIGGER IF EXISTS statistic_rrd_ins;
    DELIMITER $$
    CREATE TRIGGER statistic_rrd_ins
    BEFORE INSERT ON statistic_rrd
    FOR EACH ROW
    BEGIN
        SET @rrd_key = 0;
        SET @rows = 25920;
        -- PK is NULL
        IF NEW.rrd_key = 0 THEN
            SELECT rrd_key + 1
                FROM statistic_rrd_key
                INTO @rrd_key;
            SET NEW.rrd_key = @rrd_key;
        END IF;
        IF (NEW.rrd_key % @rows) THEN
            SET NEW.rrd_key = NEW.rrd_key % @rows;
        ELSE
            SET NEW.rrd_key = @rows;
        END IF;
    UPDATE statistic_rrd_key SET rrd_key = NEW.rrd_key;
    END;
    $$
    DELIMITER ;


Results:
25920 - ~ 7k inserts/second (on empty database)
25920 * 5 - ~6k inserts/second
25920 * 10 - ~6k inserts/second

The insert rate was CPU limited with one of the two cores at 100% and the hard drive rarely being written. The total number of the rows in the table was 25,243 at the end so this suggests my idea of capping at 25920 wasn't ideal (I didn't examine the trigger to determine exactly how it works).

After converting both tables to InnoDB, the results where:

25920 - ~630 inserts/second (empty db)
25920 * 5 - ~660 inserts/second

With the hard drive thrashing, the insert rate was clearly limited by the transaction log. This time though both cores varied at around 30% utilization.

Enabling some sane InnoDB performance options per [Innodb Performance Optimization Basics](http://www.mysqlperformanceblog.com/2007/11/01/innodb-performance-optimization-basics/) at the MySQL Performance Blog:


    
    [innodb]
    innodb_buffer_pool_size = 1G
    innodb_log_file_size = 256M
    innodb_log_buffer_size = 4M
    innodb_flush_log_at_trx_commit = 2
    innodb_thread_concurrency = 8
    innodb_flush_method = O_DIRECT
    innodb_file_per_table



25920 = ~ 1580 inserts/second
25920 * 5 = ~ 1580 inserts/second

Now the disk wasn't thrashing so much but the CPU cores were switching back and forth between 80-90% and 60-70% which suggested contention on the rrd_key. One approach would be to make that table (with just a single row) use the MEMORY engine. I made that change and:

25920 * 10 = ~ 1730 inserts/second

But the insertion code is also naive as it makes a SQL call for each insertion. A more realistic scenario is having approximately 500 inserts per call. But this doesn't work with the trigger properly...

According to hdparm, the write speed of 


**insert.php v1:**

    
    <?php
    
    try {
        $db = new PDO('mysql:dbname=rrd;host=localhost', 'username', 'password');
        echo "PDO connection object created\n";
    } catch (PDOException $e) {
        echo $e->getMessage() ."\n";
    }
    
    $sql = <<<EOD
    REPLACE INTO statistic_rrd
        (attribute_key, start_utime, end_utime, logging_interval, value)
    VALUES
        (ROUND(RAND()*100000), UNIX_TIMESTAMP(NOW()), NULL, 100, 123456789)
    ;
    EOD;
    
    try {
        $rows_max = 25920*10;
        $start_time = microtime(true);
        $count = $rows_max;
        while ($count) {
            --$count;
            $db->exec($sql);
        }
        $end_time = microtime(true);
        $total_time = $end_time - $start_time;
        echo ($rows_max / $total_time) ." inserts/sec\n";
        echo "rows_max: $rows_max\n";
        echo "total_time: $total_time\n";
    } catch (PDOException $e) {
        echo $e->getMessage() ."\n";
    }
    
    if ($db) $db = null;
    ?>
