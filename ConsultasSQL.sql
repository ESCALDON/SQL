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