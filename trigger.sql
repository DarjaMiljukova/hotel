create trigger trMyFirstTrigger
on database
for create_table
as 
begin
	print 'New table created'
	end

create table Test (Id int)



alter trigger trMyFirstTrigger
on database
for create_table,alter_table,drop_table
as
begin
print 'A table has just been created, modified or deleted'
end

create table Test1(id int)



alter trigger trMyFirstTrigger
on database
for create_table,alter_table,drop_table
as
begin
	rollback
	print 'You cannot create, alter or drop a table'
end

create table Test2(id int)


disable trigger trMyFirstTrigger on database

drop trigger trMyFirstTrigger on database

create trigger trReenameTable
on database
for rename
as
begin
print'You just renamed something'
end


create trigger tr_DatabaseScopeTrigger
on database
for create_table, alter_table, drop_table
as
begin
	rollback
	Print'You cannot create, alter or drop a table in the current database'
end


create trigger tr_ServerScopeTrigger
on all server
for create_table, alter_table, drop_table
as
begin
	rollback
	Print'You cannot create, alter or drop a table in any database on the server'
end



disable trigger tr_ServerScopeTrigger on all server


enable trigger tr_ServerScopeTrigger on all server

drop trigger tr_ServerScopeTrigger on all server 



create trigger tr_DatabaseScopeTrigger
on database
for create_table
as
begin
Print'Database Scope Trigger'
end
go


create trigger tr_ServerScopeTrigger
on database
for create_table
as
begin
Print'Server Scope Trigger'
end
go



exec sp_settriggerorder
@triggername = 'tr_DatabaseScopeTrigger1',
@order='none',
@stmttype= 'CREATE_TABLE',
@namespace = 'DATABASE'
go




create trigger tr_LogonAuditTriggers
on all server
for LOGON
as
begin
	declare @LoginName nvarchar(100)
	set @LoginName = ORIGINAL_LOGIN()
	if(select count(*) from sys.dm_exec_sessions
	where is_user_process = 1
	and original_login_name = @LoginName)>3
	begin
	print 'Fourth connection of' + @LoginName + 'blocked'
	rollBack
	end
end


execute sp_readerrorlog
