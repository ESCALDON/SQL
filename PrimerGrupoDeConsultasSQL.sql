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
where SupportedLanguages not like '%french%' and SupportedLanguages like '%spanish%'

--6 Lista el nombre del juego, su precio inicial, su precio final y la diferencia entre ambos en una nueva columna.
select Nombre, PriceInitial, PriceFinal, PriceInitial-PriceFinal
from juegos

--7¿Cuántos juegos hay del siglo pasado?
--set dateformat dmy
select nombre
from juegos
where ReleaseDate between '1900' and '1999'
