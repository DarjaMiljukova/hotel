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
