select * from curso2;
go


SELECT * INTO dbo.Curso2 
FROM dbo.Curso WHERE 1=2; 
GO


SELECT * INTO dbo.Curso3 
FROM dbo.Curso WHERE 1=2; 
GO

select * from curso3;
go


declare @comando varchar(400);
set @comando = 'bcp "SELECT top 5 * FROM [EduTec].[dbo].[Profesor]" queryout D:\BCP\test.xls -Slocalhost -Usa -Psql -c -C RAW -t "," ';
exec master..xp_cmdshell @comando;
GO

sp_configure 'show advanced options', 1; 
RECONFIGURE; 
go

sp_configure; 
GO

sp_configure 'xp_cmdshell', 0; 
RECONFIGURE; 
GO

SELECT * INTO dbo.Curso4 
FROM dbo.Curso WHERE 1=2; 
GO 

select * from dbo.Curso4; 
go

bulk insert EduTec.dbo.Curso4 
from 'D:\bcp\Curso_A.dat' 
with (formatfile='D:\bcp\Curso.xml'); 
go


select * from dbo.Curso4; 
go


select NomProfesor, ApeProfesor 
into dbo.Profesor2 
from dbo.Profesor where 1=2;
go

select * from dbo.Profesor2;
go

bulk insert dbo.Profesor2 
from 'D:\bcp\Profesores.txt' 
with (fieldterminator='\t',rowterminator='\n'); 
go

select * from dbo.Profesor2;
go

SELECT * INTO dbo.Curso5 
FROM dbo.Curso WHERE 1=2; 
GO 

select * from dbo.Curso5; 
go

BULK INSERT dbo.Curso5 
FROM 'D:\bcp\Curso-nat.Dat' 
WITH (DATAFILETYPE='native'); 
GO


SELECT * INTO dbo.Curso6 
FROM dbo.Curso WHERE 1=2; 
GO

SELECT * FROM dbo.Curso6;
go


INSERT INTO dbo.Curso6 
SELECT a.* FROM OPENROWSET( BULK 'D:\bcp\Curso_A.dat', FORMATFILE = 'D:\bcp\Curso.fmt') AS a;
GO



sp_configure 'show advanced options', 1; 
RECONFIGURE; 
go 

sp_configure; 
GO 


sp_configure 'Ad Hoc Distributed Queries', 1; 
RECONFIGURE; 
GO

SELECT a.* 
FROM OPENROWSET('SQLNCLI', 
	'Server=localhost;Trusted_Connection=yes;', 'SELECT * FROM EDUTEC.dbo.curso') AS a;
go


SELECT a.* FROM OPENROWSET('SQLNCLI', 'Server=localhost;UID=sa;PWD=sql', 
'SELECT * FROM EDUTEC.dbo.curso') AS a;
GO

































