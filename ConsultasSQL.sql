use steam
go

--1. Lista todas las columnas de la tabla.
select *
from juegos;

--2. Lista todos los diferentes g�neros, eliminando duplicados. Se usa distinct para eliminar los duplicados en sql
Select distinct genre
from juegos;

--3. Lista �nicamente aquellos juegos que puedan ser jugados �nicamente en Linux
select Nombre
from juegos
where PlatformLinux='true' and PlatformMac='false' and PlatformWindows='false'

--4. Lista todos los juegos de rol, ordenador por nota.
Select nombre, Genre, Metacritic
from juegos
where genre like '%RPG%'
order by Metacritic desc

--5. Lista todos aquellos juegos que puedan ser jugados en Espa�ol pero no en Frances
select nombre
from juegos
where SupportedLanguages not like '%French%' and SupportedLanguages like '%Spanish%'

--6. Lista el nombre del juego, su precio inicial, su precio final y la diferencia entre ambos en una nueva columna.
select Nombre, PriceInitial, PriceFinal, PriceInitial-PriceFinal
from juegos

--7. �Cu�ntos juegos hay del siglo pasado?
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

--10. Devuelve todos aquellos juegos que est�n entre el 2000 y el 2010.
select nombre
from juegos
where ReleaseDate between '2000' and '2010'

--11. Devuelve todos los juegos que sean de la saga Final Fantasy.
select nombre
from juegos
where nombre like '%Final Fantasy%'

--12. Devuelve todos los juegos que sean de deportes y haya trabajado m�s de 3 desarrolladores.
select nombre
from juegos
where DeveloperCount > 3 and genre like '%sports%'