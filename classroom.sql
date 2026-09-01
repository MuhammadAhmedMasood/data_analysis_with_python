CREATE DATABASE IF NOT EXISTS college; -- creates a database
DROP DATABASE IF EXISTS company; -- drops a database

USE college; # selects which database will be used

CREATE TABLE student( -- create table creates a table
  id INT PRIMARY KEY, -- col name, var type, constraint
  name VARCHAR(50),
  age INT NOT NULL
);

INSERT INTO student VALUES(1, "REHNUMA",26); -- when to add into a table
INSERT INTO student VALUES(2, "Ahmed",26);

SELECT * FROM student; -- when to print a table

SHOW DATABASES;
SHOW TABLES;

DROP TABLE IF EXISTS student;
CREATE TABLE talbeilm(
   rollno INT PRIMARY KEY,
   name VARCHAR(50)
);

SELECT * FROM talbeilm; -- table printed
INSERT INTO talbeilm VALUES(1, "Ahmed Masood"); -- order is impt
INSERT INTO talbeilm VALUES(2, "Rehnuma Gill"); -- preferred when just adding one

-- another way to do it:
INSERT INTO talbeilm -- this syntax is preferred when multiple entry in one go
(rollno, name) -- this can be removed as well
VALUES
(3, "Jutt"),
(4, "Bro");

-- doing a practise qn1:
CREATE DATABASE IF NOT EXISTS dizzlerCo;
USE dizzlerCo;
CREATE TABLE employeeInfo(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT
);
INSERT INTO employeeInfo
(id, name, salary)
VALUES
(1, "Ahmed", 1000000),
(2,"Rashid",500000),
(3,"Wolf",500);

SELECT * FROM employeeinfo;
-- there is always one primary key that is unique - a column or a set of columns
-- PK can never be define as NULL. It always has to be NOT NULL.
-- there is also a foreign key. A column which exists in table A but is PK of table begin
-- so a col in one table that is PK and is used in another table, that col will be FK.
-- not necessary for FK to be unique. can have duplicate and null values.
-- constraints: some rules that apply on columns in a table.
-- NOT NULL constraint: this column will always have to have something.
-- UNIQUE: always that column has to be unique

CREATE TABLE tab1(
   id INT UNIQUE
);
INSERT INTO tab1 VALUES(101);
INSERT INTO tab1 VALUES(101); -- gives error as UNIQUE constraint given
SELECT * FROM tab1;

-- another way to define primary key:
CREATE TABLE tab2(
	id INT,
    name VARCHAR(100),
    city VARCHAR(100),
    PRIMARY KEY(id, name) -- now two columns become PK
);
-- if more than 1 column become PK, then either name or id can be duplicate
-- but combination is unique
-- FK is used to prevent actions that would destroy links between tables
CREATE TABLE temp(
	cust_id int,
    FOREIGN KEY (cust_id) references customer(id) -- customer is from another table which is PK
);
-- default constraint: sets the default value of a column

CREATE TABLE employee_(
	id INT,
    salary INT DEFAULT 25000
);

INSERT INTO employee_ (id) VALUES(100);
SELECT * FROM employee_;

-- CHECK constraint
CREATE TABLE rozgar(
	id INT,
    salary INT DEFAULT 25000,
    city VARCHAR(50),
    age INT CONSTRAINT age_check CHECK(age>=18 AND city="Delhi")
);
-- another way:
CREATE TABLE umer(
	age INT CHECK (age>=18)
);
CREATE DATABASE IF NOT EXISTS gill;
USE gill;
CREATE TABLE student(
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);
INSERT INTO student
(rollno, name, marks, grade, city)
VALUES
(1, "Ahmed", 98, 'A', 'Islamabad'),
(2, "Fasla", 59, 'C', 'WahCantt'),
(3, "Zareena", 81, 'A', 'Peshawar'),
(4, "Kareen", 33, 'E', 'Pindi'),
(5, "Ali", 79, 'B', 'Islamabad'),
(6, "Ayesha", 100, 'A', 'Islamabad'); 

-- SELECT col1, col2  FROM table_name;
-- * means all columns
SELECT name, marks FROM student;
-- DISTINCT gives us unique values
SELECT DISTINCT city FROM student;
-- WHERE clause:
-- SELECT col1, col2 FROM table_name;
-- WHERE conditions;
SELECT * FROM student WHERE marks >70; 
SELECT * FROM student WHERE city = "Islamabad";
-- multiple conditions can also be done

-- using operators in WHERE
SELECT * FROM student 
WHERE marks+10 >100; 
-- AND, OR, NOT, IN, BETWEEN, ALL, LIKE, ANY & |
SELECT * FROM student
WHERE marks > 85 AND city = "Islamabad";
-- BETWEEN 80 and 100, here 80 and 90 are inclusive
-- IN:
SELECT * FROM student
WHERE city IN ("Islamabad", "Peshawar", "lahore");
-- LIMIT clause:
SELECT * FROM student 
WHERE marks>60 
LIMIT 3; -- first 3 students
-- Order Clause
SELECT * FROM student
ORDER BY city ASC; -- ascending order
SELECT * FROM student
ORDER BY marks DESC
LIMIT 3; -- getting top 3 students
-- Aggregate Functions - they perform some functions. returns only one value
-- COUNT(), MAX(), MIN(), MINI(), SUM(), AVG()

SELECT MAX(marks) FROM student;
SELECT MIN(marks) FROM student;
SELECT AVG(marks) FROM student;
SELECT COUNT(name) FROM student; -- rollno also works

-- Group By clause
-- collects data from multiple records and group result by one or more column
-- usally works with aggt function

SELECT city, name, COUNT(rollno) FROM student
GROUP BY city, name;

-- Practise qn2:
SELECT city, AVG(marks)
FROM student
GROUP BY city
ORDER BY avg(marks); -- by defauly order by gives in asc

-- Practise qn3:
CREATE TABLE payment(
	customer_id INT PRIMARY KEY,
    customer VARCHAR(50),
    mode_ VARCHAR(20),
    city VARCHAR(20)
);
INSERT INTO payment
(customer_id, customer, mode_, city)
VALUES
(101, "Olivia Barrett", "Netbanking", "Portland"),
(102, "Ali Khan", "Credit Card", "Miami"),
(103, "John Baker", "Credit Card", "Seattle"),
(104, "Daud Raja", "Netbanking", "Denver"),
(105, "Ellie Bravo", "Credit Card", "New Orleans"),
(106, "Jake Bon", "Debit Card", "Minneapolis"),
(107, "Greg Chel", "Debit Card", "Phoenix"),
(108, "Boris Batcock", "Netbanking", "Boston"),
(109, "Ahmed Gill", "Netbanking", "Nashville"),
(110, "Den Firoja", "Credit Card", "Boston");

SELECT * FROM payment;

-- find total payment according to each payment method

SELECT mode_, COUNT(customer) -- also works with mode_
FROM payment
GROUP BY mode_;

-- HAVING Clause:
-- similar to where i.e applies condition on rows
-- used when we want to apply any condition after grouping

SELECT count(name), city
FROM student
GROUP BY city
HAVING max(marks)>90;

-- general order of clauses: SELECT cols FROM table_name WHERE condition
-- GROUP BY cols HAVING condition ORDER BY cols ASC;
-- WHERE comes before the GROUP BY and acts on rows
-- HAVING comes after GROUP BY and applies to groups of columns










