-- Create a table to log changes to departments
CREATE TABLE department_log (
  id INT(11) NOT NULL AUTO_INCREMENT,           -- Unique identifier for each log entry
  user_name VARCHAR(100) NOT NULL,              -- User who performed the action
  event_time TIMESTAMP NOT NULL,                -- Timestamp of the event
  event_type ENUM('Insert', 'Update', 'Delete') NOT NULL, -- Type of event (Insert, Update, Delete)
  department_id INT(11) NOT NULL,               -- ID of the department affected
  department_name VARCHAR(45) NOT NULL,         -- Name of the department affected
  PRIMARY KEY (id)                              -- Primary key constraint on 'id'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Set delimiter to define the trigger
DELIMITER $

-- Trigger for logging insertions into the department table
CREATE TRIGGER after_insert_department
AFTER INSERT
ON department
FOR EACH ROW
BEGIN
    -- Insert a log entry for the new department
    INSERT INTO department_log
    (user_name, event_time, event_type, department_id, department_name)
    VALUES
    (USER(), NOW(), 'Insert', NEW.department_id, NEW.name);
END$
-- Reset delimiter
DELIMITER ;

-- Set delimiter to define the trigger
DELIMITER $

-- Trigger for logging updates to the department table
CREATE TRIGGER after_update_department
AFTER UPDATE
ON department
FOR EACH ROW
BEGIN
    -- Insert a log entry for the updated department
    INSERT INTO department_log
    (user_name, event_time, event_type, department_id, department_name)
    VALUES
    (USER(), NOW(), 'Update', NEW.department_id, NEW.name);
END$
-- Reset delimiter
DELIMITER ;

-- Set delimiter to define the trigger
DELIMITER $

-- Trigger for logging deletions from the department table
CREATE TRIGGER after_delete_department
AFTER DELETE
ON department
FOR EACH ROW
BEGIN
    -- Insert a log entry for the deleted department
    INSERT INTO department_log
    (user_name, event_time, event_type, department_id, department_name)
    VALUES
    (USER(), NOW(), 'Delete', OLD.department_id, OLD.name);
END$
-- Reset delimiter
DELIMITER ;

-- WARNING: The following code may result in a referential integrity error due to foreign key constraints.
-- If there are records in the `employee` table that reference the `department` being deleted,
-- you will encounter an error when trying to delete a department because of the foreign key constraint.
-- Set delimiter to define the trigger
DELIMITER $

-- Trigger for logging deletions from the department table
CREATE TRIGGER after_delete_department
AFTER DELETE
ON department
FOR EACH ROW
BEGIN
    -- Insert a log entry for the deleted department into the `department_log` table
    INSERT INTO department_log
    (user_name, event_time, event_type, department_id, department_name)
    VALUES
    (USER(), NOW(), 'Delete', OLD.department_id, OLD.name);
END$
-- Reset delimiter
DELIMITER ;

-- Insert a new department into the department table
INSERT INTO department (name)
VALUES ('Marketing');

-- View the log after the insertion
SELECT * FROM department_log;

-- Insert additional departments
INSERT INTO department 
(name)
VALUES ('IT'), ('HR');

-- View the log after additional insertions
SELECT * FROM department_log;

-- Update department names
UPDATE department 
SET name = 'Information Technology'
WHERE department_id = 2;

UPDATE department
SET name = 'Human Resources'
WHERE department_id = 3;

UPDATE department 
SET name = 'IT Department'
WHERE department_id = 2;

-- Delete a department - it will probably give an error
DELETE FROM department WHERE department_id = 2;

-- View the log after updates and deletion
SELECT * FROM department_log;

-- View logs for a specific department
SELECT * FROM department_log
WHERE department_id = 3;

