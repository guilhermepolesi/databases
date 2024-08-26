-- Define the CTE to calculate the factorial
WITH RECURSIVE FactorialCTE AS (
    -- Anchor member: base case for factorial (0! = 1)
    SELECT 1 AS n, 1 AS factorial

    UNION ALL

    -- Recursive member: compute the factorial for n > 1
    SELECT f.n + 1 AS n, factorial * (f.n + 1) AS factorial
    FROM FactorialCTE f
    WHERE f.n < 5  -- Stop recursion when n reaches the target number
)
-- Select the result where n is the target number
SELECT factorial
FROM FactorialCTE
WHERE n = 5;

