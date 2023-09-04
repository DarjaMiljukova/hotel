insert into guest(first_name, last_name, member_since)
values ('Anna','Ander','2021-11-11')
select * from guest;
insert into guest(first_name, last_name, member_since)
values ('Karl','Luih','2023-11-16')
insert into guest(first_name, last_name, member_since)
values ('Artur','Manl','2022-11-09')
insert into guest(first_name, last_name, member_since)
values ('Inna','Alikan','2020-11-22')
insert into guest(first_name, last_name, member_since)
values ('Svetlana','Alikan','2023-10-11')
select * from guest;


insert into room_type(description, max_capacity)
values ('Forest','2')
select * from room_type;

insert into room_type(description, max_capacity)
values ('Sea','2')
select * from room_type;


insert into reserved_room(number_of_rooms, room_type_id)
values ('1245','2')
select * from reserved_room;


insert into room(number, name, status, smoke, room_type_id)
values ('156','vip','free',1,3)
select * from room;





insert into hosted_at(guest_id, occupied_room_id)
values (5,1)
select * from hosted_at;
