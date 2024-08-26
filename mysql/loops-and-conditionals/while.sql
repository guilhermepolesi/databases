DELIMITER //

CREATE PROCEDURE update_salary_until(IN emp_id INT, IN target_salary DECIMAL(8,2), IN increment DECIMAL(8,2))
BEGIN
    DECLARE current_salary DECIMAL(8,2);
    
    -- Get the current salary of the employee
    SELECT salary INTO current_salary
    FROM employee
    WHERE employee_id = emp_id;
    
    -- Use WHILE loop to increment salary until it reaches the target
    WHILE current_salary < target_salary DO
        -- Increase the salary by the increment value
        SET current_salary = current_salary + increment;
        
        -- Update the salary in the employee table
        UPDATE employee
        SET salary = current_salary
        WHERE employee_id = emp_id;
    END WHILE;
    
    -- Return the updated salary
    SELECT salary AS UpdatedSalary
    FROM employee
    WHERE employee_id = emp_id;
END //

DELIMITER ;

-- Call the procedure to update salary of employee with ID 1 until it reaches 6000, incrementing by 100
CALL update_salary_until(1, 6000, 100);

