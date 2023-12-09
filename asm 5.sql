DROP DATABASE IF EXISTS Training;
CREATE DATABASE IF NOT EXISTS Training;
USE Training;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name NVARCHAR(64)
);

DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name NVARCHAR(64)
);

DROP TABLE IF EXISTS Account;
CREATE TABLE Account(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_name NVARCHAR(64) NOT NULL UNIQUE,
	full_name NVARCHAR(64) NOT NULL,
	email VARCHAR(32) UNIQUE,
	gender ENUM('Male', 'Female', 'Unknown'),
    salary INT,
	department_id BIGINT NOT NULL,
	position_id BIGINT NOT NULL,
	created_date DATE,
	FOREIGN KEY (department_id) REFERENCES Department(id),
	FOREIGN KEY (position_id) REFERENCES `Position`(id)
);

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name NVARCHAR(64),
	creator_id BIGINT NOT NULL,
	created_date DATE,
	FOREIGN KEY (creator_id) REFERENCES Account(id)
);

DROP TABLE IF EXISTS GroupMember;
CREATE TABLE GroupMember(
	group_id BIGINT NOT NULL,
	account_id BIGINT,
	joined_date DATE,
	FOREIGN KEY (group_id) REFERENCES `Group`(id),
	FOREIGN KEY (account_id) REFERENCES Account(id)
);

DROP TABLE IF EXISTS QuestionType;
CREATE TABLE QuestionType(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	type varchar(32)
);

select * from questiontype ;
INSERT INTO questiontype (type )
values ('BT'),('BQ'),('BA'),('BE'),('BT');

DROP TABLE IF EXISTS Category;
CREATE TABLE Category(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	category varchar(32)
);

select * from category ;
INSERT INTO category ( category)
values ('HI'),('HA'),('HO'),('HY');

DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	content text,
	category_id BIGINT,
	type_id BIGINT NOT NULL,
	creator_id BIGINT NOT NULL,
	created_date DATE,
	FOREIGN KEY (category_id) REFERENCES Category(id),
	FOREIGN KEY (type_id) REFERENCES QuestionType(id),
	FOREIGN KEY (creator_id) REFERENCES Account(id)
);

select * from question ;
INSERT INTO question (content , category_id , type_id , creator_id , created_date)
values ('Em ăn cơm chưa ', 1,1,1,curdate()),
(' Em Nhà ở đâu thế ', 1,2,2, curdate()),
('Siêu Sale ', 1,2,3,curdate());


DROP TABLE IF EXISTS Anwser;
CREATE TABLE Anwser(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	content text,
	question_id BIGINT NOT NULL,
	created_date DATE,
	FOREIGN KEY (question_id) REFERENCES Question(id)
);
select * from anwser ; 
INSERT INTO anwser(content, question_id ,created_date)
values ('Chào anh ', 4, curdate()),
('Chào bác ', 5, curdate()),
('Chào Cô ', 6, curdate());


DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code varchar(16),
	title NVARCHAR(64),
	duration INT,
	category_id BIGINT,
	creator_id BIGINT NOT NULL,
	created_date DATE,
	FOREIGN KEY (category_id) REFERENCES Category(id),
	FOREIGN KEY (creator_id) REFERENCES Account(id)
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
	exam_id BIGINT,
	question_id BIGINT,
	FOREIGN KEY (exam_id) REFERENCES Exam(id),
	FOREIGN KEY (question_id) REFERENCES Question(id)
);


INSERT INTO Department(name) VALUES('Sale'), ('Marketing'), ('R&D'), ('Accounting');
SELECT * FROM Department;

INSERT INTO `Position`(name) VALUES('Staff'), ('Manager'), ('PM');
SELECT * FROM `Position`;

