-- Create a table to log department transfers
CREATE TABLE department_transfer_log (
  id INT(11) NOT NULL AUTO_INCREMENT,          -- Unique identifier for each log entry
  user_name VARCHAR(100) NOT NULL,             -- User who performed the action
  event_time TIMESTAMP NOT NULL,               -- Timestamp of the event
  employee_id INT(11) NOT NULL,                -- ID of the employee transferred
  old_department_id INT(11) NOT NULL,          -- Previous department ID
  new_department_id INT(11) NOT NULL,          -- New department ID
  PRIMARY KEY (id)                            -- Primary key constraint on 'id'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Set delimiter to define the trigger
DELIMITER $

-- Trigger for logging department transfers
CREATE TRIGGER after_department_change
AFTER UPDATE
ON employee
FOR EACH ROW
BEGIN
    -- Check if department has changed
    IF OLD.department_id <> NEW.department_id THEN
        -- Insert a log entry for the department change
        INSERT INTO department_transfer_log
        (user_name, event_time, employee_id, old_department_id, new_department_id)
        VALUES
        (USER(), NOW(), OLD.employee_id, OLD.department_id, NEW.department_id);
    END IF;
END$
-- Reset delimiter
DELIMITER ;

-- Insert a new employee into the employee table
INSERT INTO employee (name, salary, position_id, department_id)
VALUES ('Bob Brown', 6000.00, 2, 3);

-- View the log after the insertion
SELECT * FROM log_employee;

-- Update the department of an employee
UPDATE employee
SET department_id = 5
WHERE employee_id = 5;

-- View the department transfer log after the update
SELECT * FROM department_transfer_log;

-- Update the department of another employee
UPDATE employee
SET department_id = 3
WHERE employee_id = 3;

-- View the department transfer log after the update
SELECT * FROM department_transfer_log;

