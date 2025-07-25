show databases;
create database company1;
use company1;
show tables;
create table branch
B_ID int primary key,
B_NAME varchar (30),
location varchar (40)
);
desc branch;
INSERT INTO BRANCH VALUES(01,"MANAGEMENT BRANCH","DELHI");
INSERT INTO BRANCH VALUES(02,"HEAD OFFICE","BANGLORE");
INSERT INTO BRANCH VALUES(03,"MUMBAI","ADHERI");
CREATE TABLE department (
    d_id INT PRIMARY KEY,
    D_Name VARCHAR(30),
    B_ID INT,
    CONSTRAINT FOREIGN KEY (B_ID)
        REFERENCES Branch (B_ID)
);
desc department;
create database bacth4pm;
use bacth4pm;
create table customer (c_id varchar(10),name varchar(20),address varchar(30),contact bigint);
desc customer;
alter table orders add constraint fk_cust_order1 foreign key(c_id) references customer (c_id);
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    ManagerID INT,
    Salary DECIMAL(10, 2),
    JoinDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
use bacth4pm;
-- Drop tables if already exist
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
-- Create Department Table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    Location VARCHAR(100)
);
INSERT INTO Department (DepartmentID, DepartmentName, Location) VALUES
(1, 'HR', 'Delhi'),
(2, 'Finance', 'Mumbai'),
(3, 'IT', 'Bangalore'),
(4, 'Sales', 'Chennai'),
(5, 'Support', 'Hyderabad');
-- Create Employee Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    ManagerID INT,
    Salary DECIMAL(10, 2),
    JoinDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
INSERT INTO Employee (EmployeeID, Name, DepartmentID, ManagerID, Salary, JoinDate) VALUES
(101, 'Amit Sharma', 1, NULL, 60000, '2022-01-15'),
(102, 'Bhavna Mehra', 2, 101, 55000, '2022-03-18'),
(103, 'Chirag Verma', 3, 101, 65000, '2022-05-22'),
(104, 'Deepa Rawat', 3, 103, 70000, '2022-07-25'),
(105, 'Eshan Singh', 4, 101, 48000, '2022-09-29'),
(106, 'Farah Khan', 5, 101, 52000, '2022-11-30'),
(107, 'Gaurav Patel', 1, 101, 58000, '2023-01-10'),
(108, 'Heena Das', 2, 102, 61000, '2023-02-15'),
(109, 'Imran Ali', 3, 103, 54000, '2023-03-21'),
(110, 'Jyoti Rana', 4, 105, 47000, '2023-04-18'),
(111, 'Kunal Joshi', 5, 106, 51000, '2023-05-20'),
(112, 'Lata Sharma', NULL, NULL, 40000, '2023-06-12'),  -- No department (test LEFT JOIN)
(113, 'Manoj Bhat', 1, 107, 63000, '2023-07-25'),
(114, 'Nisha Jain', 2, 108, 57000, '2023-08-30'),
(115, 'Omkar Rao', 3, 104, 75000, '2023-09-05'),
(116, 'Pooja Sen', 4, 110, 49000, '2023-10-10'),
(117, 'Qasim Sheikh', NULL, NULL, 42000, '2023-11-11'), -- No department
(118, 'Ritika Ghosh', 5, 106, 53000, '2023-12-01'),
(119, 'Sanjay Sinha', 1, 107, 62000, '2024-01-01'),
(120, 'Tina Kaur', 2, 102, 58000, '2024-02-12'),
(121, 'Uday Bhatt', 3, NULL, 67000, '2024-03-15');
 use  bacth4pm;
select * from employee where name like "%a";
select * from employee where name like "%t%";
select  distinct(DepartmentID) from employee;
select * from employee where name in("amit sharma","rahul singh","sumit varma");
select * from employee where salary in(40000,45000,50000,55000);
select * from  employee where salary between 40000 and 50000;
select * from employee order by salary asc;
select DepartmentID, max(salary) from employee group by DepartmentID;
select DepartmentID,count(*) from employee group by departmentID order by count(*);
create database practise;
use bacth4pm;
select DepartmentID,sum(salary) as total_salary from employee group by DepartmentID; 
select DepartmentID,sum(salary) as total_salary from employee group by DepartmentID having total_salary > 150000;
use bacth4pm;
  -- find department with avg salary less than 550000;
select DepartmentID,avg(salary) as AVG_salary from employee group by DepartmentID having Avg_salary<55000;
  
  -- list all manager having more than two employee under them
select managerid,count(*) as total_emp from employee group by managerid having total_emp>2;
-- total count >2
select managerid,count(*) as total_emp from employee where managerid is not null group by managerid having total_emp > 2;

select * from employee where departmentid is null;

select * from employee order by JoinDate;
select * from employee order by JoinDate desc;

-- list department in alphabatical order 
select * from department;
select * from department order by DepartmentName;

-- show top five highest paid employee
select* from employee order by salary desc limit 5;

-- decrease the salry by 5% of all employee
select salary - (salary*5)/100 as dud_salary  from employee;
select round(salary - (salary*5)/100) as dud_salary  from employee;


