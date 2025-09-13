USE [master]
GO

BACKUP DATABASE Northwind 
TO DISK = 'D:\BACKUP\Northwind_13SET2025.bak';
GO

RESTORE DATABASE [Northwind] 
FROM  DISK = N'D:\BACKUP\Northwind_13SET2025.bak' 
GO



GO
