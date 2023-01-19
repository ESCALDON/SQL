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