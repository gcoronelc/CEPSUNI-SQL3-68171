-- Ejercicio 1
-- ============================================


sp_configure 'show advanced options', 1; 
RECONFIGURE; 
go

sp_configure; 
GO

sp_configure 'xp_cmdshell', 1; 
RECONFIGURE; 
GO

/*
MATRICULAS_DDMMMAA.CSV
*/

alter procedure usp_ventas_ayer
as
-- Nombre de Archivo
declare @fecha datetime;
declare @sFecha varchar(20);
declare @archivo varchar(50);
set @fecha = GETDATE() - 1;
set @fecha = CAST(@fecha AS DATE);
SELECT @sFecha = FORMAT(@fecha, 'ddMMMyy', 'es-ES');
set @archivo = CONCAT('MATRICULADOS_',UPPER(@sFecha),'.xls');
-- Comando
declare @comando varchar(400);
set @comando = 'bcp "SELECT top 5 * FROM [EduTec].[dbo].[Profesor]" queryout D:\BCP\';
set @comando = CONCAT(@comando, @archivo,' -Slocalhost -Usa -Psql -c -C RAW -t "," ');
exec master..xp_cmdshell @comando;
go

EXEC EDUTEC.dbo.usp_ventas_ayer
GO


declare @fecha datetime;
declare @sFecha varchar(20);
declare @archivo varchar(50);
set @fecha = GETDATE() - 1;
set @fecha = CAST(@fecha AS DATE);
SELECT @sFecha = FORMAT(@fecha, 'ddMMMyy', 'es-ES');
set @archivo = CONCAT('MATRICULADOS_',UPPER(@sFecha),'.CSV');
select @archivo;
select * from Matricula where FecMatricula = @fecha;
go

SELECT FORMAT(GETDATE(), 'ddMMMyy', 'es-ES') AS FechaFormato

select * from CursoProgramado
where IdCiclo = '2025-09'
go

select * from matricula
where IdCursoProg = 8032;
go

update Matricula
set FecMatricula = '20250926'
where IdCursoProg = 8032;
go




