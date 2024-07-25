-- Creating a new database
CREATE DATABASE my_database;

-- Switch to the newly created database
USE my_database;

-- Create a new table named 'test'
CREATE TABLE test (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    affiliation VARCHAR(100) NOT NULL,
    event_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

-- Insert data into the 'test' table
INSERT INTO test (name, affiliation) VALUES ('Wolverine', 'X-Men');
INSERT INTO test (name, affiliation) VALUES ('Rogue', 'X-Men'), ('Deadpool', 'Deadpool troop');

-- Select all records from the 'test' table
SELECT * FROM test;

-- Update a record in the 'test' table
UPDATE test
SET name = 'Logan'
WHERE id = 1;

-- Delete a record from the 'test' table
DELETE FROM test
WHERE id = 3;

-- Select all records from the 'test' table to verify changes
SELECT * FROM test;

