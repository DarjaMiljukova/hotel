select * from DimEmployee;
--loomine funktsioon fn_ILTVF_GetEmployees/fn_MSTVF_GetEmployees ja kontroll funksioonid
Create Function fn_ILTVF_GetEmployees()
Returns Table
as
Return(Select EmployeeKey, FirstName, Cast(BirthDate as Date) as BD
	From DimEmployee);


select * from fn_ILTVF_GetEmployees();



Create Function fn_MSTVF_GetEmployees()
Returns @Table Table(Id int, Name varchar(20), BD Date)
as
Begin
Insert into @Table
Select EmployeeKey, FirstName, Cast(BirthDate as Date)
From DimEmployee
Return
End


Select * from fn_ILTVF_GetEmployees();
Select * from fn_MSTVF_GetEmployees();


Update fn_ILTVF_GetEmployees() set FirstName='Sam' where EmployeeKey=1





Alter Function fn_GetEmployeeNameByld(@Id int)
Returns nvarchar(20)
with SchemaBinding
as
Begin
Return (Select FirstName from dbo.DimEmployee Where EmployeeKey=@Id)
End

drop table DimEmployee

select dbo.fn_GetEmployeeNameByld(1);


--loomine tabel #PersonDetails ja kasutamine tempdb..sysobjects

Create Table #PersonDetails(Id int, Name nvarchar(20))

insert into #PersonDetails Values(1,'Mike')
insert into #PersonDetails Values(2,'John')
insert into #PersonDetails Values(3,'Todd')

select * from #PersonDetails


select Name from tempdb..sysobjects
where Name like '#PersonDetails%'



drop table #PersonDetails


--loomine protseduur spCreateLocalTempTable
create Procedure spCreateLocalTempTable
as
Begin
Create Table #PersonDetails(Id int, Name nvarchar(20))

insert into #PersonDetails Values(1,'Mike')
insert into #PersonDetails Values(2,'John')
insert into #PersonDetails Values(3,'Todd')

select * from #PersonDetails
End



create Table ##EmployeeDetails(Id int, Name nvarchar(20))



Select * from DimEmployee where BaseRate > 35 and BaseRate < 50

--loomine index funktsioonid ja kontroll, kustutamine idex
create index IX_DimEmployee_BaseRate
on DimEmployee (BaseRate ASC)

exec sys.sp_helpindex @objname = 'DimEmployee'


drop index DimEmployee.FirstNameLastName
