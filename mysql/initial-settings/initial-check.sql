-- Check MySQL version
SELECT VERSION();

-- List all databases
SHOW DATABASES;

-- Select a database
USE my_database;

-- List all tables in the selected database
SHOW TABLES;

-- Show the structure of a table
DESCRIBE my_table;

-- List all users
SELECT User, Host FROM mysql.user;

-- Check current user's privileges
SHOW GRANTS FOR CURRENT_USER;

-- Check security configuration
SHOW VARIABLES LIKE 'validate_password%';

-- Check the integrity of a table
CHECK TABLE my_table;

-- Repair a table, if needed
REPAIR TABLE my_table;

/*
    1. information_schema
Description: This database contains information about all other databases and tables in the MySQL server. It provides metadata about the database schema such as tables, columns, indexes, etc.
Usage: It is widely used to query information about the database structure and perform checks on the server configuration.
    2. mysql
Description: This is the MySQL system database that contains tables for managing users and their permissions, as well as other system settings.
Notable Tables:
user: Contains information about MySQL users and their permissions.
db: Contains access permissions to specific databases.
tables_priv: Contains table-level permissions.
columns_priv: Contains column-level permissions.
Usage: It is essential for managing users and permissions in MySQL.
    3. performance_schema
Description: This database provides detailed information about MySQL server performance. It collects and stores data about query performance, events, and other performance metrics.
Usage: It is used to monitor and analyze MySQL server performance, helping in identifying and troubleshooting performance-related issues.
    4. sys
Description: The sys database is a collection of views and stored procedures that help you analyze and monitor MySQL more easily. It provides a more user-friendly view of server performance and state.
Usage: Facilitates administration and monitoring of MySQL by providing useful information in an accessible way.
Example of Using Databases
Here are some examples of how you can use these databases:
*/

--Consult information about tables
SELECT * FROM information_schema.tables WHERE table_schema = 'mysql';

-- Check users and permissions
SELECT User, Host FROM mysql.user;

-- Monitor performance
SELECT * FROM performance_schema.events_statements_summary_by_digest;

-- Use sys views
SELECT * FROM sys.schema_table_statistics;