INSERT INTO Account(user_name, full_name, email, gender, department_id, position_id, created_date, salary)
VALUES ('usr01', 'Nguyen Bxx Cxx', 'usr01@email.com', 'Male', 1, 1, CURDATE(), 10000),
('usr02', 'Nguyen Bxx Cxx', 'usr02@yahoo.com', 'Male', 1, 1, '2020-05-11', 15000),
('usr03', 'Tran Bxx Cxx', 'usr03@email.com', 'Female', 1, 1, CURDATE(), 12000),
('usr04', 'Nguyen Bxx Cxx', 'usr04@yahoo.com', 'Female', 1, 2, NULL, 14000),
('usr05', 'Tran Bxx Cxx', 'usr05@email.com', 'Male', 2, 1, CURDATE(), 11000),
('usr06', 'Nguyen Bxx Cxx', 'usr06@yahoo.com', 'Male', 2, 1, CURDATE(), 15500),
('usr07', 'Le Bxx Cxx', 'usr07@email.com', 'Male', 2, 2, NULL, 12500);

INSERT INTO Account(user_name, full_name, email, gender, department_id, position_id, created_date, salary)
VALUES ('usr08', 'Axx Bxx Cxx', 'usr08@email.com', 'Male', 1, 1, CURDATE(), 17000),
('usr09', 'Le Bxx Cxx', 'usr09@yahoo.com', 'Female', 3, 1, '2021-06-19', 16500),
('usr10', 'Le Bxx Cxx', 'usr10@email.com', 'Female', 3, 1, CURDATE(), 13000),
('usr11', 'Le Bxx Cxx', 'usr11@yahoo.com', 'Male', 3, 2, NULL, 18500),
('usr12', 'Tran Bxx Cxx', 'usr12@yahoo.com', 'Female', 4, 1, '2022-02-23', 14000),
('usr13', 'Le Bxx Cxx', 'usr13@email.com', 'Male', 4, 1, NULL, 12000),
('usr14', 'Tran Bxx Cxx', 'usr14@email.com', 'Female', 4, 2, CURDATE(), 15500);

INSERT INTO Account(user_name, full_name, email, gender, department_id, position_id, created_date, salary)
VALUES ('usr15', 'Axx Bxx Cxx', 'usr15@email.com', 'Male', 1, 1, CURDATE(), 16000),
('usr16', 'Le Bxx Cxx', 'usr16@yahoo.com', 'Female', 3, 1, CURDATE(), 19500),
('usr17', 'Le Bxx Cxx', 'usr17@email.com', 'Female', 3, 1, NULL, 14000),
('usr18', 'Le Bxx Cxx', 'usr18@yahoo.com', 'Male', 3, 2, '2022-07-09', 17000),
('usr19', 'Tran Bxx Cxx', 'usr19@email.com', 'Female', 4, 1, CURDATE(), 18000),
('usr20', 'Le Bxx Cxx', 'usr20@yahoo.com', 'Male', 4, 1, NULL, 15000),
('usr21', 'Tran Bxx Cxx', 'usr21@email.com', 'Female', 4, 2, CURDATE(), 13000);

INSERT INTO Account(user_name, full_name, email, gender, department_id, position_id, created_date, salary)
VALUES ('usr22', 'Axx Bxx Cxx', 'usr22@gmail.com', 'Male', 1, 1, CURDATE(), 12000),
('usr23', 'Le Bxx Cxx', 'usr23@yahoo.com', 'Female', 3, 1, CURDATE(), 13000),
('usr24', 'Le Bxx Cxx', 'usr24@email.com', 'Female', 3, 1, NULL, 14000),
('usr25', 'Le Bxx Cxx', 'usr25@gmail.com', 'Male', 3, 2, '2022-07-09', 15000),
('usr26', 'Tran Bxx Cxx', 'usr26@email.com', 'Female', 4, 1, CURDATE(), 16000),
('usr27', 'Le Bxx Cxx', 'usr27@gmail.com', 'Male', 4, 1, NULL, 17000),
('usr28', 'Tran Bxx Cxx', 'usr28@email.com', 'Female', 4, 2, CURDATE(), 18000);

-- SELECT * FROM Account;

INSERT INTO `Group`(name, creator_id, created_date) 
VALUES ('Lap Trinh', 2, CURDATE()), ('Choi Game', 3, CURDATE());

