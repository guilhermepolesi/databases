-- ############################################################
-- MySQL FLUSH Commands Examples
-- ############################################################
--
-- This file provides examples of various FLUSH commands used
-- for administrative tasks in MySQL. Each command is accompanied
-- by comments explaining its purpose and usage.
--
-- IMPORTANT: Use these commands with caution, as they may
-- affect database performance and availability.
-- ############################################################

-- FLUSH PRIVILEGES
-- ############################################################
-- 
-- Description:
-- Updates the in-memory privilege tables with any changes made
-- directly to the tables (e.g., mysql.user, mysql.db).
--
-- Use this command when privileges are modified directly in
-- system tables without using GRANT or REVOKE commands.
--
-- Example:
-- ALTER USER 'some_user'@'localhost' IDENTIFIED BY 'new_password';
-- FLUSH PRIVILEGES;  -- Ensure the changes are applied
--
FLUSH PRIVILEGES;

-- ############################################################

-- FLUSH TABLES
-- ############################################################
-- 
-- Description:
-- Closes and reopens all open tables, which can be useful
-- for releasing resources or ensuring tables are up-to-date.
--
-- Use this command if you encounter issues with table locks
-- or want to ensure that changes to tables are recognized.
--
-- Example:
-- FLUSH TABLES;  -- Close and reopen all tables
--
FLUSH TABLES;

-- ############################################################

-- FLUSH LOGS
-- ############################################################
-- 
-- Description:
-- Closes and reopens the log files, such as the binary log,
-- error log, and general log. This is useful for archiving logs
-- or managing log files.
--
-- Use this command to start a new log file or when performing
-- log rotation.
--
-- Example:
-- FLUSH LOGS;  -- Rotate log files
--
FLUSH LOGS;

-- ############################################################

-- FLUSH STATUS
-- ############################################################
-- 
-- Description:
-- Resets the server status variables, which are used to monitor
-- performance and server activity. Useful for performance
-- analysis and troubleshooting.
--
-- Use this command when you need to reset counters to analyze
-- performance over a new period.
--
-- Example:
-- FLUSH STATUS;  -- Reset status counters
--
FLUSH STATUS;

