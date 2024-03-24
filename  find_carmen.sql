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
