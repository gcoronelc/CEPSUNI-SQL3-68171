/*
Login ID o Inicio de Sesi�n
==================================
Permite el inicio de sesi�n en el servidor.

1. Usuario de Windows: Autenticaci�n integrada
2. Un Login ID creado en SQL Server: Autenticaci�n de SQL Server.

*/

use Master;
go

use EDUCA2;
go

select * from EDUCA2..ALUMNO;
go

select * from EDUCA2..CURSO
go

select SUSER_NAME(), USER_NAME()
go

select * from EDUCA2..ALUMNO;
go


select * from MATRICULA;
go




