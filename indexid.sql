select * from tblEmployee
Create Clustered Index IX_tblEmployee_Name
On tblEmployee(Name)

Drop index tblEmployee.PK_tblEmplo_3214EC070A9D95DB



create table tblEmployee(
Id int Primary key,
Name nvarchar(50),
Salary int,
Gender nvarchar(10),
City nvarchar(50))


Insert into tblEmployee Values(3,'John',4500,'Male','New York')
Insert into tblEmployee Values(1,'Sam',2500,'Male','London')
Insert into tblEmployee Values(4,'Sara',5500,'Female','Tokyo')
Insert into tblEmployee Values(5,'Todd',3100,'Male','Toronto')
Insert into tblEmployee Values(2,'Pam',6500,'Female','Sydney')

select * from tblEmployee


create clustered index IX_tblEmployee_Gender_Salary
on tblEmployee(Gender DESC, Salary ASC)


Create NonClustered Index IX_tblEmployee_Name
On tblEmployee(Name)



create table tblEmployee(
Id int Primary key,
FirstName nvarchar(50),
LastName nvarchar(50),
Salary int,
Gender nvarchar(10),
City nvarchar(50))

execute sp_helpindex tblEmployee


insert into tblEmployee values(1,'Mike','Sandoz',4500,'Male','New York')
insert into tblEmployee values(1,'John','Menco',2500,'Male','London')


Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On tblEmployee(FirstName, LastName)


ALTER TABLE tblEmployee 
ADD CONSTRAINT UQ_tblEmployee_City 
UNIQUE NONCLUSTERED (City)


CREATE UNIQUE INDEX IX_tblEmployee_City
ON tblEmployee(City)
WITH IGNORE_DUP_KEY


create table tblEmployee(
Id int Primary key,
FirstName nvarchar(50),
LastName nvarchar(50),
Salary int,
Gender nvarchar(10),
City nvarchar(50))

Insert into tblEmployee values(1,'Mike','Sandoz',4500,'Male','New York')
Insert into tblEmployee values(2,'Sara','Menco',6500,'Female','London')
Insert into tblEmployee values(3,'John','Barber',2500,'Male','Sydney')
Insert into tblEmployee values(4,'Pam','Grove',3500,'Female','Toronto')
Insert into tblEmployee values(5,'James','Mirch',7500,'Male','London')


create NonClustered Index IX_tblEmployee_Salary
On tblEmployee(Salary ASC)

select * from tblEmployee where Salary>4000 and Salary<8000




delete from tblEmployee where Salary =2500
update tblEmployee set Salary = 9000 where Salary = 7500


select * from tblEmployee order by Salary

select * from tblEmployee order by Salary Desc


select Salary, COUNT(Salary) as Total
from tblEmployee
Group By Salary
