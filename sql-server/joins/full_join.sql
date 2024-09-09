USE employees;

-- Query 1: Retrieve all employees and all departments
-- This query uses FULL JOIN to include all employees and all departments.
-- If there is no corresponding department for an employee, department_name will be NULL, and vice versa.
SELECT 
    employee_tb.employee_name AS employee_name,     -- Employee's name
    department_tb.department_name AS department_name  -- Department's name
FROM 
    employee_tb
FULL JOIN 
    department_tb ON employee_tb.department_id = department_tb.department_id;  -- Join condition on department ID

-- Query 2: Retrieve all job positions and employees, including unoccupied positions and employees without positions
-- This query uses FULL JOIN to include all positions and all employees.
-- If there is no employee for a position, employee_name will be NULL, and vice versa.
SELECT 
    position_tb.description_name AS position_description,  -- Job position description
    employee_tb.employee_name AS employee_name  -- Employee's name
FROM 
    position_tb
FULL JOIN 
    employee_tb ON position_tb.position_id = employee_tb.position_id;  -- Join condition on position ID

-- Query 3: Retrieve all departments and employees, including departments without employees and employees without departments
-- This query uses FULL JOIN to include all departments and all employees.
-- If a department has no employees, employee_name will be NULL, and vice versa.
SELECT 
    department_tb.department_name AS department_name,  -- Department's name
    employee_tb.employee_name AS employee_name  -- Employee's name
FROM 
    department_tb
FULL JOIN 
    employee_tb ON department_tb.department_id = employee_tb.department_id;  -- Join condition on department ID

