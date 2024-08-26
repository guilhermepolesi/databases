DELIMITER //

CREATE FUNCTION get_total_employees_by_department(dept_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_employees INT;
    
    -- Count the number of employees in the given department ID
    SELECT COUNT(*) INTO total_employees
    FROM employee
    WHERE department_id = dept_id;
    
    RETURN total_employees;
END //

DELIMITER ;

SELECT get_total_employees_by_department(1) AS total_employees;

