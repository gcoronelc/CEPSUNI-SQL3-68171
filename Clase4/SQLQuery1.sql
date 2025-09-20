

-- 01 Enviando un mensaje sencillo. 
EXEC msdb.dbo.sp_send_dbmail 
@profile_name = 'PERFIL_68171', 
@recipients = 'gcoronel@uni.edu.pe;ivan15perez@gmail.com;sandro.marcelo.0501@gmail.com', 
@body = 'Enviando de correo desde SQL Server de Gustavo Coronel', 
@subject = 'Prueba 01'; 
GO


EXEC msdb.dbo.sp_send_dbmail 
@profile_name = 'PERFIL_68171', 
@recipients = 'gcoronel@uni.edu.pe;ivan15perez@gmail.com;sandro.marcelo.0501@gmail.com',  
@query = 'SELECT * FROM Northwind.dbo.Customers', 
@subject = 'Listado Clientes', 
@attach_query_result_as_file = 1; 
GO


-- Limpiar los mensajes del log 
DELETE FROM msdb.dbo.sysmail_event_log; 
GO




