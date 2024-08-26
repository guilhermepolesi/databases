DELIMITER //

CREATE PROCEDURE increase_salaries(IN dept_id INT, IN percentage DECIMAL(5,2))
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE emp_id INT;
    DECLARE emp_salary DECIMAL(8,2);
    DECLARE new_salary DECIMAL(8,2);

    -- Declare a cursor to iterate over employees
    DECLARE emp_cursor CURSOR FOR
        SELECT employee_id, salary
        FROM employee
        WHERE department_id = dept_id;

    -- Declare a handler to set `done` to 1 when the cursor reaches the end
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Open the cursor
    OPEN emp_cursor;

    -- Loop through the cursor
    read_loop: LOOP
        -- Fetch the next row into variables
        FETCH emp_cursor INTO emp_id, emp_salary;
        
        -- If done, exit the loop
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Calculate the new salary
        SET new_salary = emp_salary * (1 + percentage / 100);

        -- Update the employee's salary
        UPDATE employee
        SET salary = new_salary
        WHERE employee_id = emp_id;
        
    END LOOP;

    -- Close the cursor
    CLOSE emp_cursor;
END //

DELIMITER ;

-- Call the procedure to increase salaries of employees in department 1 by 10%
CALL increase_salaries(1, 10);

