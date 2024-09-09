USE employees;

-- Query 1: Retrieve all employees and their departments, including employees without a department
-- This query uses LEFT JOIN to include all employees, even those who do not have a department assigned.
-- If an employee is not assigned to a department, the department_name will be NULL.
SELECT 
    employee_tb.employee_name AS employee_name, 
    department_tb.department_name AS department_name
FROM 
    employee_tb
LEFT JOIN 
    department_tb ON employee_tb.department_id = department_tb.department_id;

-- Query 2: Retrieve all departments and the employees assigned to them, including departments without employees
-- This query uses LEFT JOIN to include all departments, even if no employees are assigned to them.
-- Departments without employees will have NULL values for employee_name.
SELECT 
    department_tb.department_name AS department_name, 
    employee_tb.employee_name AS employee_name
FROM 
    department_tb
LEFT JOIN 
    employee_tb ON department_tb.department_id = employee_tb.department_id;

-- Query 3: Retrieve all job positions and the employees assigned to them, including positions that are not yet occupied
-- This query uses LEFT JOIN to include all job positions, even if they have no employees assigned.
-- Positions with no employees will have NULL values for employee_name.
SELECT 
    position_tb.description_name AS position_description, 
    employee_tb.employee_name AS employee_name
FROM 
    position_tb
LEFT JOIN 
    employee_tb ON position_tb.position_id = employee_tb.position_id;
