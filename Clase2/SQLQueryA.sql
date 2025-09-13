/*
Login ID o Inicio de Sesión
==================================
Permite el inicio de sesión en el servidor.

1. Usuario de Windows: Autenticación integrada
2. Un Login ID creado en SQL Server: Autenticación de SQL Server.

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




