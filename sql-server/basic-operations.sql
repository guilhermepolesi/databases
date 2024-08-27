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

-- Creating a new database
CREATE DATABASE my_database;
GO

-- Switch to the newly created database
USE my_database;
GO

-- Create a new table named 'my_table'
CREATE TABLE my_table (
    id INT IDENTITY(1,1) PRIMARY KEY, 
    username NVARCHAR(100) NOT NULL,
    class NVARCHAR(100) NOT NULL,
    event_timestamp DATETIME DEFAULT GETDATE() 
);
GO

-- Insert data into the 'my_table' table
INSERT INTO my_table (username, class) VALUES ('Yusuke', 'Human');
INSERT INTO my_table (username, class) VALUES ('Kuwabara', 'Bad Boy'), ('Kurama', 'Youkai');
GO

-- Select all records from the 'my_table' table
SELECT * FROM my_table;
GO

-- Update a record in the 'my_table' table
UPDATE my_table
SET class = 'Youkai'
WHERE id = 1;
GO

-- Delete a record from the 'my_table' table
DELETE FROM my_table
WHERE id = 3;
GO

-- Select all records from the 'my_table' table to verify changes
SELECT * FROM my_table;
GO

