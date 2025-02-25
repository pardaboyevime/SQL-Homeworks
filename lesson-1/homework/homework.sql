--creating db 

create database HomeworkDB

-- replace current db to homeworkdb 
use homeworkdb

-- creating students table in homeworkdb table

create table students (
	studentId int,
	Fullname varchar(50),
	age int,
	gpa decimal(3,2)
);

-- add new column named email

alter table students 
add email varchar(50);

-- rename column full name to Name 

sp_rename 'students.Fullname','Name';

-- drop age column from students 

alter table students 
drop column age;

-- truncate the students table
insert into 
	students 
values 
	(1,'pardaboyev ibrohim',4.23,'pardaboyevime@gmail.com');

truncate table students;

-- checking 

select * from students;

-- retiriveing current server name 

select @@SERVERNAME

-- get datetime now  

select GETDATE();

-- how to retireive all the data from students table 
-- in order to now wheather it work or  not run the code between 32-35 and it will insert values into value now in the below case it will print nothing because i used tuncate table above in 37 line

select * from students;
