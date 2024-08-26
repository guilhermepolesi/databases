-- Select employee details and classify their salary into categories
SELECT
    name,  -- Employee's name
    salary,  -- Employee's salary
    CASE
        -- Classify salary as 'High Salary' if it is greater than 7000
        WHEN salary > 7000 THEN 'High Salary'
        -- Classify salary as 'Moderate Salary' if it is between 5001 and 7000 (inclusive)
        WHEN salary BETWEEN 5001 AND 7000 THEN 'Moderate Salary'
        -- Classify all other salaries as 'Low Salary'
        ELSE 'Low Salary'
    END AS salary_classification  -- Label the resulting column as 'salary_classification'
FROM employee;  -- Retrieve data from the 'employee' table

-- Select employee details along with their position classification based on max salary of the position
SELECT
    e.name,  -- Employee's name
    p.description AS position,  -- Position description from the 'position' table
    e.salary,  -- Employee's salary
    CASE
        -- Classify position as 'High Salary Position' if the max salary for the position is greater than 10000
        WHEN p.max_salary > 10000 THEN 'High Salary Position'
        -- Classify position as 'Medium Salary Position' if the max salary is between 6000 and 10000 (inclusive)
        WHEN p.max_salary BETWEEN 6000 AND 10000 THEN 'Medium Salary Position'
        -- Classify all other positions as 'Low Salary Position'
        ELSE 'Low Salary Position'
    END AS position_salary_classification  -- Label the resulting column as 'position_salary_classification'
FROM employee e
JOIN position p ON e.position_id = p.position_id;  -- Join 'employee' and 'position' tables on position_id

