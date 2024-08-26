-- Create a table to log position changes
CREATE TABLE position_change_log (
  id INT(11) NOT NULL AUTO_INCREMENT,          -- Unique identifier for each log entry
  user_name VARCHAR(100) NOT NULL,             -- User who performed the action
  event_time TIMESTAMP NOT NULL,               -- Timestamp of the event
  employee_id INT(11) NOT NULL,                -- ID of the employee whose position changed
  old_position_id INT(11) NOT NULL,            -- Previous position ID
  new_position_id INT(11) NOT NULL,            -- New position ID
  PRIMARY KEY (id)                            -- Primary key constraint on 'id'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Set delimiter to define the trigger
DELIMITER $

-- Trigger for logging position changes
CREATE TRIGGER after_position_change
AFTER UPDATE
ON employee
FOR EACH ROW
BEGIN
    -- Check if position has changed
    IF OLD.position_id <> NEW.position_id THEN
        -- Insert a log entry for the position change
        INSERT INTO position_change_log
        (user_name, event_time, employee_id, old_position_id, new_position_id)
        VALUES
        (USER(), NOW(), OLD.employee_id, OLD.position_id, NEW.position_id);
    END IF;
END$
-- Reset delimiter
DELIMITER ;

-- Insert a new position
INSERT INTO position (description, max_salary)
VALUES ('Developer', 5000.00);

-- Insert a new employee with the new position
INSERT INTO employee (name, salary, position_id, department_id)
VALUES ('Carol White', 7000.00, 1, 1);

-- View the log after the insertion
SELECT * FROM log_employee;

-- Update the position of an employee
UPDATE employee
SET position_id = 2
WHERE employee_id = 1;

-- View the position change log after the update
SELECT * FROM position_change_log;

