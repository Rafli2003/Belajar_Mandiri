-- create table mahasiswa (
-- id int,
-- nama varchar(20),
-- jurusan varchar(30)
-- )

-- select * from mahasiswa

-- alter table mahasiswa add email varchar(50);
-- alter table mahasiswa drop column jurusan;
-- alter table mahasiswa add jurusan varchar(30);

-- alter table mahasiswa change nama nama_lengkap varchar(20);
-- select * from mahasiswa;

-- Create table mahasiswa_copy as select * from mahasiswa;
-- rename table mahasiswa_copy to Rafli;

-- Create temporary table temp_mahasiswa (
-- Id int,
-- Nama varchar(10)
-- );

-- select * from temp_mahasiswa;

-- create table siswa(
-- id int,
-- nama varchar(20),
-- jurusan varchar(30)
-- )

-- alter table siswa add nilai int;  

-- insert into siswa(id, nama, jurusan, nilai) values 
-- (1,'Rafli','informatika',85),
-- (2,'Arifah','PSG',96);

-- select * from siswa;

-- insert into siswa(id, nama, jurusan, nilai) values 
-- (3,'Budi','informatika',90),
-- (4,'Siti','fisika',91),
-- (5,'Riri','fisika',84),
-- (6,'Gunawan','PSG',78);

-- select nama, nilai from siswa where nilai != 100;

-- set SQL_SAFE_UPDATES=0;

-- update siswa set nilai = 80, nama = 'Wawan' where id=6;

-- select * from siswa;

-- alter table siswa modify id int auto_increment,
-- add primary key (id);

-- update siswa set nilai = 92 where id=1;

-- insert into siswa(id, nama, jurusan, nilai) values 
-- (7,'dodo','informatika',76);

-- delete from siswa where id=7;

-- select nama as 'Nama Lengkap', nilai as 'Nilai Akhir'
-- from siswa;

-- select * from siswa order by nilai desc;

-- select * from siswa limit 2;

-- select * from siswa order by nilai asc limit 3;

-- select distinct jurusan from siswa;

-- select count(*) as 'Jumlah data' from siswa;

-- select count(distinct jurusan) as 'Jumlah Jurusan' from siswa;

-- select jurusan, avg(nilai) as 'rata-rata nilai siswa' 
-- from siswa group by jurusan;

-- select jurusan, avg(nilai) as 'rata-rata nilai siswa', 
-- count(*) as 'jumlah siswa per jurusan'
-- from siswa group by jurusan;

-- select jurusan, avg(nilai) as 'rata-rata nilai siswa', 
-- count(*) as 'jumlah siswa per jurusan'
-- from siswa group by jurusan having avg(nilai) < 90;

-- create table users(
-- 	id int auto_increment primary key,
--     name varchar(100) not null,
--     email varchar(100) not null unique,
--     status varchar(20) default 'active',
--     age int check(age >= 18)
-- );

-- ini yang benar:
-- insert into users(name, email, status, age) values
-- (budi,'budi@gmail,com', 'inactive', 22);

-- ini yang akan error
-- insert into users(name, email, status, age) values
-- (null,'budi@gmail,com', 'inactive', 19);

-- insert into users(id, name, email, status, age) values
-- (3, 'Rafli','rafli@gmail.com','active',22);
-- ('Arifah', 'fiah@gmail.com','active',18),
-- ('Hikmah','hikmah@gmail.com','inactive', 25);

-- create table posts(
-- 	id int auto_increment primary key,
--     content text not null,
--     user_id int,
--     foreign key (user_id) references users(id)
-- );

-- insert into posts(content, user_id) values
-- ('assalamualaikum, kumaha kabarna', 3);
-- ('waalaikumsalam, alhamdulillah sae', 4);

-- select * from posts;
-- select * from users;

-- select posts.id, posts.content, users.name, users.email
-- from posts join users on posts.user_id = users.id;

-- show create table posts;

-- alter table posts drop foreign key posts_ibfk_1;

-- alter table posts drop foreign key fk_users_id;

-- alter table posts add constraint fk_users_id
-- 	foreign key (user_id) 
-- 	references users(id)
--     on delete set null
--     on update set null;
--     
-- delete from posts where id = 1;

-- create table profiles (
-- 	id int auto_increment primary key,
--     bio text,
--     user_id int,
--     constraint fk_user_id foreign key (user_id) references
--     users(id)
-- );

-- select * from users;
-- select * from profiles;

-- insert into profiles(bio, user_id) values
-- ('halo semua', 1);

-- create table student(
-- 	id int auto_increment primary key,
--     name varchar(30)
-- );

-- create table courses(
-- 	id int auto_increment primary key,
--     title varchar(30)
-- );

-- create table course_student(
-- 	student_id int,
--     course_id int,
--     primary key(student_id, course_id),
--     foreign key(student_id) references student(id),
--     foreign key(course_id) references courses(id)
-- );

-- insert into student(name) values
-- ('Rafli'), ('Arifah'),('suri');

-- insert into courses(title) values
-- ('matematika'), ('fisika'),('bahasa');

-- insert into course_student(student_id, course_id) values
-- (1, 2), 
-- (1,1), 
-- (2,3), 
-- (3,1), 
-- (3,2), 
-- (3,3);

-- select * from student;
-- select * from courses;
-- select * from course_student;

