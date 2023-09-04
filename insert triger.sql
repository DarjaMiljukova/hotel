--loo triger
create trigger guestLisamine
on guest
for insert
as
insert into logi(kuupaev, kasutaja, andmed, tegevus)
select getdate(), user,
concat(inserted.first_name, ', ', inserted.last_name),
'guest on lisatud'
from inserted

--kontroll
insert into guest(first_name, last_name, member_since)
values ('Karl','Luih','2023-11-16');
select * from guest;
select * from logi;
