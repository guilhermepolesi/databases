USE employees;

-- Query 1: Find employees with salary above the average salary
-- The inner query calculates the average salary of all employees.
-- The outer query retrieves employees whose salary is above this average.
SELECT 
    employee_name,    -- Employee's name
    salary            -- Employee's salary
FROM 
    employee_tb
WHERE 
    salary > (SELECT AVG(salary) FROM employee_tb);  -- Subquery to find average salary

-- Query 2: Find departments with more than two employees
-- The inner query counts the number of employees in each department.
-- The outer query retrieves department names where the employee count is greater than 2.
SELECT 
    department_name  -- Department's name
FROM 
    department_tb
WHERE 
    department_id IN (  -- Filter departments based on the result of the subquery
        SELECT 
            department_id 
        FROM 
            employee_tb 
        GROUP BY 
            department_id 
        HAVING 
            COUNT(employee_id) > 2  -- Subquery to count employees per department
    );

-- Query 3: Retrieve employees with the highest salary in each department
-- The inner query finds the maximum salary in each department.
-- The outer query retrieves employees whose salary matches this maximum salary.
SELECT 
    e.employee_name,    -- Employee's name
    e.salary,           -- Employee's salary
    d.department_name   -- Department's name
FROM 
    employee_tb e
INNER JOIN 
    department_tb d ON e.department_id = d.department_id
WHERE 
    e.salary = (  -- Subquery to find the highest salary in the employee's department
        SELECT 
            MAX(salary) 
        FROM 
            employee_tb 
        WHERE 
            department_id = e.department_id
    );
