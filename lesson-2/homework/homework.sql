--DDL data definition language while dml is data manipulation language is used for updating table values and its structure
--ddl used for creating tables and inserting values into it 

create table employees (
	empid int primary key,
	name varchar(50),
	salary decimal(10,2)
);

--inserting 3 records into  employees 

insert into 
	employees
values 
	(1,'alex',13000),
	(2,'john',900),
	(3,'barrouse',1000);

-- update employees table where empid = 1

update 
	employees
set 
	name='bruse',
	salary=800
where 
	empid = 1

--check 

select * from employees;


-- delete -> deletes the row in the table with condition given in the where condition 
-- drop -> deletes the entire table with it structure 
-- truncate -> deletes the rows in the table but it stores the structure of the table 

--example for delete 

delete from employees
where 
	empid=1;

--drop 

drop table employees

--truncate 
truncate table employees

-- alter name column type 

alter table employees 
alter column name varchar(100);

-- add column departament 

alter table 
	employees
add 
	departament varchar(50)

-- check

select * from employees

-- truncanate is used for clearing table 

/*
	MEDIUM LEVEL TASK 
*/

--creating table departaments with deptid primary key 

create table departaments
(
	deptid int primary key,
	empid int,
	salary int,
	foreign key (empid) references employees(empid)
)

-- insert into departaments table using select from another table

create table #temptable (
	deptid int,
	empid int,
	salary int,
	foreign key (empid) references employees(empid)
)

select * from employees
select * from departaments

insert into 
	#temptable 
values 
	(100,1,1300),
	(101,1,1200),
	(103,3,1115),
	(109,1,1000),
	(111,2,5000);
select * from #temptable


insert into departaments
	(deptid,empid,salary)
select 
	*
from 
	#temptable

drop table #temptable

--checking 

select 
	* 
from 
	departaments

-- updating departaments table where salary>=5000

update
	departaments 
set 
	salary=salary+salary*0.01
where 
	salary>=5000;

--remove all records from employees table 

truncate table departaments;

-- varchar is used for non uni code characters like english words 
-- while nvarchar is used for unicode charachters like chinese words 


--change type of salary column to float 
alter table 
	departaments
alter column 
	salary float

-- creating temporary table and insert two rows into it

create table #temp (
	id int identity,
	name varchar(25)
)


insert into 
	#temp
values 
	('alex'),
	('luke'),
	('barouse');
 
--check 

select * from #temp

-- removing departaments table compalately from database 

drop table 
	departaments;

/* 
	HARD-LEVEL TASKS
*/	


create table customers
(
	customer_id int,
	age int,
	customer_salary int,
	check (age>=18)
)

insert into 
	customers
values 
	(100, 18, 12000),
	(101,19,1000),
	(102,25,400)

-- check 

select * from customers


create table employees_data(
	emp_id int primary key,
	name varchar(25)
)

create table employee(
	employee_id int,
	year int,
	salary int,
	foreign key (employee_id) references employees_data(emp_id)
) 

insert into 
	employees_data
values 
	(1,'luke barouse'),
	(2,'shaqou Nale'),
	(3,'john johnson')

insert into 
	employee
values
	(1,2019,800),
	(1,2020,900),
	(1,2021,1000),
	(2,2019,700),
	(2,2020,700),
	(2,2021,700),
	(3,2019,1000),
	(3,2020,900),
	(3,2021,1200);

-- create stored procedure 
create procedure dbo.add_new_record
	@employee_id int,
	@year int,
	@salary int
as 
begin
	insert into 
		employee
	values
		(@employee_id,@year,@salary)
end 

exec dbo.add_new_record 
	@employee_id = 3,
	@year = 2022,
	@salary = 2000;

--check 

select 
	*
from 
	employee

-- creating a backup table Employees_Backup with the same structure as Employees.

select * into employee_backup from employee

--just a check

select 
	*
from 
	employee_backup

--merge two tables
create table Products (
    ProductID int primary key,
    Name nvarchar(50),
    Price decimal(10, 2)
);
CREATE TABLE NewProducts (
    ProductID int primary key,
    Name nvarchar(50),
    Price decimal(10, 2)
);
INSERT INTO Products (ProductID, Name, Price) VALUES
(1, 'Laptop', 1000.00),
(2, 'Phone', 500.00);

INSERT INTO NewProducts (ProductID, Name, Price) VALUES
(1, 'Laptop', 1200.00), 
(3, 'Tablet', 800.00); 

MERGE INTO Products AS Target
USING NewProducts AS Source
ON Target.ProductID = Source.ProductID
WHEN MATCHED THEN
    UPDATE SET
        Target.Name = Source.Name,
        Target.Price = Source.Price
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ProductID, Name, Price)
    VALUES (Source.ProductID, Source.Name, Source.Price);

select * from Products;

-- create database using script

create database CompanyDB;

/*
	COMPARISON BETWEEN CASCADE DELETE AND UPDATE
		- CASCADE DELETE - is used in add constraint when value deleted on parent
		table like the values give in the table with unique key deleted it will delete this 
		key from child table 
		-When the primary key value in the parent table updated
		foreign key values in the child table will be automatically updated.
*/


-- reset the IDENTITY column seed of Employees after deleting all records

truncate table employee_backup;

select * from employee_backup

alter table employee_backup
add id int identity;

select * from employee_backup
insert into employee_backup
values 
	(200,2008,2000); --just checking 


alter table employee_backup 
add constraint UK_employeid unique (employee_id)

alter table employee_backup 
add constraint PK_employeid primary key (id)
