-- Select all columns from genre table and order by name
SELECT *
FROM genre
ORDER BY name;

-- Select specific columns (genre_id, Name) from genre table and order by name
SELECT genre_id, name
FROM genre
ORDER BY name;

-- Select specific columns from genre table and order by genre_id
SELECT g.genre_id, g.name
FROM genre g
ORDER BY g.name;

-- Select specific columns from genre table and order by genre_id
SELECT g.genre_id, g.name
FROM genre g
ORDER BY g.genre_id;

-- Select specific columns from genre table where genre_id is between 10 and 20 and order by genre_id
SELECT g.genre_id, g.name
FROM genre g
WHERE g.genre_id >= 10 AND g.genre_id <= 20
ORDER BY g.genre_id;

-- Select specific columns from genre table where genre_id is between 10 and 20 (using BETWEEN) and order by genre_id
SELECT g.genre_id, g.name
FROM genre g
WHERE g.genre_id BETWEEN 10 AND 20
ORDER BY g.genre_id;

-- Select specific columns from genre table where genre_id matches specific values and order by genre_id
SELECT g.genre_id, g.name
FROM genre g
WHERE g.genre_id = 10 OR
      g.genre_id = 15 OR
      g.genre_id = 20 OR
      g.genre_id = 25 
ORDER BY g.genre_id;

-- Select specific columns from genre table where genre_id is in a list of values and order by genre_id
SELECT g.genre_id, g.name
FROM genre g
WHERE g.genre_id IN (10, 15, 20, 25)
ORDER BY g.genre_id;

-- Select specific columns from genre table and join with genre_series table to include related data, ordering by genre_id
SELECT g.genre_id, g.name
FROM genre g
INNER JOIN genre_series gs ON gs.genre_id = g.genre_id
ORDER BY g.genre_id;

-- Select specific columns from genre table and left join with genre_series table to include all genres, ordering by genre_id
SELECT g.genre_id, g.name
FROM genre g
LEFT JOIN genre_series gs ON gs.genre_id = g.genre_id
ORDER BY g.genre_id;

-- Select specific columns from genre table and left join with genre_series table to include all genres and related series, ordering by genre_id
SELECT g.genre_id, g.name, gs.series_id
FROM genre g
LEFT JOIN genre_series gs ON gs.genre_id = g.genre_id
ORDER BY g.genre_id;

-- Select specific columns from genre table and left join with genre_series table using USING clause, ordering by genre_id
SELECT g.genre_id, g.name, gs.series_id
FROM genre g
LEFT JOIN genre_series gs USING (genre_id)
ORDER BY g.genre_id;

-- WARNING: The next command will cause an error
-- ERROR: Column 'name' in field list is ambiguous
-- This error occurs because the column 'name' exists in both the 'genre' and 'series' tables,
-- making it unclear which table's 'name' column to use. 
-- To fix this, specify the table name for the 'name' column explicitly.
SELECT g.genre_id, g.name, gs.series_id, name
FROM genre g
LEFT JOIN genre_series gs ON gs.genre_id = g.genre_id
LEFT JOIN series s ON s.series_id = gs.series_id
ORDER BY g.genre_id;

