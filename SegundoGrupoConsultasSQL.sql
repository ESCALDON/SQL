-- 16 �Cu�l es la m�xima, m�nima y puntuaci�n m�nima por g�nero?
select distinct Genre,MAX(Metacritic) as "Puntuacion Maxima", MIN(Metacritic) as "Puntuacion Minima" 
from juegos
group by Genre
order by MAX(Metacritic) desc, MIN(Metacritic);

-- 17 Usando LIMIT, devuelve el top 10 de juegos con mayor puntuaci�n del 2012.
select distinct top 10 Nombre,MAX(Metacritic) as "Puntuaci�n Maxima"
from juegos
where ReleaseDate = '2012'
group by Nombre
order by MAX(Metacritic) desc;

-- 18 Usando LIMIT, devuelve el top 10 de juegos m�s nuevos de g�nero single player.
select distinct top 10 Nombre, ReleaseDate 
from juegos
where Genre not like '%MultiPlayer%' 
group by Nombre, ReleaseDate
order by ReleaseDate desc;

-- 19 Devuelve la media de nota de todos aquellos juegos que sean para mayores de 18 a�os.
select distinct AVG(Metacritic) as Media
from juegos
where RequiredAge >= 18;

-- 20 �Cu�ntos juegos hay asociados a cada tipo (mayor de 18, de 17�)?
select count(Nombre) as "ContadorJuegos", RequiredAge from juegos
GROUP BY RequiredAge
order by RequiredAge

-- 21 Devuelve todos aquellos a�os en los que haya menos de 300 juegos.
SELECT ReleaseDate, count(Nombre) from juegos
GROUP BY ReleaseDate 
having COUNT(Nombre) < '300'


-- 22.Devuelve todos los juegos que est�n para Mac pero no para Windows.
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


-- 24.	Devuelve todos los juegos que no est�n valorados en d�lares.
Select Nombre, PriceCurrency from juegos
where PriceCurrency != 'USD'

-- 25.	Devuelve todos los juegos que tengan una mayor nota que 0, pero que hayan suspendido.
SELECT Nombre, Metacritic FROM juegos 
where Metacritic > '0' and Metacritic < '50'; 

-- 26.	Devuelve el top 15 de juegos con mayor n�mero de DLC.
SELECT TOP 15 Nombre, DLCCount FROM Juegos
group by DLCCount, Nombre
order by DLCCount DESC;

-- 27.	Devuelve la informaci�n de los juegos que s�lo se puedan jugar en Ingl�s.
select Nombre, SupportedLanguages From juegos 
where SupportedLanguages like '%English';

-- 28.	Devuelve el nombre(en min�scula) y la web (en may�scula) de los juegos de acci�n o casuales.
SELECT LOWER(Nombre) as Nombre ,LOWER(Website)as Web, Genre FROM juegos 
WHERE Genre like '%Actio' or Genre like '%Casual';

-- 29.	�Cu�l es el juego indie con mayor nota? 

-- 30.	�Y con menor nota?