INSERT INTO GroupMember 
VALUES (1, 1, CURDATE()), (1, 2, CURDATE()),
(2, 1, CURDATE()), (2, 2, CURDATE()),
(2, 3, CURDATE()), (2, 4, CURDATE());

INSERT INTO `Group` (name, creator_id, created_date) 
VALUES('Rocket41', 1, '2020-05-19'), ('Rocket42', 2, '2020-05-20'),('Rocket43', 2, '2021-07-25'), 
('Rocket44', 3, '2022-07-14'), ('Rocket45', 1, '2020-09-11'), ('Rocket46', 1, '2022-08-27');

SELECT * FROM `Group`;

INSERT INTO GroupMember (group_id, account_id, joined_date)
VALUES (1, 1, '2020-05-20'), (1, 2, '2020-05-21'), (1, 3, '2020-05-22'),
(2, 1, '2020-05-20'), (2, 2, '2020-05-20'), (2, 4, '2020-05-23'), (2, 5, '2020-05-24'),
(3, 2, '2021-07-29'), (3, 7, '2020-08-01'), (3, 5, '2021-09-20'),
(4, NULL, NULL), (5, NULL, NULL), (6, NULL, NULL);

SELECT * FROM GroupMember;

DROP TABLE IF EXISTS Staff;
CREATE TABLE Staff(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	staff_code NVARCHAR(64) NOT NULL UNIQUE,
	staff_name NVARCHAR(64) NOT NULL,
	email VARCHAR(32) UNIQUE,
	gender ENUM('Male', 'Female', 'Unknown'),
    salary INT,
	department_id BIGINT NOT NULL,
	position_id BIGINT NOT NULL,
	created_date DATE,
	FOREIGN KEY (department_id) REFERENCES Department(id),
	FOREIGN KEY (position_id) REFERENCES `Position`(id)
);

INSERT INTO Staff(staff_code, staff_name, email, gender, department_id, position_id, created_date, salary)
SELECT user_name, full_name, email, gender, department_id, position_id, created_date, salary
FROM Account WHERE id >= 20;

INSERT INTO Staff(staff_code, staff_name, email, gender, department_id, position_id, created_date, salary)
VALUES ('staff01', 'Axx Bxx Cxx', 'staff01@gmail.com', 'Male', 1, 1, CURDATE(), 12000),
('staff02', 'Le Bxx Cxx', 'staff02@yahoo.com', 'Female', 3, 1, CURDATE(), 13000),
('staff03', 'Le Bxx Cxx', 'staff03@email.com', 'Female', 3, 1, NULL, 14000),
('staff04', 'Le Bxx Cxx', 'staff04@gmail.com', 'Male', 3, 2, '2022-07-09', 15000);

SELECT * FROM `Group`;
SELECT * FROM GroupMember;
SELECT * FROM Account;

SELECT * FROM Account INNER JOIN GroupMember ON Account.id = GroupMember.account_id;

SELECT * FROM Account LEFT JOIN GroupMember ON Account.id = GroupMember.account_id;

SELECT * FROM Account LEFT JOIN GroupMember ON Account.id = GroupMember.account_id
WHERE GroupMember.group_id IS null;

-- SELECT group_id, account_id, full_name FROM Account RIGHT JOIN GroupMember ON Account.id = GroupMember.account_id;

-- SELECT group_id, account_id, full_name FROM Account RIGHT JOIN GroupMember ON Account.id = GroupMember.account_id
-- WHERE GroupMember.account_id IS null;

SELECT group_id, account_id, full_name FROM Account INNER JOIN GroupMember On Account.id = GroupMember.account_id;
SELECT group_id, account_id, full_name FROM Account RIGHT JOIN GroupMember ON Account.id = GroupMember.account_id;

SELECT group_id, account_id, full_name FROM Account RIGHT JOIN GroupMember ON Account.id = GroupMember.account_id
WHERE GroupMember.account_id IS NULL;

SELECT user_name, full_name FROM Account;
SELECT staff_code, staff_name FROM Staff;

