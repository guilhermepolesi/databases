USE employees;

-- Query 1: Retrieve employee names, their positions, and departments
-- This query joins the 'employee_tb' table with the 'position_tb' and 'department_tb' tables 
-- to display the employee names along with their job descriptions and department names.
SELECT 
    employee_tb.employee_name AS employee_name, 
    position_tb.description_name AS position_description, 
    department_tb.department_name AS department_name
FROM 
    employee_tb
INNER JOIN 
    position_tb ON employee_tb.position_id = position_tb.position_id
INNER JOIN 
    department_tb ON employee_tb.department_id = department_tb.department_id;

-- Query 2: Retrieve employees with a salary greater than 5000, along with their job positions
-- This query joins the 'employee_tb' table with the 'position_tb' table and filters out employees
-- who have a salary higher than 5000.
SELECT 
    employee_tb.employee_name AS employee_name, 
    employee_tb.salary, 
    position_tb.description_name AS position_description
FROM 
    employee_tb
INNER JOIN 
    position_tb ON employee_tb.position_id = position_tb.position_id
WHERE 
    employee_tb.salary > 5000;

-- Query 3: Retrieve the departments and count of employees in each department
-- This query joins the 'department_tb' table with the 'employee_tb' table, 
-- and then uses an aggregate function to count the number of employees per department.
SELECT 
    department_tb.department_name AS department_name, 
    COUNT(employee_tb.employee_id) AS employee_count
FROM 
    department_tb
INNER JOIN 
    employee_tb ON department_tb.department_id = employee_tb.department_id
GROUP BY 
    department_tb.department_name;
