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
