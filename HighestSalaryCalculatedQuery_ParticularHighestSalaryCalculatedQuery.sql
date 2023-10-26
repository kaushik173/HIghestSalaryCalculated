
--1.create database
create database student

--2.use database
use student

--3.create table in database
CREATE TABLE Student(
	Id int NOT NULL,
	FirstName varchar(50) NULL,
	LastName varchar(50) NULL,
	Salary decimal(10, 2) NULL,
	Primary Key(Id)
)
--4.insert records in table 
insert into Student 
values(1,'manager','manage',25000.00),
      (2,'developer','develop',15000.00),
	  (3,'tester','test',10000.00),
	  (4,'designer','design',8000.00),
	  (5,'User','use',5000.00)

--5.get all record
select * from Student;

--write a query to find highest salary or particular highest salary
--1 way
select max(Salary) from student

--2 way
select * from Student as s1 where 2 =
(select COUNT(*) from Student as s2 where s1.Salary <= s2.Salary)

--3 way
select top 1 * from
(select top 2 * from Student order by Salary desc) temp order by Salary

--4 way
select * from 
(select *,ROW_NUMBER() over (order by salary desc) as rowNumber from Student)temp where rowNumber = 2

--5 way proper work if duplicate record comes
select * from 
(select *,DENSE_RANK() over (order by salary desc) as rowNumber from Student)temp where rowNumber = 2

--6 way not work in sql
select * from Student order by Salary desc limit 0,1

