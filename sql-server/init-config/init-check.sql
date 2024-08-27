/*
    This script uses the "GO" command to separate and execute individual batches of SQL statements.
    The "GO" command is not a SQL Server command itself but a directive recognized by tools like SQL Server Management Studio (SSMS).
    It tells the client to send the current batch of commands to the SQL Server for execution.
    
    Why use "GO":
    - "GO" helps in breaking down the script into manageable parts, ensuring that each section is executed independently.
    - It is especially useful when you need to switch contexts, such as changing the database with the USE statement, or when performing operations that should be isolated from one another.
    
    If you are using a tool or environment that does not require "GO" (e.g., if you are running scripts directly through an application or via command line), 
    you can safely ignore the "GO" statements and proceed with the rest of the script as is.
*/

-- Check SQL Server version
SELECT @@VERSION;
GO

-- List all databases
SELECT name FROM sys.databases;
GO

-- Select a database
USE my_database;
GO

-- List all tables in the selected database
SELECT name FROM sys.tables;
GO

-- Show the structure of a table
EXEC sp_help 'my_table';
GO

-- List all users
SELECT name FROM sys.syslogins;
GO

-- Check current user's privileges
SELECT * FROM fn_my_permissions(NULL, 'DATABASE');
GO

-- Check security configuration (example for password policy)
EXEC xp_instance_regread 
    @rootkey = 'HKEY_LOCAL_MACHINE',
    @key = 'SOFTWARE\Microsoft\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQLServer',
    @value_name = 'LoginMode';
GO

-- Check the integrity of a table
DBCC CHECKTABLE('my_table');
GO

-- Repair a table, if needed (requires checking and fixing errors)
DBCC CHECKTABLE('my_table', REPAIR_ALLOW_DATA_LOSS);
GO

-- Consult information about tables
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_CATALOG = 'my_database';
GO

-- Check users and permissions
SELECT name, type_desc FROM sys.database_principals;
GO

-- Monitor performance
SELECT * FROM sys.dm_exec_query_stats;
GO

-- Use system views (example for schema statistics)
SELECT * FROM sys.dm_db_index_physical_stats(NULL, NULL, NULL, NULL, 'DETAILED');
GO

