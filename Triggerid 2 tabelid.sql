--- esimene trigger lisamine room type
create trigger room_typeLisamine
on room_type
for insert
as
insert into logi(kuupaev, andmed, kasutaja)
select getdate(),
concat(inserted.max_capacity, ', ', r.number_of_rooms),
user
from inserted
inner join reserved_room r on inserted.max_capacity=r.res_id
 
 
---kontroll esimene trigger
 
insert into room_type(description, max_capacity)
values('Sea','1');
select * from room_type;
select * from logi;
---переделать триггер(не рабочий)


--- teine trigger uuendamine room type
create trigger room_type_Uuendamine
on room_type
for update
as
insert into logi(kuupaev, andmed, kasutaja)
select getdate(),
concat('Vanad andmed ',deleted.max_capacity, ', ', r1.res_id, 
'  Uued andmed ', inserted.max_capacity, ', ', r2.res_id),
user
from deleted
inner join inserted on deleted.ty_id=inserted.ty_id
 
inner join number_of_rooms r1 on deleted.res_id=r1.res_id
inner join number_of_rooms r2 on inserted.res_id=r2.res_id
 
---kontroll teine trigger
 
select * from reserved_room;
update number_of_rooms set res_id=1
where number_of_rooms='2'
 
select * from reserved_room;
select * from logi;

---изменить код
