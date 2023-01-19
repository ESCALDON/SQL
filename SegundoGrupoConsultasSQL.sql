-- 16 ¿Cuál es la máxima, mínima y puntuación mínima por género?
select distinct Genre,MAX(Metacritic) as "Puntuacion Maxima", MIN(Metacritic) as "Puntuacion Minima" 
from juegos
group by Genre
order by MAX(Metacritic) desc, MIN(Metacritic);

-- 17 Usando LIMIT, devuelve el top 10 de juegos con mayor puntuación del 2012.
select distinct top 10 Genre,MAX(Metacritic) 
from juegos
where ReleaseDate = '2012'
group by Genre;
