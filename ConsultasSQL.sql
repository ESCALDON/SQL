use steam
go

--1. Lista todas las columnas de la tabla.
select *
from juegos;

--2. Lista todos los diferentes géneros, eliminando duplicados. Se usa distinct para eliminar los duplicados en sql
Select distinct genre
from juegos;

--3. Lista únicamente aquellos juegos que puedan ser jugados únicamente en Linux
select Nombre
from juegos
where PlatformLinux='true' and PlatformMac='false' and PlatformWindows='false'

--4. Lista todos los juegos de rol, ordenador por nota.
Select nombre, Genre, Metacritic
from juegos
where genre like '%RPG%'
order by Metacritic desc

--5. Lista todos aquellos juegos que puedan ser jugados en Español pero no en Frances
select nombre
from juegos
where SupportedLanguages not like '%French%' and SupportedLanguages like '%Spanish%'

--6. Lista el nombre del juego, su precio inicial, su precio final y la diferencia entre ambos en una nueva columna.
select Nombre, PriceInitial, PriceFinal, PriceInitial-PriceFinal
from juegos

--7. ¿Cuántos juegos hay del siglo pasado?
select count(*) as NumeroDeJuegos
from juegos
where ReleaseDate between '1900' and '1999'

--8. Devuelve todos los juegos que terminen o en N o en O.
select nombre
from juegos
where nombre like '%N' or nombre like '%O'

--9. Devuelve todos los juegos que empiecen por A y que se puedan jugar con mando.
select nombre
from juegos
where ControllerSupport='true' and nombre like 'A%'

--10. Devuelve todos aquellos juegos que estén entre el 2000 y el 2010.
select nombre
from juegos
where ReleaseDate between '2000' and '2010'

--11. Devuelve todos los juegos que sean de la saga Final Fantasy.
select nombre
from juegos
where nombre like '%Final Fantasy%'

--12. Devuelve todos los juegos que sean de deportes y haya trabajado más de 3 desarrolladores.
select nombre
from juegos
where DeveloperCount > 3 and genre like '%sports%'

--13. ¿Cuántos juegos hay asociados a cada categoría?
select count(*) as NumeroDeJuegos, Category
from juegos
group by Category

--14. ¿Cuántos juegos se han sacado en cada año?
select count (*) as NumeroDeJuegos, ReleaseDate, AVG(Metacritic)
from juegos
group by ReleaseDate

--15. En base a la consulta anterior, devuelve aquellos años en los que la media de puntuación esté entre un 6 y un 8,
select count (*) as NumeroDeJuegos, ReleaseDate
from juegos
group by ReleaseDate
Having AVG(Metacritic) between 6 and 8
-- 16 ¿Cuál es la máxima, mínima y puntuación mínima por género?
select distinct Genre,MAX(Metacritic) as "Puntuacion Maxima", MIN(Metacritic) as "Puntuacion Minima" 
from juegos
group by Genre
order by MAX(Metacritic) desc, MIN(Metacritic);

-- 17 Usando LIMIT, devuelve el top 10 de juegos con mayor puntuación del 2012.
select distinct top 10 Nombre,MAX(Metacritic) as "Puntuación Maxima"
from juegos
where ReleaseDate = '2012'
group by Nombre
order by MAX(Metacritic) desc;

-- 18 Usando LIMIT, devuelve el top 10 de juegos más nuevos de género single player.
select distinct top 10 Nombre, ReleaseDate 
from juegos
where Genre not like '%MultiPlayer%' 
group by Nombre, ReleaseDate
order by ReleaseDate desc;

-- 19 Devuelve la media de nota de todos aquellos juegos que sean para mayores de 18 años.
select distinct AVG(Metacritic) as Media
from juegos
where RequiredAge >= 18;

-- 20 ¿Cuántos juegos hay asociados a cada tipo (mayor de 18, de 17)?
select count(Nombre) as "ContadorJuegos", RequiredAge from juegos
GROUP BY RequiredAge
order by RequiredAge

