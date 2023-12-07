DROP DATABASE IF EXISTS Training;
CREATE DATABASE IF NOT EXISTS Training;
USE Training;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
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

DROP TABLE IF EXISTS Category;
CREATE TABLE Category(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	category varchar(32)
);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	content text,
	category_id BIGINT,
	type_id BIGINT NOT NULL,
	creator_id BIGINT NOT NULL,
	created_date DATE,
	FOREIGN KEY (category_id) REFERENCES Category(id) on update cascade on delete cascade,
	FOREIGN KEY (type_id) REFERENCES QuestionType(id) on update cascade on delete cascade,
	FOREIGN KEY (creator_id) REFERENCES Account(id) on update cascade on delete cascade
);
select * from category ;
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
values ('Chào anh ', 1, curdate()),
('Chào bác ', 1, curdate()),
('Chào Cô ', 2, curdate()),
('NULL ', 2, curdate());

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

select * from exam ; 


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

SELECT * FROM Account;

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

select * from category ;
INSERT INTO category ( category)
values ('HI'),('HA'),('HO'),('HY');

select * from questiontype ;
INSERT INTO questiontype (type )
values ('BT'),('BQ'),('BA'),('BE'),('BT');

select * from question ;
select * from question ;
INSERT INTO question (content , category_id , type_id , creator_id , created_date)
values ('Em ăn cơm chưa ', 1,1,1,curdate()),
(' Em Nhà ở đâu thế ', 1,2,2, curdate()),
('Siêu Sale ', 1,2,3,curdate());


-- SET SQL_SAFE_UPDATES = 0
 select full_name , name   from account INNER JOIN position ON account.position_id = position.id ;

select * from account ;
Select created_date from account 
where created_date > 2010-12-20 ;


select * from department ;
select  * from `account` INNER JOIN department ON `account`.department_id = department.id ;
    select  department_id, count(*) AS so_luong_nhan_vien from account 
	group by department_id;
    
    select  department_id, count(*) AS so_luong_nhan_vien from account 
	group by department_id 
    having so_luong_nhan_vien  >3 ;

    select  department_id, department.name,  count(*) AS so_luong_nhan_vien from `account` 
    INNER JOIN department ON `account`.department_id = department.id
	group by department_id 
    having so_luong_nhan_vien  >3 ;

    
    
    select max(content) from question
    group by content 
    limit 1 ;
    
  select * from question ;
    
    SELECT content
FROM question
ORDER BY LENGTH(content) DESC
LIMIT 1;

select  count(*) from question
where category_id;

select * from question INNER JOIN anwser ON question.id = anwser.questionid ;

select * from anwser ;

select * from question inner join anwser ON question.id = anwser.question_id;

select question_id from anwser 
order by length(question_id) desc;

select count(*) AS SO_LUONG_ACCOUNT from account INNER JOIN groupmember ON account.id= groupmember.account_id ;

    
    select min(name) from account INNER JOIN position ON account.position_id = position.id ;
    
    select * from account as a inner join `group` as g on a.id = g.id; 
SELECT id, COUNT(*) AS so_luong_account
FROM account
GROUP BY id; 

    select * from account INNER JOIN department ON account.department_id = department.id ;

  select  department_id, department.name,  count(*)  from `account` 
    INNER JOIN department ON `account`.department_id = department.id
	group by department_id ;
    
    
    select * from department ;
     select * from `group`;
    
   
     
     
     select * from account  LEFT JOIN groupmember ON account.id = groupmember.account_id;
     select * from groupmember
     where  groupmember.account_id is   null;
     
select * from account;
select * from account;


    

