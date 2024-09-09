USE employees;

-- Query 1: Retrieve all employees and their departments, including employees without a department
-- This query uses RIGHT JOIN to include all departments, even if no employees are assigned to them.
-- Employees without a department will have NULL values for department_name.
SELECT 
    employee_tb.employee_name AS employee_name,   -- Employee's name
    department_tb.department_name AS department_name  -- Department's name
FROM 
    department_tb
RIGHT JOIN 
    employee_tb ON employee_tb.department_id = department_tb.department_id;  -- Join condition on department ID

-- Query 2: Retrieve all departments and the employees assigned to them, including departments without employees
-- This query uses RIGHT JOIN to include all employees, even if they are not assigned to any department.
-- Departments without employees will have NULL values for employee_name.
SELECT 
    department_tb.department_name AS department_name,  -- Department's name
    employee_tb.employee_name AS employee_name  -- Employee's name
FROM 
    employee_tb
RIGHT JOIN 
    department_tb ON department_tb.department_id = employee_tb.department_id;  -- Join condition on department ID

-- Query 3: Retrieve all job positions and the employees assigned to them, including positions that are not yet occupied
-- This query uses RIGHT JOIN to include all positions, even if they have no employees assigned.
-- Positions with no employees will have NULL values for employee_name.
SELECT 
    position_tb.description_name AS position_description,  -- Job position description
    employee_tb.employee_name AS employee_name  -- Employee's name
FROM 
    position_tb
RIGHT JOIN 
    employee_tb ON position_tb.position_id = employee_tb.position_id;  -- Join condition on position ID

