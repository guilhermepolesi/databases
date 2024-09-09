USE employees;

-- Query 1: Average salary by department, including departments without employees
-- This query uses LEFT JOIN to include all departments, even if no employees are assigned.
-- Departments without employees will have NULL for average_salary.
SELECT 
    department_tb.department_name AS department_name,  -- Department's name
    AVG(employee_tb.salary) AS average_salary  -- Average salary of employees in the department
FROM 
    department_tb
LEFT JOIN 
    employee_tb ON department_tb.department_id = employee_tb.department_id  -- Join condition on department ID
GROUP BY 
    department_tb.department_name;  -- Group by department name

-- Query 2: Total number of employees in each position, including positions without employees
-- This query uses LEFT JOIN to include all positions, even if no employees are assigned to them.
-- Positions without employees will have a count of 0.
SELECT 
    position_tb.description_name AS position_description,  -- Job position description
    COUNT(employee_tb.employee_id) AS total_employees  -- Total number of employees in the position
FROM 
    position_tb
LEFT JOIN 
    employee_tb ON position_tb.position_id = employee_tb.position_id  -- Join condition on position ID
GROUP BY 
    position_tb.description_name;  -- Group by position description

-- Query 3: Total salary paid by each department, including departments without employees
-- This query uses LEFT JOIN to include all departments, even if no employees are assigned to them.
-- Departments without employees will show a total salary of 0.
SELECT 
    department_tb.department_name AS department_name,  -- Department's name
    COALESCE(SUM(employee_tb.salary), 0) AS total_salary  -- Total salary paid for the department
FROM 
    department_tb
LEFT JOIN 
    employee_tb ON department_tb.department_id = employee_tb.department_id  -- Join condition on department ID
GROUP BY 
    department_tb.department_name;  -- Group by department name