SELECT full_name FROM Account
INTERSECT 
SELECT staff_name FROM Staff;

SELECT full_name FROM Account
UNION ALL
SELECT staff_name FROM Staff;

SELECT full_name FROM Account
UNION 
SELECT staff_name FROM Staff;

SELECT @@version;
-- Error Code: 1064. You have an error in your SQL syntax; 
-- check the manual that corresponds to your 
-- MySQL server version for the right syntax to use near 'SELECT staff_name FROM Staff' at line 3





-- SET SQL_SAFE_UPDATES = 0

select full_name , user_name , email, d.name from account a 
INNER JOIN department d ON a.department_id = d.id 
where d.name IN ('Sale ','marketing');

select full_name ,user_name, email  from account a
where a.department_id  not IN (select id from department where name IN ('sale'));

select * from department;

select full_name, salary  from account a where salary > ANY(
select salary from account a
where a.department_id IN (select id from department where name IN ('Sale') AND salary > 14000)	

);

select full_name, salary  from account a where salary < ALL(
select salary from account a
where a.department_id IN (select id from department where name IN ('Sale') AND salary > 14000)	

);

select full_name, salary  from account a where salary = any (
select salary from account a
where a.department_id IN (select id from department where name IN ('Sale') AND salary > 14000)	

);

select full_name, salary  from account a where salary != all (
select salary from account a
where a.department_id IN (select id from department where name IN('Sale') AND salary > 14000)	

);

select full_name, salary  from account a where salary < all (
select salary from account a
where a.department_id IN (select id from department where name IN('Sale') AND salary > 15000)	

);


select * from account a INNER JOIN department d ON a.id = d.department_id ;

select   count(*) from account a 
where salary > 15000;

 select exists(select*from account where salary >15000);
 explain select exists(select*from account where salary >15000);
 
select exists(select * from account where created_date <2022);

 -- vd
SELECT SUM(salary) AS dept_payment, department_id FROM Account GROUP BY department_id;
-- 96000
-- 39000
-- 140500
-- 138500

-- 2
SELECT SUM(dept_payment)/count(*) AS avg_payment FROM (SELECT SUM(salary) AS dept_payment, department_id FROM Account GROUP BY department_id) A;


-- c1
SELECT A.dept_payment - B.avg_payment FROM
(
SELECT SUM(salary) AS dept_payment, department_id FROM Account GROUP BY department_id) A,
(
SELECT SUM(dept_payment)/count(*) AS avg_payment FROM (SELECT SUM(salary) AS dept_payment, department_id FROM Account GROUP BY department_id) C
) B;

-- c2
WITH
    dept_payment AS ( SELECT SUM(salary) AS dept_salary, department_id FROM Account GROUP BY department_id ),
    avg_payment AS ( SELECT SUM(dept_salary)/count(*) AS dept_avg FROM dept_payment)
SELECT dept_payment.dept_salary - avg_payment.dept_avg as thanh FROM dept_payment, avg_payment having thanh >0 ;

-- question 1 
create view sale_tbl AS
Select user_name, full_name, email, d.name from account a INNER JOIN department d ON a.department_id = d.id
where d.name = 'Sale' ;
select * from sale_tbl ;

-- question 2
create view group_tbl AS 
 select full_name,g.group_id from account a INNER JOIN groupmember g ON a.id = g.account_id
 where g.group_id;
 select * from group_tbl ;
 
 -- question 3 	
  
  select content from question q INNER JOIN anwser a ON q.id = a.question_id ;
  
 
 -- question 4 
 select * from account a INNER JOIN department d ON a.department_id = d.id;
 
 create view dpm_tbl  AS
  select a.department_id ,d.name , count(*) AS SO_LUONG from account a INNER JOIN department d ON a.department_id = d.id
  group by a.department_id ,d.name   ;
  
  select * from  dpm_tbl;
  
  -- question 5
   
    create view PS_tbl AS
     select full_name ,content  from account a inner join question q on a.id = q.id
	where a.full_name like 'Nguyen%';
    
    select * from ps_tbl;

 