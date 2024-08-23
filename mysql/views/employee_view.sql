-- Create a view named 'employee_department_view' to show employees and their associated departments
CREATE VIEW employee_department_view AS
SELECT e.employee_id,        -- Employee ID from the 'employee' table
       e.name,               -- Employee name from the 'employee' table
       e.salary,            -- Employee salary from the 'employee' table
       e.department_id,     -- Department ID from the 'employee' table
       d.name AS department_name -- Department name from the 'department' table, aliased as 'department_name'
FROM employee e
INNER JOIN department d ON d.department_id = e.department_id -- Join 'employee' with 'department' on 'department_id'
WHERE e.department_id IN (1, 4); -- Filter to include only employees in departments with IDs 1 and 4

-- Display all tables in the current database
SHOW TABLES;

-- Query the 'employee_department_view' view to get names and department names for employees in department 1
SELECT ed.name, ed.department_name 
FROM employee_department_view ed
WHERE ed.department_id = 1;

-- Create or replace a view named 'high_salary_positions_view' to show positions with a maximum salary of 6000 or more
CREATE OR REPLACE VIEW high_salary_positions_view
AS SELECT p.position_id,      -- Position ID from the 'position' table
       p.description,       -- Position description from the 'position' table
       p.max_salary         -- Maximum salary for the position from the 'position' table
FROM position p
WHERE p.max_salary >= 6000; -- Filter to include only positions with a maximum salary of 6000 or more

-- Query the 'high_salary_positions_view' view to display all positions with high salaries
SELECT * FROM high_salary_positions_view;

-- Attempt to insert data into 'high_salary_positions_view'
-- This statement will fail because you cannot insert into a view that is based on a SELECT statement with restrictions
INSERT INTO high_salary_positions_view
(position_id, description, max_salary)
VALUES (100, 'Junior Developer', 2000);

-- Query the 'high_salary_positions_view' view again to verify contents
SELECT * FROM high_salary_positions_view;

-- Query the original 'position' table to verify its contents
SELECT * FROM position;

-- Attempt to delete data from 'high_salary_positions_view'
-- This statement will fail because you cannot delete from a view that is based on a SELECT statement with restrictions
DELETE FROM high_salary_positions_view
WHERE position_id = 100;

-- Drop the 'high_salary_positions_view' view from the database
DROP VIEW high_salary_positions_view;

-- Recreate the 'high_salary_positions_view' view with the 'WITH CHECK OPTION'
-- The 'WITH CHECK OPTION' ensures that any modifications through the view must meet the view's condition
CREATE OR REPLACE VIEW high_salary_positions_view
AS SELECT p.position_id,      -- Position ID from the 'position' table
       p.description,       -- Position description from the 'position' table
       p.max_salary         -- Maximum salary for the position from the 'position' table
FROM position p
WHERE p.max_salary >= 6000  -- Filter to include only positions with a maximum salary of 6000 or more
WITH CHECK OPTION;          -- Enforces that any updates or inserts must satisfy the view's WHERE condition

-- Attempt to insert data into 'high_salary_positions_view' that does not meet the view's condition
-- This will fail due to the 'WITH CHECK OPTION' constraint
INSERT INTO high_salary_positions_view
(position_id, description, max_salary)
VALUES (101, 'Intern', 1200);

-- Error Code: 1369. 
-- CHECK OPTION failed `employees`.`high_salary_positions_view`

