---
date: '2011-10-19 11:23:21'
layout: post
slug: sql-server-ranking-names-for-search-results-by-position-of-search-within-name
status: publish
title: SQL Server - Ranking names for search results by position of query within name
wordpress_id: '235'
categories:
- Database
- MySQL
- SQL Server
---

## SQL Server using PATINDEX() and LEFT()


When searching names there are some assumptions we can make (based on first and last name being in separate columns):



	
  * A match in the last name is more important than a match in the first name

	
  * The position of the match within the last name is important: an earlier match is a better match

	
  * The first name should still be search

	
  * If present, a middle name is least important


It is possible to do this with SQL Server using the following proprietary extensions:

	
  * [PATINDEX(needle, haystack)](http://msdn.microsoft.com/en-us/library/ms188395.aspx): returns position of needle within haystack and (unfortunately in our use case) 0 if not present.

	
  * [LEFT(string, count)](http://msdn.microsoft.com/en-us/library/ms177601.aspx): returns substring of string up to length of count (note: will truncate string if length greater than count!)



    
    SELECT TOP 10 firstName + ' ' + middleName + ' ' + lastName
    FROM Member
    WHERE [firstName] + ' ' + [middleName] + ' ' + [lastName] LIKE @query
    ORDER BY
      PATINDEX (
        @query,
        LEFT([lastName] + '                                                                                          ', 90)
        + LEFT([firstName] + '                                                                                          ', 90)
        + [middleName]
      ),
      [lastName],
      [firstName],
      [middleName]
      -- Note: the ' .... ' above is a string of spaces of length 90


We are making a big assumption: none of the name fields will have a length > 90. You may need to adjust this value for your use case. The reason we need to do this is that PATINDEX() will return 0 if the value is not present so we can't simply due a nice ORDERBY PATINDEX(@query, lastName), PATINDEX(@query, firstName), PATINDEX(@query, middleName). Instead, we have to concatenate the name fields into one long string but pad them so that variable length of the names will not affect the rank they are put in.


## MySQL using LOCATE() and LEFT()


The same method should work in MySQL using the [LOCATE()](http://dev.mysql.com/doc/refman/5.0/en/string-functions.html#function_locate) and [LEFT()](http://dev.mysql.com/doc/refman/5.0/en/string-functions.html#function_left) functions. Both appear to be identical in usage to the SQL Server functions.
