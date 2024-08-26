DELIMITER //

CREATE PROCEDURE list_high_salary_employees(IN dept_id INT, IN min_salary DECIMAL(8,2))
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE emp_id INT;
    DECLARE emp_name VARCHAR(60);
    DECLARE emp_salary DECIMAL(8,2);

    -- Declare a cursor to iterate over employees
    DECLARE emp_cursor CURSOR FOR
        SELECT employee_id, name, salary
        FROM employee
        WHERE department_id = dept_id;
    
    -- Declare a handler to set `done` to 1 when the cursor reaches the end
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Open the cursor
    OPEN emp_cursor;

    -- Loop through the cursor
    REPEAT
        -- Fetch the next row into variables
        FETCH emp_cursor INTO emp_id, emp_name, emp_salary;

        -- Check if the salary is above the minimum salary
        IF emp_salary > min_salary THEN
            SELECT emp_id AS EmployeeID, emp_name AS EmployeeName, emp_salary AS Salary;
        END IF;
        
    UNTIL done END REPEAT;

    -- Close the cursor
    CLOSE emp_cursor;
END //

DELIMITER ;

-- Call the procedure to list employees in department 1 with a salary greater than 5000
CALL list_high_salary_employees(1, 5000);

