--protseduurid
--andmete lisamine ja select
--kustutamine ja select
--andmete uuendamine sisestatud id järgi
-- kasutajate (guest) arvu leidmine
--oma



create procedure lisaGuest
@fiName varchar(100),
@laName varchar(100),
@since date
as
begin
insert into guest(first_name, last_name, member_since)
values (@fiName, @laName, @since);
select * from guest;
select * from logi;
end;
-- käivitamine

exec lisaGuest 'Deniss', 'Anmer', '2022-10-6';



create procedure deleteGuest
@guid int
as
begin
select * from guest;
delete from guest
where @guid=id;
select * from guest;
select * from logi;
end;
-- käivitamine

exec deleteGuest 3;



