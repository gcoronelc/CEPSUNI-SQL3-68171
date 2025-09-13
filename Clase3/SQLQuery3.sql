select @@TRANCOUNT;
go

begin tran;
go

select * from MATRICULA;
go

delete from MATRICULA;
go






