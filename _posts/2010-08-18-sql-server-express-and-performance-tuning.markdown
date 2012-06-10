---
date: '2010-08-18 14:31:07'
layout: post
slug: sql-server-express-and-performance-tuning
status: publish
title: SQL Server Express and Performance Tuning
wordpress_id: '165'
categories:
- Microsoft
- SQL Server
- SQL Server Express
---

One of the tricky things with SQL Server Express is that tools like the index tuning wizard and similar are not supported or available. A work around for the lack of the Microsoft profiler is the [AnjLab Sql Profiler](http://sites.google.com/site/sqlprofiler/) which does work with the 2005 and 2008 SQL Server Express products.

Recently, I was faced with a database that needed a number of indexes to improve performance. The database was running on SQL Server Express 2008 R2 so I couldn't be lazy and use the index tuning wizard. Some research revealed these resources:



	
  * [Uncover Hidden Data to Optimize Application Performance](http://msdn.microsoft.com/en-us/magazine/cc135978.aspx)

	
  * [Find Most Expensive Queries Using DMV](http://blog.sqlauthority.com/2010/05/14/sql-server-find-most-expensive-queries-using-dmv/)


**Quickly finding likely columns to index**


    
    
    SELECT TOP 10
    [Total Cost] = ROUND(avg_total_user_cost * avg_user_impact * (user_seeks + user_scans),0)
    , avg_user_impact
    , TableName = statement
    , [EqualityUsage] = equality_columns
    , [InequalityUsage] = inequality_columns
    , [Include Cloumns] = included_columns
    FROM sys.dm_db_missing_index_groups g
    INNER JOIN sys.dm_db_missing_index_group_stats s
    ON s.group_handle = g.index_group_handle
    INNER JOIN sys.dm_db_missing_index_details d
    ON d.index_handle = g.index_handle
    ORDER BY [Total Cost] DESC;
    



This is as simple as running the query above as found in the first referenced article. As one adds indexes, simply refresh the query and you'll continue to see more items. Note that in some cases if views are in use the suggested indexes may be present but unused by the view. In that case, one should take a closer look at how views work and potentially alter the views to support indexing of the view columns.

**Finding likely columns to index via heavy queries**


    
    
    SELECT TOP 10 SUBSTRING(qt.TEXT, (qs.statement_start_offset/2)+1,
    ((CASE qs.statement_end_offset
    WHEN -1 THEN DATALENGTH(qt.TEXT)
    ELSE qs.statement_end_offset
    END - qs.statement_start_offset)/2)+1),
    qs.execution_count,
    qs.total_logical_reads, qs.last_logical_reads,
    qs.total_logical_writes, qs.last_logical_writes,
    qs.total_worker_time,
    qs.last_worker_time,
    qs.total_elapsed_time/1000000 total_elapsed_time_in_S,
    qs.last_elapsed_time/1000000 last_elapsed_time_in_S,
    qs.last_execution_time,
    qp.query_plan
    FROM sys.dm_exec_query_stats qs
    CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) qt
    CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle) qp
    ORDER BY qs.total_logical_reads DESC -- logical reads
    -- ORDER BY qs.total_logical_writes DESC -- logical writes
    -- ORDER BY qs.total_worker_time DESC -- CPU time
    



The other way to approach index creation is to look at the heavier queries and see what they are doing. The query above comes from the second referenced article. In some cases, it is obvious that indexes will help. Looking at the actual queries being run is a lot of help because sometimes it is clear that the problem is with query itself. In that case, either the query needs to be modified or the approach to getting that information needs to be rethought (an example of that would be moving to a nightly batch process to collate expensive-to-query data).

In both cases one has to be critical of the work being done. Index creation is a bit of an art because simply indexing everything is not an option. Thinking about joins and indexes when designing the database is definitely helpful but going back to add them can be done and it doesn't have to be painful even when using SQL Server Express!
