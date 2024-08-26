DELIMITER //

CREATE FUNCTION get_total_salary_by_department(dept_id INT)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    DECLARE total_salary DECIMAL(12,2);
    
    -- Calculate the total salary for the given department ID
    SELECT SUM(salary) INTO total_salary
    FROM employee
    WHERE department_id = dept_id;
    
    RETURN total_salary;
END //

DELIMITER ;

SELECT get_total_salary_by_department(1) AS total_salary;

