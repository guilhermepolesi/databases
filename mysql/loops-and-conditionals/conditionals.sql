DELIMITER //

CREATE PROCEDURE check_salary(IN emp_id INT)
BEGIN
    DECLARE emp_salary DECIMAL(8,2);
    
    -- Get the salary of the employee based on the provided employee ID
    SELECT salary INTO emp_salary
    FROM employee
    WHERE employee_id = emp_id;
    
    -- Check if the salary is above a certain threshold
    IF emp_salary > 5000 THEN
        SELECT CONCAT('Employee ', emp_id, ' has a high salary of ', emp_salary) AS result;
    ELSE
        SELECT CONCAT('Employee ', emp_id, ' has a salary of ', emp_salary) AS result;
    END IF;
END //

DELIMITER ;

CALL check_salary(1); -- Check salary for employee with ID 1

DELIMITER //

CREATE PROCEDURE evaluate_department_performance(IN dept_id INT)
BEGIN
    DECLARE num_employees INT;
    DECLARE avg_salary DECIMAL(8,2);

    -- Get the number of employees and average salary in the department based on the provided department ID
    SELECT COUNT(*) INTO num_employees
    FROM employee
    WHERE department_id = dept_id;

    SELECT AVG(salary) INTO avg_salary
    FROM employee
    WHERE department_id = dept_id;

    -- Evaluate the department's performance based on the number of employees and average salary
    IF num_employees > 10 AND avg_salary > 7000 THEN
        SELECT 'High Performance' AS performance_evaluation;
    ELSEIF num_employees BETWEEN 5 AND 10 AND avg_salary BETWEEN 5000 AND 7000 THEN
        SELECT 'Moderate Performance' AS performance_evaluation;
    ELSE
        SELECT 'Low Performance' AS performance_evaluation;
    END IF;
END //

DELIMITER ;

-- Example call to the procedure with department ID 1
CALL evaluate_department_performance(1);

