-- Backup completo de NorthWind con fecha y hora
DECLARE @Path NVARCHAR(200);
SET @Path = 'D:\BACKUP\Northwind_' + FORMAT(GETDATE(), 'yyyyMMdd_HHmmss') + '.bak';

BACKUP DATABASE [Northwind] 
TO DISK = @Path
WITH COMPRESSION, CHECKSUM;

PRINT 'Backup completado: ' + @Path;

GO