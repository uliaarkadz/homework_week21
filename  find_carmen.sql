-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed, so find the least populated country in Southern Europe, and we'll start looking for her there.

SELECT * FROM country WHERE population = (SELECT MIN(population) FROM country and region = 'Southern Europe') ORDER BY population LIMIT 1

-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in this country's officially recognized language. Check our databases and find out what language is spoken in this country, so we can call in a translator to work with you.

SELECT * FROM countrylanguage
JOIN country on contry.code = countrylanguage.countrycode
WHERE country.population = (SELECT MIN(population) FROM country and region = 'Southern Europe')

-- Clue #3: We have new news on the classes Carmen attended: our gumshoes tell us she's moved on to a different country, a country where people speak only the language she was learning. Find out which nearby country speaks nothing but that language.

SELECT country.*  FROM countrylanguage
JOIN country on country.code = countrylanguage.countrycode
WHERE countrylanguage.language = 'Italian' and country.continent = 'Europe'

-- Clue #4: We're booking the first flight out: maybe we've actually got a chance to catch her this time. There are only two cities she could be flying to in the country. One is named the same as the country – that would be too obvious. We're following our gut on this one; find out what other city in that country she might be flying to.

SELECT * FROM city where countrycode = (SELECT city.countrycode FROM countrylanguage
JOIN country ON country.code = countrylanguage.countrycode
JOIN city ON  country.code = city.countrycode
WHERE countrylanguage.language = 'Italian' AND country.continent = 'Europe'
AND city.name = country.name)


-- Clue #5: We're close! Our South American agent says she just got a taxi at the airport, and is headed towards the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll follow right behind you!

SELECT * FROM city
JOIN country ON  country.capital = city.id
WHERE country.code = 'SMR'

-- Clue #6: Oh no, she pulled a switch: there are two cities with very similar names, but in totally different parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!

SELECT * FROM city
JOIN country ON  country.code = city.countrycode
WHERE city.name LIKE 'San M%' AND country.continent = 'South America'

-- Clue #7: She knows we're on to her: her taxi dropped her off at the international airport, and she beat us to the boarding gates. We have one chance to catch her, we just have to know where she's heading and beat her to the landing dock.
-- Lucky for us, she's getting cocky. She left us a note, and I'm sure she thinks she's very clever, but if we can crack it, we can finally put her where she belongs – behind bars.

--   Our playdate of late has been unusually fun –
--   As an agent, I'll say, you've been a joy to outrun.
--   And while the food here is great, and the people – so nice!
--   I need a little more sunshine with my slice of life.
--   So I'm off to add one to the population I find
--   In a city of ninety-one thousand and now, eighty five.

SELECT * FROM city WHERE population = 91084

-- She's in Santa Monica!


-- Some of the entries have gotten a bit messed up. For example, the capital of Brazil is not Brasï¿½lia, rather, it is Brasília. Update this entry to the correct spelling. Record your update, in the find_carmen.sql file (below I found Carmen), and do a query for one row and copy paste it to show the update.

-- Update any other two entries that have gotten messed up.

UPDATE city
SET district = REPLACE(district, '�','ã') where id = 219

UPDATE city
SET district = REPLACE(district, '�','ã') where district = 'S�o Paulo'