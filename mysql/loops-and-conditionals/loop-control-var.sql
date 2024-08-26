DELIMITER //

CREATE PROCEDURE calculate_salary_sum(IN max_employees INT)
BEGIN
    DECLARE total_salary DECIMAL(10,2) DEFAULT 0;
    DECLARE employee_count INT DEFAULT 0;
    DECLARE emp_id INT;
    DECLARE emp_salary DECIMAL(8,2);

    -- Declare a cursor to iterate over employees
    DECLARE emp_cursor CURSOR FOR
        SELECT employee_id, salary
        FROM employee;
    
    -- Declare a handler to handle the end of the cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET employee_count = max_employees;
    
    -- Open the cursor
    OPEN emp_cursor;

    -- Initialize employee count
    SET employee_count = 0;
    
    -- Loop to sum up salaries
    read_loop: LOOP
        FETCH emp_cursor INTO emp_id, emp_salary;
        
        -- Exit loop if the required number of employees is processed
        IF employee_count >= max_employees THEN
            LEAVE read_loop;
        END IF;

        -- Add the salary to the total
        SET total_salary = total_salary + emp_salary;
        SET employee_count = employee_count + 1;
    END LOOP;
    
    -- Close the cursor
    CLOSE emp_cursor;
    
    -- Return the total salary
    SELECT total_salary AS TotalSalary;
END //

DELIMITER ;

-- Call the procedure to calculate the sum of salaries for the first 5 employees
CALL calculate_salary_sum(5);

