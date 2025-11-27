-- 1. List the names of all NFL teams'
SELECT name AS "NFL Team" FROM teams;

-- 2. List the stadium name and head coach of all NFC teams
SELECT stadium, head_coach FROM teams WHERE conference = 'NFC';

-- 3. List the head coaches of the AFC South
SELECT head_coach FROM teams WHERE conference = 'AFC';

-- 4. The total number of players in the NFL
SELECT COUNT(*) AS "Total number of players in the NFL" FROM players;

-- 5. The team names and head coaches of the NFC North and AFC East
SELECT name, head_coach, conference, division FROM teams 
WHERE 
  (conference = 'NFC' AND division = 'North') OR
  (conference = 'AFC' AND division = 'East');

-- 6. The 50 players with the highest salaries
SELECT * FROM players
ORDER BY salary DESC
LIMIT 50;

-- 7. The average salary of all NFL players
SELECT cast(AVG(salary) as money) AS "Average salary of all NFL players" FROM players;

-- 8. The names and positions of players with a salary above 10_000_000
SELECT name, position
FROM players 
WHERE salary > 10_000_000;

-- 9. The player with the highest salary in the NFL
SELECT * FROM players WHERE salary = (SELECT MAX(salary) FROM players);

-- 10. The name and position of the first 100 players with the lowest salaries
SELECT name, position 
FROM players
ORDER BY salary
LIMIT 100;

-- 11. The average salary for a DE in the nfl
SELECT 
  cast(AVG(salary) as money) AS "Average salary for a DE in the NFL" 
FROM players 
WHERE position = 'DE';

-- 12. The names of all the players on the Buffalo Bills
SELECT name AS "Buffalo Bills Player" FROM players 
WHERE team_id = (SELECT id FROM teams WHERE name = 'Buffalo Bills')
ORDER BY name;

-- 13. The total salary of all players on the New York Giants
SELECT cast(SUM(salary) as money) AS "Total salary of all players on the New York Giants" 
FROM players 
WHERE team_id = (SELECT id FROM teams WHERE name = 'New York Giants');

-- 14. The player with the lowest salary on the Green Bay Packers
SELECT * FROM players 
WHERE 
  team_id = (SELECT id FROM teams WHERE name = 'Green Bay Packers') AND
  salary = (SELECT MIN(salary) FROM players WHERE team_id = (SELECT id FROM teams WHERE name = 'Green Bay Packers'));
