-- List the names of all NFL teams
SELECT * FROM teams
-- List the stadium name and head coach of all NFC teams
SELECT stadium, head_coach FROM teams
-- List the head coaches of the AFC South
SELECT head_coach FROM teams WHERE division = 'South' AND conference = 'AFC'
-- The total number of players in the NFL
SELECT COUNT(*) FROM players