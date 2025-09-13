select * from PAGO;
go

delete from pago;
go

select * from matricula;
go

delete from matricula;
go

select @@TRANCOUNT;
go

rollback;
go

DBCC USEROPTIONS;
GO

SET IMPLICIT_TRANSACTIONS ON;
GO






