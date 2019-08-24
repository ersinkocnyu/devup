



----Girilen Kategori id'sine göre ve girilen çalýþan ismine göre satýlmýþ ürünlerin toplam satýþ fiyatýný gösteren fonksiyonu yazn.


alter view vw_satisfiyat
as 
select e.FirstName, ca.CategoryID, p.ProductID, p.ProductName, od.Quantity, round(Sum(od.UnitPrice + od.UnitPrice*(1-od.Discount)),2) as 'Urun Fiyat', 
  (round(Sum(od.UnitPrice + od.UnitPrice*(1-od.Discount)),2)* od.Quantity) as 'Toplam Satýþ'
from Employees e
join Orders o on o.EmployeeID=e.EmployeeID
join [Order Details] od on od.OrderID=o.OrderID
join Products p on p.ProductID=od.ProductID
join Categories ca on ca.CategoryID=p.CategoryID 
group by e.FirstName, ca.CategoryID, p.ProductID, p.ProductName, od.Quantity

select * from vw_satisfiyat

go
alter function SatisFiyat(@CategoryID int, @EmployeeName nvarchar(10)) returns table 
return
select * from vw_satisFiyat where @CategoryID=Category and @EmployeeName=EmployeeName

select * from  SatisFiyat(1,Andrew)



go

alter function SalesTotal(@CategoryID int, @EmployeeName nvarchar(10)) returns table 
return
select e.FirstName, ca.CategoryID, p.ProductID, p.ProductName, od.Quantity, round(Sum(od.UnitPrice + od.UnitPrice*(1-od.Discount)),2) as 'Urun Fiyat', 
  (round(Sum(od.UnitPrice + od.UnitPrice*(1-od.Discount)),2)* od.Quantity) as 'Toplam Satýþ'
from Employees e 
join Orders o on o.EmployeeID=e.EmployeeID
join [Order Details] od on od.OrderID=o.OrderID
join Products p on p.ProductID=od.ProductID
join Categories ca on ca.CategoryID=p.CategoryID 

where @CategoryID=ca.CategoryID and @EmployeeName=e.FirstName
group by e.FirstName, ca.CategoryID, p.ProductID, p.ProductName, od.Quantity



select * from  SalesTotal(1,'Andrew')

