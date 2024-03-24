-- List the names of all NFL teams
SELECT * FROM teams
-- List the stadium name and head coach of all NFC teams
SELECT stadium, head_coach FROM teams
-- List the head coaches of the AFC South
SELECT head_coach FROM teams WHERE division = 'South' AND conference = 'AFC'
-- The total number of players in the NFL
SELECT COUNT(*) FROM players
-- The team names and head coaches of the NFC North and AFC East
SELECT name, head_coach FROM teams WHERE (division = 'East' AND conference = 'AFC') or (division = 'North' AND conference = 'NFC')
-- The 50 players with the highest salaries
SELECT * FROM players ORDER BY salary desc limit 50
-- The average salary of all NFL players
SELECT AVG(salary) FROM players
-- The names and positions of players with a salary above 10_000_000
SELECT name, position FROM players WHERE salary > 10000000