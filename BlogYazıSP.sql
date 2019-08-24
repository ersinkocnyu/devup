




create database [BlogDB]
go
use BlogDB
create table BlogDetail (BlogID int primary key identity (1,1) not null, FirstName nvarchar(50),
LastName nvarchar(50),  Header nvarchar (100), Body nvarchar(1000), Time date)

create proc Blogyarat
@FirstName nvarchar(50),
@LastName nvarchar(50),
@Header nvarchar (100),
@Body nvarchar (1000)

as 
insert into BlogDetail (FirstName, LastName, Header, Body,Time) values (@FirstName, @LastName, @Header, @Body
, GETDATE() )

exec Blogyarat Ersin,Ko�,'Online Kurs Hakk�nda', 'Online kurslar iyidir'

select * from BlogDetail