-- student as s
-- course as c
-- course_student as cs
-- select s.name, c.title from student as s 
-- join course_student as cs on s.id = cs.student_id
-- join courses as c on cs.course_id = c.id;

-- inner join
select p.id, p.content, u.name, u.email
from posts as p 
inner join users as u 
on p.user_id = u.id;

-- left join
select * from posts 
left join users on posts.user_id = users.id;

-- left outer join
select * from posts left join 
users on posts.user_id = users.id where users.id is null;

-- right join
select * from posts 
right join users on posts.user_id = users.id;

-- right outer join
select * from posts right join 
users on posts.user_id = users.id where posts.user_id is null;

-- full join
select * from posts 
left join users on posts.user_id = users.id
union
select * from posts 
right join users on posts.user_id = users.id;

select curdate();
select now();
select year(curdate());

select * from siswa;

alter table siswa 
add tanggal_masuk date;

insert into siswa(nama, jurusan, nilai, tanggal_masuk) values
('Ruru','bahasa korea', 89, '2026-01-01');

select *, year(tanggal_masuk) as angkatan from siswa;

select lower("raFLi ADHaN") as nama_saya;
select upper("raFLi ADHaN") as nama_saya;
select ltrim("       raFLi ADHaN") as nama_saya;
select substring_index('raFLi ADHaN', ' ', 1) as first_name;
select substring_index('raFLi ADHaN', ' ', -1) as last_name;

select upper(nama) as Nama_Kapital from siswa;
select ltrim(nama) as Nama_Kapital from siswa;

select pi();
select *, pow(nilai,2) as nilai_pangkat_2 from siswa;
select *, (nilai/100) as nilai_skala_1 from siswa;

-- JSON
select json_array('css','html','js');
select json_object('nama', 'ranggo', 'umur', 18);

select * from siswa;

alter table siswa add skilss json;
alter table siswa add alamat json;

insert into siswa(nama, jurusan, nilai, skilss, alamat) values
(
	'trisnaldi', 'matematika', 93, '["js", "css", "html"]',
    '{
		"jalan": "JL. Diponegoro No.23",
        "kota": "Medan",
        "provinsi": "Sumatera Utara"
    }'
);

update siswa set alamat = json_replace(alamat, '$.kecamatan', 'bandung weta')
where id = 9;

select nama, json_keys(alamat) from siswa;

update siswa set alamat = json_remove(alamat, '$.post_code')
where id = 9;

select *, json_unquote(json_extract(alamat, '$.kota')) as kota from siswa;

select *, json_contains(skilss, '["js"]') as bisa_javascript 
from siswa;

select * from siswa;

select *,
	case 
		when nilai >= 90 then 'A'
        when nilai >= 85 then 'B'
        when nilai >= 80 then 'c'
        else 'D'
	end as grade,
    if (nilai >= 80, 'Lulus', 'Tidak Lulus') as passed,
    ifnull(nilai, 0) as nilai_baru
from siswa;

select nullif(9,9);
select nullif(10,9);

use test;

create table produk(
	id int auto_increment primary key,
    nama varchar(30),
    kategori varchar(30),
    harga int,
    index kateogry_index(kategori),
    index nama_index(nama),
    
    -- nama, nama dan kategori, nama dan kategori dan harga
    -- not impact ke kategori dan harga, kategori, harga
    index nama_kategori_harga(nama, kategori, harga)
);

show create table produk;

select * from produk where kategori = 'a';
select * from produk where nama = 'a';
select * from produk where nama = 'a' and kategori = 'a';
select * from produk where nama = 'a' and kategori = 'a' and harga=1;

alter table produk drop index nama_index;

alter table produk add index harga_index(harga);

select * from siswa 
where nilai > (select avg(nilai) from siswa);

select name, content from 
(select p.id, p.content, u.name, u.email
from posts as p join users as u on p.user_id = u.id) 
as derived_table;

select nama, jurusan, nilai, 
(select avg(nilai) from siswa)  as 'Rata rata nilai'
from siswa;

-- versi kompleks
create view siswa_view as  
select *,
	case 
		when nilai >= 90 then 'A'
        when nilai >= 85 then 'B'
        when nilai >= 80 then 'c'
        else 'D'
	end as grade,
    if (nilai >= 80, 'Lulus', 'Tidak Lulus') as passed,
    ifnull(nilai, 0) as nilai_baru
from siswa;

-- versi simple setelah menerapkan view
select * from siswa_view;

-- kita bisa update view, tetapi yang 
-- akan ke update adalah tabel aslinya
update siswa_view set nilai = 87 where id = 5;

create or replace view siswa_view as  
select nama, jurusan,
	case 
		when nilai >= 90 then 'A'
        when nilai >= 85 then 'B'
        when nilai >= 80 then 'c'
        else 'D'
	end as grade,
    if (nilai >= 80, 'Lulus', 'Tidak Lulus') as passed
from siswa;

select * from siswa_view;

show databases;
use mysql;
show tables;
select * from user;

create user 'andi'@'localhost' identified by '123456';

alter user 'andi'@'localhost' identified by 'andi123';

drop user 'andi'@'localhost';

grant select, delete on test.siswa to 'andi'@'localhost';

grant all privileges on test.* to 'andi'@'localhost';

REVOKE ALL PRIVILEGES ON test.siswa FROM 'andi'@'localhost';

select * from siswa;

start transaction;

update siswa set nilai = 100 where id=3;
select * from siswa;

commit;
rollback;