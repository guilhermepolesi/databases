USE employees;

-- Select employee_id and employee_name from employee_tb where employee_id is in specific values 
-- and the position_id exists in the position_tb table
SELECT e.employee_id, e.employee_name
FROM employee_tb e
WHERE e.department_id IN (1, 2, 3) AND
EXISTS (SELECT 1 FROM position_tb p
        WHERE p.position_id = e.position_id);

-- Select employee_id and employee_name from employee_tb where department_id is in specific values 
-- and the position_id does not exist in the position_tb table
SELECT e.employee_id, e.employee_name
FROM employee_tb e
WHERE e.department_id IN (1, 2, 3) AND
NOT EXISTS (SELECT 1 FROM position_tb p
            WHERE p.position_id = e.position_id);

-- Select employee_id and employee_name from employee_tb where position_id is in specific values 
-- and the department_id does not exist in the department_tb table
SELECT e.employee_id, e.employee_name
FROM employee_tb e
WHERE e.position_id IN (1, 2, 3) AND
NOT EXISTS (SELECT 1 FROM department_tb d
            WHERE d.department_id = e.department_id);

