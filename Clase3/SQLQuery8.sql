use master;
go 

create database perudev; 
go


alter database perudev 
set recovery FULL 
go 

select databasepropertyex( 'perudev','Recovery' ) 
go

exec sp_addumpdevice 'disk', 'PERUDEV', 'D:\Backup\PDDevice.bak' 
go

select * from master.dbo.sysdevices 
go

create table perudev..test( 
id Int Identity Primary Key, 
dato varchar(30) 
);
GO

declare @k int set @k = 0 
while (@k < 10) 
begin 
	begin tran 
	insert into perudev..test(dato) values('Backup de Base de Datos') 
	commit tran
	set @k = @k + 1 
end 
go

SELECT * FROM PERUDEV..test;
GO

DELETE FROM PERUDEV..test WHERE id>10;
GO

backup database perudev to PERUDEV 
with format, name = 'Backup completo', 
description = 'Backup comleto de la base de datos' 
go

restore headeronly from PERUDEV 
go

-- Dia Lunes

declare @k int set @k = 0 
while (@k < 10) 
begin 
	begin tran 
	insert into perudev..test(dato) values('Datos del lunes') 
	commit tran
	set @k = @k + 1 
end 
go

SELECT * FROM PERUDEV..test;
GO

backup database perudev to PERUDEV 
with differential, name = 'BakDiffLunes', 
description = 'Backup diferencial del lunes'
go


restore headeronly from PERUDEV 
go

-- Martes


declare @k int set @k = 0 
while (@k < 10) 
begin 
	begin tran 
	insert into perudev..test(dato) values('Datos del Martes') 
	commit tran
	set @k = @k + 1 
end 
go

SELECT * FROM PERUDEV..test
order by 1 desc;
GO

backup database perudev to PERUDEV 
with differential, name = 'BakDiffMartes', 
description = 'Backup diferencial del Martes'
go

restore headeronly from PERUDEV 
go

-- Miercoles

declare @k int set @k = 0 
while (@k < 10) 
begin 
	begin tran 
	insert into perudev..test(dato) values('Datos del Miercoles') 
	commit tran
	set @k = @k + 1 
end 
go

SELECT * FROM PERUDEV..test
order by 1 desc;
GO

restore headeronly from PERUDEV
go

-- ERROR EN LA BASE DE DATOS
/*
Lo primero que se debe hacer es un backup del LOG si se puede.
*/


backup log perudev to PERUDEV 
with no_truncate, name = 'BakLog', description = 'Backup del log.' 
go

restore headeronly from PERUDEV
go


-- Restauración de la BD

-- 1. Restaurar la BD completa con la opción NORECOVERY

RESTORE DATABASE PERUDEV FROM PERUDEV 
WITH FILE = 1, NORECOVERY;

-- 2. Restaurar el ultimo backup diferencial con la opción NORECOVERY


RESTORE DATABASE PERUDEV FROM PERUDEV 
WITH FILE = 3, NORECOVERY;
GO


-- 3. Restaurar el LOG con la opcion RECOVERY


RESTORE LOG PERUDEV FROM PERUDEV 
WITH FILE = 4, RECOVERY
GO

SELECT * FROM PERUDEV..test
order by 1 desc;
GO



























) go