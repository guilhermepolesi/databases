-- ############################################################
-- SQL Script for Granting and Revoking Privileges
-- ############################################################
-- 
-- IMPORTANT:
-- 1. This script contains commands to grant and revoke privileges.
-- 2. In most cases, privileges are updated automatically, and you do 
--    not need to use `FLUSH PRIVILEGES`.
-- 3. If you encounter issues where privileges are not being applied
--    immediately, or if you have made direct changes to privilege tables,
--    you may need to use the `FLUSH PRIVILEGES` command to reload the 
--    privileges from the grant tables.
-- 
-- To use `FLUSH PRIVILEGES`, execute the following command:
-- FLUSH PRIVILEGES;
-- ############################################################

-- Grant database management privileges
GRANT CREATE, DROP, ALTER ON `database_name`.* TO 'new_user'@'localhost';

-- Grant data manipulation privileges
GRANT SELECT, INSERT, UPDATE, DELETE ON `database_name`.* TO 'new_user'@'localhost';

-- Grant additional privileges
GRANT REFERENCES, INDEX ON `database_name`.* TO 'new_user'@'localhost';

-- Grant privileges for creating and managing views
GRANT CREATE VIEW, SHOW VIEW ON `database_name`.* TO 'new_user'@'localhost';

-- Grant privileges for creating and executing routines (procedures and functions)
GRANT CREATE ROUTINE, ALTER ROUTINE, EXECUTE ON `database_name`.* TO 'new_user'@'localhost';

-- Grant event management privileges
GRANT EVENT ON `database_name`.* TO 'new_user'@'localhost';

-- Grant privileges for creating and managing triggers
GRANT TRIGGER ON `database_name`.* TO 'new_user'@'localhost';

-- Grant all privileges on a specific database
GRANT ALL PRIVILEGES ON `database_name`.* TO 'new_user'@'localhost';

-- Revoke all privileges on a specific database from 'new_user'
REVOKE ALL PRIVILEGES ON `database_name`.* FROM 'new_user'@'localhost';

-- IMPORTANT:
-- Ensure that the user `new_user` only receives the minimum 
-- necessary privileges for their role. Avoid granting 
-- `WITH GRANT OPTION` unless absolutely necessary.
-- Grant SELECT privilege with restrictions
-- Note: Be cautious with `WITH GRANT OPTION`
-- This can pose a security risk if not managed carefully. 
-- Use this option sparingly and ensure that only trusted users have 
-- this capability.
GRANT SELECT ON `database_name`.* TO 'new_user'@'localhost'
WITH GRANT OPTION

-- Reload the privileges from the grant tables in the MySQL database
FLUSH PRIVILEGES;

-- Show the privileges granted to 'new_user'@'localhost'
SHOW GRANTS FOR 'new_user'@'localhost';

