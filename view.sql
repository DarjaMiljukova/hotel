create table tblEmployee(
Id int Primary key,
Name nvarchar(50),
Salary int,
Gender nvarchar(10),
DepartmentId int)


create table tblDepartment(
DeptId int primary key,
DeptName nvarchar(20))

Insert into tblDepartment values(1,'IT')
Insert into tblDepartment values(2,'Payroll')
Insert into tblDepartment values(3,'HR')
Insert into tblDepartment values(4,'Admin')


Insert into tblEmployee Values(1,'John',5000,'Male',3)
Insert into tblEmployee Values(2,'Mike',3400,'Male',3)
Insert into tblEmployee Values(3,'Pam',6000,'Female',1)
Insert into tblEmployee Values(4,'Todd',4800,'Male',4)
Insert into tblEmployee Values(5,'Sara',3200,'Female',1)
Insert into tblEmployee Values(6,'Ben',4800,'Male',3)


select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment	
on tblEmployee.DepartmentId=tblDepartment.DeptId



create view vWEmployeesByDepartment
as
select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.DeptId

select * from vWEmployeesByDepartment


create view vWEmployeesNonConfidentialData
as
select Id, Name, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.DeptId


create view vWEmployeesCountByDepartment
as
select DeptName, Count(Id) as TotalEmployees
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.DeptId
group by DeptName


create view vWEmployeesDataExceptSalary
as
select Id, Name, Gender, DepartmentId
from tblEmployee


select * from vWEmployeesDataExceptSalary


update vWEmployeesDataExceptSalary
set Name='Mikey' where Id=2



delete from vWEmployeesDataExceptSalary where Id=2
insert into vWEmployeesDataExceptSalary values (2,'Mikey','Male',2)

create table tblDepartment(
DeptId int Primary Key,
DeptName nvarchar(20))



Insert into tblDepartment values(1,'IT')
Insert into tblDepartment values(2,'Payroll')
Insert into tblDepartment values(3,'HR')
Insert into tblDepartment values(4,'Admin')


create view vwEmployeeDetailsByDepartment
as
select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.DeptId



select * from vwEmployeeDetailsByDepartment


update vwEmployeeDetailsByDepartment
set DeptName='IT' where Name='John'




create table tblProduct(
ProductId int primary key,
Name nvarchar(20),
UnitPrice int)


create table tblProductSales(
ProductId int,
QuantitySold int)



insert into tblProduct values(1,'Books',20)
insert into tblProduct values(2,'Pens',14)
insert into tblProduct values(3,'Pencils',11)
insert into tblProduct values(4,'Clips',10)


insert into tblProductSales values(1,10)
insert into tblProductSales values(3,23)
insert into tblProductSales values(4,21)
insert into tblProductSales values(2,12)
insert into tblProductSales values(1,13)
insert into tblProductSales values(3,12)
insert into tblProductSales values(4,13)
insert into tblProductSales values(1,11)
insert into tblProductSales values(2,12)
insert into tblProductSales values(1,14)


create view vWTotalSalesByProduct
with SchemaBinding
as
Select Name,
SUM(ISNULL((QuantitySold*UnitPrice),0))as TotalSales,
COUNT_BIG(*) as TotalTransactions
from dbo.tblProductSales
join dbo.tblProduct
on dbo.tblProduct.ProductId=dbo.tblProductSales.ProductId
group by Name



create unique clustered index UIX_vWTotalSalesByProduct_Name
on vWTotalSalesByProduct(Name)


Select * from vWTotalSalesByProduct



CREATE TABLE tblEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Salary int,
  Gender nvarchar(10),
  DepartmentId int
)



Insert into tblEmployee values (1,'John', 5000, 'Male', 3)
Insert into tblEmployee values (2,'Mike', 3400, 'Male', 2)
Insert into tblEmployee values (3,'Pam', 6000, 'Female', 1)
Insert into tblEmployee values (4,'Todd', 4800, 'Male', 4)
Insert into tblEmployee values (5,'Sara', 3200, 'Female', 1)
Insert into tblEmployee values (6,'Ben', 4800, 'Male', 3)



Create View vWEmployeeDetails
@Gender nvarchar(20)
as
Select Id, Name, Gender, DepartmentId
from  tblEmployee
where Gender = @Gender


--loomine funktsioon otsing gender
Create function fnEmployeeDetails(@Gender nvarchar(20))
Returns Table
as
Return 
(Select Id, Name, Gender, DepartmentId
from tblEmployee where Gender = @Gender)



Select * from dbo.fnEmployeeDetails('Male')



Create View vWEmployeeDetailsSorted
as
Select Id, Name, Gender, DepartmentId
from tblEmployee
order by Id



Create Table ##TestTempTable(Id int, Name nvarchar(20), Gender nvarchar(10))


Insert into ##TestTempTable values(101, 'Martin', 'Male')
Insert into ##TestTempTable values(102, 'Joe', 'Female')
Insert into ##TestTempTable values(103, 'Pam', 'Female')
Insert into ##TestTempTable values(104, 'James', 'Male')



Create View vwOnTempTable
as
Select Id, Name, Gender
from ##TestTempTable
