DELIMITER //

CREATE FUNCTION get_average_salary(dept_id INT)
RETURNS DECIMAL(8,2)
DETERMINISTIC
BEGIN
    DECLARE avg_salary DECIMAL(8,2);
    
    -- Calculate the average salary for the given department ID
    SELECT AVG(salary) INTO avg_salary
    FROM employee
    WHERE department_id = dept_id;
    
    RETURN avg_salary;
END //

DELIMITER ;

-- Usage example:
SELECT get_average_salary(1) AS average_salary;

