USE [master]
GO

CREATE LOGIN [jaimito] 
WITH 
	PASSWORD=N'sql', 
	DEFAULT_DATABASE=[master], 
	CHECK_EXPIRATION=OFF, 
	CHECK_POLICY=OFF
GO


use clinica;
go

select * from empleado;
go

SELECT * FROM PACIENTE;
GO





