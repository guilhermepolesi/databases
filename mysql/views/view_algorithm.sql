-- Create or replace a view named 'vw_001' with specified columns
-- This view includes only employees with a salary less than 5000
CREATE OR REPLACE 
    VIEW vw_01 (employee_id, name, salary)
    AS
        SELECT f.employee_id, f.name, f.salary
        FROM employee f
        WHERE f.salary < 5000
    WITH CHECK OPTION;

-- Create or replace the same view 'vw_001' as above
-- This appears to be a duplicate of the previous view creation
CREATE OR REPLACE 
VIEW vw_01 (employee_id, name, salary)
AS
    SELECT f.employee_id, f.name, f.salary
    FROM employee f
    WHERE f.salary < 5000
WITH CHECK OPTION;

-- Create a view named 'vw_001' with specific column names and additional options
-- Uses 'UNDEFINED' algorithm and 'SQL SECURITY DEFINER'
-- 'WITH CASCADED CHECK OPTION' is used to ensure that any modifications meet the view's criteria
CREATE OR REPLACE ALGORITHM=UNDEFINED DEFINER=`user`@`localhost` 
SQL SECURITY DEFINER 
VIEW `vw_01` AS 
SELECT `f`.`employee_id` AS `employee_id`,
       `f`.`name` AS `name`,
       `f`.`salary` AS `salary` 
FROM `employee` `f` 
WHERE `f`.`salary` < 5000 
WITH CASCADED CHECK OPTION;

-- Create or replace a view named 'vw_002' with the 'MERGE' algorithm
-- The 'MERGE' algorithm allows the view to be merged with the underlying table
CREATE OR REPLACE ALGORITHM=MERGE
VIEW vw_02 (employee_id, name, salary)
AS
    SELECT f.employee_id, f.name, f.salary
    FROM employee f
    WHERE f.salary < 5000
WITH CHECK OPTION;

-- Create or replace a view named 'vw_003' to calculate the average salary
-- The view includes only salaries less than 5000
-- The 'MERGE' algorithm is used here as well
-- WARNING: The use of 'WITH CHECK OPTION' on a view with aggregation functions (e.g., AVG) is invalid.
-- This will result in an ERROR 1368 (HY000): CHECK OPTION on non-updatable view 'employees.vw_003'
CREATE OR REPLACE ALGORITHM=MERGE
VIEW vw_03 (average_salary)
AS
    SELECT AVG(f.salary)
    FROM employee f
    WHERE f.salary < 5000
WITH CHECK OPTION;

-- Create or replace a view named 'vw_004' combining two different queries using UNION ALL
-- This view shows employee IDs and names from 'employee' table and position IDs and descriptions from 'position' table
CREATE OR REPLACE ALGORITHM=MERGE
VIEW vw_04 
AS
    SELECT f.employee_id, f.name
    FROM employee f
    UNION ALL
    SELECT c.position_id, c.description
    FROM position c;

-- Warning message indicating that the 'MERGE' algorithm cannot be used for this view
-- 0 row(s) affected, 1 warning(s): 
-- 1354 View merge algorithm can't be used here for now 
-- (assumed undefined algorithm)

