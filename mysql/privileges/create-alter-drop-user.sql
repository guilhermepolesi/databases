-- ############################################################
-- SQL Script to Create a New User
-- ############################################################
-- 
-- IMPORTANT:
-- When creating a new user, ensure you provide a strong password
-- and assign only the necessary privileges.
-- Create a new user with a strong password
CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'secure_password';

-- Create a new user with resource limits
CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'secure_password' 
    WITH
        MAX_QUERIES_PER_HOUR 10 
        MAX_UPDATES_PER_HOUR 5 
        MAX_CONNECTIONS_PER_HOUR 100;


-- IMPORTANT:
-- Use `ALTER USER` to update user credentials and account options
-- while maintaining security. Ensure that you use a strong password
-- and apply changes only when necessary.
-- Alter the user's password to enhance security
ALTER USER 'existing_user'@'localhost' IDENTIFIED BY 'new_secure_password';

-- Alter existing user to set resource limits
ALTER USER 'existing_user'@'localhost'
    WITH    
        MAX_QUERIES_PER_HOUR 100
        MAX_UPDATES_PER_HOUR 20
        MAX_CONNECTIONS_PER_HOUR 50;

-- IMPORTANT:
-- Use `DROP USER` to remove users who no longer need access.
-- Ensure that all necessary data and permissions are transferred
-- before dropping the user to avoid unintended data loss.
-- Drop a user account that is no longer needed
DROP USER 'unnecessary_user'@'localhost';

