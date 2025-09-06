begin tran;
go


select @@trancount;
go

select * from PRODUCTO;
go

update producto set precio = 1000;
go
