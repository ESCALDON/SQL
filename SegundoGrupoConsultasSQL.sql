-- 16 �Cu�l es la m�xima, m�nima y puntuaci�n m�nima por g�nero?
select distinct Genre,MAX(Metacritic) as "Puntuacion Maxima", MIN(Metacritic) as "Puntuacion Minima" 
from juegos
group by Genre
order by MAX(Metacritic) desc, MIN(Metacritic);