-- 21 Devuelve todos aquellos años en los que haya menos de 300 juegos.
SELECT ReleaseDate, count(Nombre) from juegos
GROUP BY ReleaseDate 
having COUNT(Nombre) < '300'


-- 22.Devuelve todos los juegos que estén para Mac pero no para Windows.
SELECT Nombre, PlatformWindows, PlatformMac from juegos
Where PlatformWindows like 'True' and PlatformMac like 'false'
Group BY PlatformWindows, Nombre, PlatformMac

-- 23.	Devuelve todos los juegos donde su precio final sea mayor a su precio inicial.
-- DONDE SEA MAYOR ES: (NO ME DA NINGUN RESULTADO Y EN LAS OTRAS CONSULTAS SI)
SELECT Nombre, PriceInitial, PriceFinal from juegos
where PriceFinal > PriceInitial

-- DONDE SEA MENOR ES:
SELECT Nombre, PriceInitial, PriceFinal from juegos
where PriceFinal < PriceInitial

-- DONDE NO SEA IGUAL ES:
SELECT Nombre, PriceInitial, PriceFinal from juegos
where PriceFinal != PriceInitial


-- 24.	Devuelve todos los juegos que no estén valorados en dólares.
Select Nombre, PriceCurrency from juegos
where PriceCurrency != 'USD'

-- 25.	Devuelve todos los juegos que tengan una mayor nota que 0, pero que hayan suspendido.
SELECT Nombre, Metacritic FROM juegos 
where Metacritic > '0' and Metacritic < '50'; 

-- 26.	Devuelve el top 15 de juegos con mayor número de DLC.
SELECT TOP 15 Nombre, DLCCount FROM Juegos
group by DLCCount, Nombre
order by DLCCount DESC;

-- 27.	Devuelve la información de los juegos que sólo se puedan jugar en Inglés.
select Nombre, SupportedLanguages From juegos 
where SupportedLanguages like '%English';

-- 28.	Devuelve el nombre(en minúscula) y la web (en mayúscula) de los juegos de acción o casuales.
SELECT LOWER(Nombre) as Nombre ,LOWER(Website)as Web, Genre FROM juegos 
WHERE Genre like '%Actio' or Genre like '%Casual';

-- 29.	¿Cuál es el juego indie con mayor nota? 
SELECT top 1 Nombre, Genre, Metacritic FROM juegos WHERE	Genre like '%Indie'
ORDER BY Metacritic desc;

-- 30.	¿Y con menor nota?
SELECT TOP 1 Nombre, Genre, Metacritic FROM juegos WHERE	Genre like '%Indie'
ORDER BY Metacritic ASC;

--  31 Devuelve toda la informaci�n del juego con menor nota, siempre que sea mayor a cero.

SELECT * FROM juegos where Metacritic = (
SELECT TOP 1 Metacritic from juegos where Metacritic > 0
order by Metacritic);

-- 32 Devuelve aquellos juegos que tengan mayor nota que la media.

SELECT Nombre, Metacritic FROM juegos WHERE Metacritic > (SELECT AVG(Metacritic) from juegos )

-- 33 Devuelve el juego con mayor nota del a�o 2008.

SELECT TOP 1 * FROM juegos WHERE ReleaseDate = '2008' and Metacritic > 
(SELECT AVG(Metacritic) FROM juegos ) ORDER BY Metacritic DESC


-- 34 Devuelve toda la informaci�n de los juegos que valgan m�s que la media.
SELECT * FROM juegos WHERE PriceFinal > 
(SELECT AVG(PriceFinal) FROM juegos )


-- 35 Devuelve toda la informaci�n de los juegos de Linux que tengan el mayor n�mero de logros (achivements)
SELECT * FROM juegos WHERE PlatformLinux LIKE 'true' AND AchievementCount =
(SELECT MAX(AchievementCount) from juegos )