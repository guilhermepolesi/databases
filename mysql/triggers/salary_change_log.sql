-- Create a table to log salary changes
CREATE TABLE salary_change_log (
  id INT(11) NOT NULL AUTO_INCREMENT,          -- Unique identifier for each log entry
  user_name VARCHAR(100) NOT NULL,             -- User who performed the action
  event_time TIMESTAMP NOT NULL,               -- Timestamp of the event
  employee_id INT(11) NOT NULL,                -- ID of the employee whose salary changed
  old_salary DECIMAL(8,2) NOT NULL,            -- Previous salary
  new_salary DECIMAL(8,2) NOT NULL,            -- New salary
  PRIMARY KEY (id)                            -- Primary key constraint on 'id'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Set delimiter to define the trigger
DELIMITER $

-- Trigger for logging salary changes
CREATE TRIGGER after_salary_update
AFTER UPDATE
ON employee
FOR EACH ROW
BEGIN
    -- Check if salary has changed
    IF OLD.salary <> NEW.salary THEN
        -- Insert a log entry for the salary change
        INSERT INTO salary_change_log
        (user_name, event_time, employee_id, old_salary, new_salary)
        VALUES
        (USER(), NOW(), OLD.employee_id, OLD.salary, NEW.salary);
    END IF;
END$
-- Reset delimiter
DELIMITER ;

-- Insert a new employee into the employee table
INSERT INTO employee (name, salary, position_id, department_id)
VALUES ('Alice Johnson', 5000.00, 1, 2);

-- View the log after the insertion
SELECT * FROM log_employee;

-- Update the employee's salary
UPDATE employee
SET salary = 5500.00
WHERE employee_id = 3;

-- View the salary change log after the update
SELECT * FROM salary_change_log;

-- Update the salary of another employee
UPDATE employee
SET salary = 6000.00
WHERE employee_id = 2;

-- View the salary change log after the update
SELECT * FROM salary_change_log;

