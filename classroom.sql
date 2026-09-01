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

SELECT city FROM student WHERE grade = 'A'
GROUP BY city HAVING MAX(marks)>90;

-- TABLE related queries
-- 1. update
UPDATE student SET grade = "O" WHERE grade = "A"; -- initially gives safe mode error
SET SQL_SAFE_UPDATES = 0; -- safe mode off 

SELECT * FROM student;

-- 2. DELETE
DELETE FROM student where marks < 35;
SELECT * FROM student;

-- revisiting FK

CREATE TABLE dept(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT into dept
VALUES
(101, "english"),
(102, "maths");
SELECT*FROM dept;

UPDATE dept SET id = 103 WHERE id = 102;

CREATE TABLE teacher(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

DROP TABLE teacher;

INSERT INTO teacher
VALUES
(101, "Adam", 101),
(102, "Eve", 102);

SELECT*FROM teacher;

-- parent table (from where FOREIGN KEY comes)
-- child table (that uses that FOREIGN KEY)

-- CASCADING FK i.e if one place change happens, other places will also have that change

-- ALTER in TABLE:
-- ALTER changes the schema i.e in the cols

-- Example:
ALTER TABLE student
ADD COLUMN age INT;
SELECT*FROM student;
ALTER TABLE student
DROP COLUMN age;
SELECT*FROM student;

-- RENAME TO new_table_name using ALTER
-- CHANGE COLUMN
-- MODIFY COLUMN

ALTER TABLE student
ADD COLUMN age INT NOT NULL DEFAULT 19;
ALTER TABLE student
MODIFY COLUMN age VARCHAR(50);
-- ALTER TABLE student CHANGE age stu_age INT;
-- ALTER TABLE student DROP COLUMN stu_age;
-- ALTER TABLE student RENAME to stu;

-- TRUNCATE - deletes all the data from table (table remains there)
-- TRUNCATE TABLE table_name
-- DROP delets the table(not just the data)

-- practise qn 3:
-- change the name of col name to full_name
-- delete all the students who scored marks less than 80
-- delete col for grade
SELECT * FROM student;
ALTER TABLE student CHANGE name full_name VARCHAR(59);
DELETE FROM student WHERE marks<80;
ALTER TABLE student DROP COLUMN grade;

-- joins in sql:
-- combines rows from two or more tables, based on a related column between them
-- inner join -> some intersection (common data)
-- outer join - 3 types:
-- left join -> In table A and overlap between A and B. But not B only
-- right join 0> In table B and overlap between A and b
-- full join -> complete

-- inner join: SELECT col FROM tableA INNER JOIN tableB ON tableA.col_name = tableB.col_name;
-- alias - alternate name e.g FROM student as s

-- left join: SELECT cols FROM tableA LEFT JOIN tableB on tableA.col_name = tableB.col_name;
-- right join: SELECT cols FROM tableA RIGHt JOIN tableB on tableA.col_name = tableB.col_name;
-- full join: SELECT cols FROM tableA FULL JOIN tableB on tableA.col_name = tableB.col_name;

-- MySQL doesnt have FULL JOIN, so use UNION of LEFT JOIN and RIGHT JOIN

-- left exclsuive join (only A which is not in B) ->
-- FROM * SELECT student as s LEFT JOIN course as c ON a.id = c.id WHERE c.id IS NULL;

-- right exlsuive join (only b which is not in A)
-- FROM * SELECT student as s RIGHT JOIN course as c ON a.id = c.id WHERE a.id IS NULL;

-- SELF JOIN: a regular join like an inner join but the table is joined is itself
-- SELECT cols FROM table as a JOIN table as b ON a.id = b.manager_id;

-- UNION
-- SELECT cols FROM tableA UNION SELECT cols FROM tableB

-- UNION ALL - gives duplicates

-- SQL Sub Queries:

-- SELECT cols FROM table_name WHERE co_name operator (subquery);
SELECT full_name, marks FROM student
WHERE marks>(SELECT AVG(marks) FROM student);

-- another example:
-- even roll nos and find student names
SELECT full_name, rollno FROM student
WHERE rollno = (SELECT rollno FROM student WHERE rollno%2=0);
-- can also use IN: WHERE roll no IN ();

-- so far we have written subquery in WHERE
-- another example: here subquery will be written in FROM

SELECT * FROM student WHERE city = "Islamabad";
SELECT max(marks) FROM (SELECT * FROM student WHERE city = "Islamabad") as temp;

-- example of subquery after SELECT

SELECT (SELECT max(marks) FROM student), full_name FROM student;

-- MySQL Views
-- views are virtual tables taken from the real table, only a portion of it.
CREATE VIEW view1 AS SELECT rollno, full_name FROM student;
SELECT * FROM view1;
 














