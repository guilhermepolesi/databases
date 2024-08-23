-- Select genre_id and name from genre table where genre_id is in specific values 
-- and the genre exists in the genre_series table
SELECT g.genre_id, g.name 
FROM genre g
WHERE g.genre_id IN (1, 3, 11) AND
EXISTS (SELECT TRUE FROM genre_series gs
        WHERE gs.genre_id = g.genre_id);
        
-- Select genre_id and name from genre table where genre_id is in specific values 
-- and the genre does not exist in the genre_series table
SELECT g.genre_id, g.name 
FROM genre g
WHERE g.genre_id IN (1, 3, 11) AND
NOT EXISTS (SELECT TRUE FROM genre_series gs
        WHERE gs.genre_id = g.genre_id);        
        
-- Aggregations: count(*), sum(1), min(), max(), avg()
-- Count the number of entries for each genre in the genre_series table
SELECT g.genre_id, g.name, count(*)
FROM genre g
INNER JOIN genre_series gs ON gs.genre_id = g.genre_id
GROUP BY g.genre_id, g.name;

-- Count the number of entries for genre_id 11 in the genre_series table
SELECT count(*)
FROM genre g1
INNER JOIN genre_series gs1 ON gs1.genre_id = g1.genre_id
WHERE g1.genre_id = 11;
-- Expected result: 4

-- Count the number of entries for each genre and only include those with more than 4 entries
SELECT g.genre_id, g.name, count(*)
FROM genre g
INNER JOIN genre_series gs ON gs.genre_id = g.genre_id
GROUP BY g.genre_id, g.name
HAVING count(*) > 4;

-- Count the number of entries for each genre and only include those with more entries
-- than the count for genre_id 11
SELECT g.genre_id, g.name, count(*)
FROM genre g
INNER JOIN genre_series gs ON gs.genre_id = g.genre_id
GROUP BY g.genre_id, g.name
HAVING count(*) > (SELECT count(*)
                   FROM genre g1
                   INNER JOIN genre_series gs1 ON 
                       gs1.genre_id = g1.genre_id
                   WHERE g1.genre_id = 11);

