# SQL-Queries-for-Worker-Table
 These queries cover a range of SQL operations, including data selection, filtering, aggregation, ordering, string manipulation, and advanced analytical functions.
Basic Select & Alias Queries:

Fetching specific columns with alias names.
Using string functions like UPPER(), LTRIM(), RTRIM(), and REPLACE().
Extracting unique values using DISTINCT.
Substring and String Position Queries:

Extracting parts of FIRST_NAME using SUBSTR().
Finding the position of specific characters within names.
Sorting and Filtering Data:

Ordering records using ORDER BY in ascending and descending order.
Filtering records based on conditions like LIKE, BETWEEN, IN, and NOT IN.
Selecting employees based on specific FIRST_NAME, DEPARTMENT, or SALARY ranges.
Date and Time Queries:

Retrieving employees who joined in a specific month and year.
Displaying the current system date and time using NOW().
Aggregation and Grouping:

Counting the number of employees in each department.
Summing up total salaries per department.
Filtering groups based on conditions using HAVING().
Joins and Set Operations:

Fetching details of workers who are also managers using INNER JOIN.
Identifying duplicate records using GROUP BY and HAVING COUNT() > 1.
Finding records that exist in one table but not in another using NOT IN.
Row Selection and Ranking:

Fetching top N rows using LIMIT.
Selecting the Nth highest salary using window functions (RANK(), DENSE_RANK()).
Identifying employees with the highest salary in each department using partitioning functions.
Cloning and Table Operations:

Creating a new table with the same structure using CREATE TABLE LIKE.
Copying data from one table to another using CREATE TABLE AS SELECT.
Miscellaneous Queries:

Displaying even and odd rows using MOD().
Selecting the first 50% of records.
Fetching the last record and first record from the table.
Retrieving three maximum and minimum salaries.
