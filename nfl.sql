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
-- The player with the highest salary in the NFL
SELECT * FROM players WHERE salary = (SELECT MAX(salary) FROM players)
-- The name and position of the first 100 players with the lowest salaries
SELECT name, position FROM players ORDER BY salary limit 100
-- The average salary for a DE in the nfl
SELECT AVG(salary) FROM players WHERE position = 'DE'

-- The total salary of all players on the New York Giants
SELECT SUM(players.salary) FROM players, teams
WHERE players.team_id=teams.id AND teams.name LIKE 'New York Giants'
-- The player with the lowest salary on the Green Bay Packers
SELECT * FROM players, teams WHERE players.team_id=teams.id AND teams.name LIKE 'Green Bay Packers' ORDER BY  players.salary limit 1
