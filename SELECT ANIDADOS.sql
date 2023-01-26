--  31 Devuelve toda la información del juego con menor nota, siempre que sea mayor a cero.

SELECT * FROM juegos where Metacritic = (
SELECT TOP 1 Metacritic from juegos where Metacritic > 0
order by Metacritic);

-- 32 Devuelve aquellos juegos que tengan mayor nota que la media.

SELECT Nombre, Metacritic FROM juegos WHERE Metacritic > (SELECT AVG(Metacritic) from juegos )

-- 33 Devuelve el juego con mayor nota del año 2008.

SELECT TOP 1 * FROM juegos WHERE ReleaseDate = '2008' and Metacritic > 
(SELECT AVG(Metacritic) FROM juegos ) ORDER BY Metacritic DESC


-- 34 Devuelve toda la información de los juegos que valgan más que la media.
SELECT * FROM juegos WHERE PriceFinal > 
(SELECT AVG(PriceFinal) FROM juegos )


-- 35 Devuelve toda la información de los juegos de Linux que tengan el mayor número de logros (achivements)
SELECT * FROM juegos WHERE PlatformLinux LIKE 'true' AND AchievementCount =
(SELECT MAX(AchievementCount) from juegos )