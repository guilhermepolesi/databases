-- Create a table to log changes to employees
CREATE TABLE log_employee (
  id INT(11) NOT NULL AUTO_INCREMENT,          -- Unique identifier for each log entry
  user_name VARCHAR(100) NOT NULL,             -- User who performed the action
  event_time TIMESTAMP NOT NULL,               -- Timestamp of the event
  event_type ENUM('Insert', 'Update', 'Delete') NOT NULL, -- Type of event (Insert, Update, Delete)
  employee_id INT(11) NOT NULL,                -- ID of the employee affected
  name VARCHAR(60) NOT NULL,                   -- Name of the employee affected
  salary DECIMAL(8,2) NOT NULL,                -- Salary of the employee affected
  position_id INT(11) NOT NULL,                -- ID of the position of the employee
  department_id INT(11) NOT NULL,              -- ID of the department of the employee
  PRIMARY KEY (id)                            -- Primary key constraint on 'id'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Set delimiter to define the trigger
DELIMITER $

-- Trigger for logging insertions into the employee table
CREATE TRIGGER after_insert_employee
AFTER INSERT
ON employee
FOR EACH ROW
BEGIN
    -- Insert a log entry for the new employee
    INSERT INTO log_employee
    (user_name, event_time, event_type, employee_id, name, salary, position_id, department_id)
    VALUES
    (USER(), NOW(), 'Insert', NEW.employee_id, NEW.name, NEW.salary, NEW.position_id, NEW.department_id);
END$
-- Reset delimiter
DELIMITER ;

-- Set delimiter to define the trigger
DELIMITER $

-- Trigger for logging updates to the employee table
CREATE TRIGGER after_update_employee
AFTER UPDATE
ON employee
FOR EACH ROW
BEGIN
    -- Insert a log entry for the updated employee
    INSERT INTO log_employee
    (user_name, event_time, event_type, employee_id, name, salary, position_id, department_id)
    VALUES
    (USER(), NOW(), 'Update', NEW.employee_id, NEW.name, NEW.salary, NEW.position_id, NEW.department_id);
END$
-- Reset delimiter
DELIMITER ;

-- Set delimiter to define the trigger
DELIMITER $

-- Trigger for logging deletions from the employee table
CREATE TRIGGER after_delete_employee
AFTER DELETE
ON employee
FOR EACH ROW
BEGIN
    -- Insert a log entry for the deleted employee
    INSERT INTO log_employee
    (user_name, event_time, event_type, employee_id, name, salary, position_id, department_id)
    VALUES
    (USER(), NOW(), 'Delete', OLD.employee_id, OLD.name, OLD.salary, OLD.position_id, OLD.department_id);
END$
-- Reset delimiter
DELIMITER ;

-- Insert a new employee into the employee table
INSERT INTO employee (name, salary, position_id, department_id)
VALUES ('Alice Johnson', 5000.00, 1, 2);

-- View the log after the insertion
SELECT * FROM log_employee;

-- Insert additional employees
INSERT INTO employee
(name, salary, position_id, department_id)
VALUES
('Bob Brown', 6000.00, 2, 3),
('Carol White', 7000.00, 3, 1);

-- View the log after additional insertions
SELECT * FROM log_employee;

-- Update employee details
UPDATE employee
SET salary = 5500.00
WHERE employee_id = 1;

UPDATE employee
SET name = 'Robert Brown'
WHERE employee_id = 2;

-- Delete an employee - it might succeed or fail based on referential integrity
DELETE FROM employee WHERE employee_id = 1;

-- View the log after updates and deletion
SELECT * FROM log_employee;

-- View logs for a specific employee
SELECT * FROM log_employee
WHERE employee_id = 2;

