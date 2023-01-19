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