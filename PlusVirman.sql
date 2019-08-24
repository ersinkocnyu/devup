
/*
create database BankaDB
go
user BankaDB
create table Hesaplar(
ID int primary key identity(1,1) not null,
HesapAdi nvarchar(50),
Bakiye money
)

*/



CREATE DATABASE [BankaDB] 
use BankaDB
go
create table Havale (ID int primary key identity (1,1) not null, HesapAdi nvarchar(50), Bakiye Money)  


insert into Havale values ('Ersin Koc',100), ('Merve', 1000)
select * from Havale


--ödev
--herhangi bir hesaptan herhangi miktarda bakiyeyi aktaran sp yazın


use BankaDB
create table Hesaplar (ID int primary key identity (1,1) not null, HesapAdi nvarchar(50), Bakiye Money)
insert into Hesaplar values ('Ersin', 1000), ('Merve', 2000), ('Ahmet', 3000)


alter procedure Havaleyap 
@HesapAdi nvarchar(50),
@Tutar money

as 

if(exists(select * from Hesaplar where HesapAdi=@HesapAdi))
Begin 
update Hesaplar Set Bakiye = Bakiye + @Tutar where HesapAdi=@HesapAdi

end
else 
begin
insert into Hesaplar(HesapAdi,Bakiye) values (@HesapAdi, @Tutar)
end

exec Havaleyap Cansu, 1500

 select * from Hesaplar 


 create procedure Virman
 @Gonderen nvarchar (50),
 @Alici nvarchar (50),
 @Tutar money

 as 

/* if( select @Tutar>Bakiye, HesapAdi from Hesaplar where @Gonderen=HesapAdi)

begin
 Print 'Yetersiz Bakiye'

 end
 else */
 begin
 select * from Hesaplar where @Gonderen=HesapAdi
 update Hesaplar set Bakiye= Bakiye - @Tutar where @Gönderen=HesapAdi
 update Hesaplar set Bakiye= Bakiye + @Tutar where @Alici=HesapAdi
 end











