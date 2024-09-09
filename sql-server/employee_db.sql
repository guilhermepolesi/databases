-- Create a new database named 'employees'
CREATE DATABASE employees;

-- Switch to the 'employees' database
USE employees;

-- Create a table named 'position' to store job positions
CREATE TABLE position_tb (
  position_id INT NOT NULL IDENTITY(1,1), -- Unique identifier for each position (auto-incremented)
  description_name VARCHAR(45) NOT NULL,       -- Description of the position
  max_salary DECIMAL(8,2) NOT NULL,       -- Maximum salary for the position
  PRIMARY KEY (position_id)               -- Primary key constraint on 'position_id'
);

-- Create a table named 'department' to store departments
CREATE TABLE department_tb (
  department_id INT NOT NULL IDENTITY(1,1), -- Unique identifier for each department (auto-incremented)
  department_name VARCHAR(45) NOT NULL,                -- Name of the department
  PRIMARY KEY (department_id)               -- Primary key constraint on 'department_id'
);

-- Create a table named 'employee' to store employee details
CREATE TABLE employee_tb (
  employee_id INT NOT NULL IDENTITY(1,1), -- Unique identifier for each employee (auto-incremented)
  employee_name VARCHAR(60) NOT NULL,              -- Name of the employee
  salary DECIMAL(8,2) NOT NULL,           -- Salary of the employee
  position_id INT NOT NULL,               -- Foreign key reference to 'position' table
  department_id INT NOT NULL,             -- Foreign key reference to 'department' table
  PRIMARY KEY (employee_id),              -- Primary key constraint on 'employee_id'
  INDEX fk_employee_position_idx (position_id), -- Index on 'position_id' for faster lookups
  INDEX fk_employee_department1_idx (department_id), -- Index on 'department_id' for faster lookups
  CONSTRAINT fk_employee_position FOREIGN KEY (position_id) 
    REFERENCES position_tb (position_id),    -- Foreign key constraint linking 'position_id' to 'position' table
  CONSTRAINT fk_employee_department1 FOREIGN KEY (department_id)
    REFERENCES department_tb (department_id) -- Foreign key constraint linking 'department_id' to 'department' table
);

-- Insert data into the 'position' table
INSERT INTO position_tb (description_name, max_salary)
VALUES ('IT Manager', 10954.00),
       ('Network Administrator', 7087.00),
       ('Systems Analyst', 6882.00),
       ('Information Security Analyst', 5827.00),
       ('Technical Support Manager', 8981.00),
       ('Technical Support Specialist', 4564.00),
       ('IT Technician', 2438.00),
       ('Intern (Penultimate Year)', 1479.00),
       ('Intern (Final Year)', 1636.00);

-- Insert data into the 'department' table
INSERT INTO department_tb (department_name)
VALUES ('Technical Support'),
       ('Infrastructure'),
       ('Information Security'),
       ('Development');
       
-- Insert data into the 'employee' table
INSERT INTO employee_tb 
(employee_name, salary, position_id, department_id)
VALUES 
('John Smith', 8450.50, 1, 4),
('Renato Pereira', 5420.00, 2, 2),
('Maria Garcia', 6680.20, 3, 4),
('Deborah Johnson', 5470.20, 4, 3),
('Mauro Santos', 7690.10, 5, 1),
('Leticia Brown', 3874.90, 6, 1),
('Julio Martinez', 1875.00, 7, 1),
('Augustus Ramirez', 980.00, 8, 1),
('Gustavo Allen', 1200.00, 8, 1),
('Jairo Perry', 1180.00, 8, 2),
('Lucy Hall', 970.00, 8, 2),
('Sara Davis', 1060.00, 8, 1),
('Tyler King', 1480.00, 9, 3),
('Mark Meyer', 1480.00, 9, 4),
('Luis Bell', 1520.00, 9, 4);
