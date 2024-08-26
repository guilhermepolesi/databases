-- Drop the procedure if it exists
DROP PROCEDURE IF EXISTS update_salaries_until_target;

-- Define the procedure
DELIMITER //

CREATE PROCEDURE update_salaries_until_target(
    IN p_department_id INT,            -- Input parameter for department ID
    IN p_target_avg_salary DECIMAL(8,2) -- Target average salary
)
BEGIN
    DECLARE v_current_avg_salary DECIMAL(8,2); -- Variable to hold current average salary
    DECLARE v_salary_increment DECIMAL(8,2) DEFAULT 100.00; -- Increment amount for salaries
    DECLARE v_done INT DEFAULT 0; -- Variable to control the loop

    -- Calculate the current average salary of the department
    SELECT AVG(salary) INTO v_current_avg_salary
    FROM employee
    WHERE department_id = p_department_id;

    -- Repeat until the average salary is greater than or equal to the target average salary
    REPEAT
        -- Update salaries of all employees in the department
        UPDATE employee
        SET salary = salary + v_salary_increment
        WHERE department_id = p_department_id;

        -- Recalculate the average salary
        SELECT AVG(salary) INTO v_current_avg_salary
        FROM employee
        WHERE department_id = p_department_id;

        -- Check if the current average salary meets or exceeds the target
        IF v_current_avg_salary >= p_target_avg_salary THEN
            SET v_done = 1;
        END IF;

    UNTIL v_done = 1
    END REPEAT;

    -- Optional: Notify the completion of the procedure
    SELECT CONCAT('Salaries updated. Current average salary: ', v_current_avg_salary) AS message;
END //

DELIMITER ;

-- Example of how to call the procedure
-- Call the procedure to update salaries in department 1 until the average salary is at least 5000.00
CALL update_salaries_until_target(1, 5000.00);

