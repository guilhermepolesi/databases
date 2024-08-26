-- Drop the procedure if it exists
DROP PROCEDURE IF EXISTS add_position;

-- Define the procedure
DELIMITER //

CREATE PROCEDURE add_position(
    IN p_position_id INT,             -- Input parameter for position ID
    IN p_description VARCHAR(45),    -- Input parameter for position description
    IN p_max_salary DECIMAL(8,2),    -- Input parameter for maximum salary for the position
    OUT p_message VARCHAR(80)        -- Output parameter for returning a message
)
BEGIN
    DECLARE v_exists INT DEFAULT 0;  -- Variable to check if the position already exists

    -- Check if the position with the given ID already exists
    SELECT COUNT(*) INTO v_exists
    FROM position
    WHERE position_id = p_position_id;

    -- If the position does not exist, insert it into the table
    IF v_exists = 0 THEN
        INSERT INTO position (position_id, description, max_salary)
        VALUES (p_position_id, p_description, p_max_salary);

        -- Set the message to indicate success
        SET p_message = 'POSITION SUCCESSFULLY ADDED!!!';
    ELSE
        -- Set the message to indicate that the position already exists
        SET p_message = 'POSITION ALREADY EXISTS!!!';
    END IF;
END //

DELIMITER ;

-- Example of how to call the procedure
-- Define a variable to hold the output message
SET @result_message = '';

-- Call the procedure with sample data
CALL add_position(10, 'Database Administrator', 7500.00, @result_message);

-- Display the result message
SELECT @result_message;

