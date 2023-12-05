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
	account_id BIGINT NOT NULL,
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
	FOREIGN KEY (category_id) REFERENCES Category(id),
	FOREIGN KEY (type_id) REFERENCES QuestionType(id),
	FOREIGN KEY (creator_id) REFERENCES Account(id)
);

DROP TABLE IF EXISTS Anwser;
CREATE TABLE Anwser(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	content text,
	question_id BIGINT NOT NULL,
	created_date DATE,
	FOREIGN KEY (question_id) REFERENCES Question(id)
);

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

SELECT * FROM Account;

INSERT INTO `Group`(name, creator_id, created_date) 
VALUES ('Lap Trinh', 2, CURDATE()), ('Choi Game', 3, CURDATE());

INSERT INTO GroupMember 
VALUES (1, 1, CURDATE()), (1, 2, CURDATE()),
(2, 1, CURDATE()), (2, 2, CURDATE()),
(2, 3, CURDATE()), (2, 4, CURDATE());


SELECT * FROM Account WHERE department_id = 1department OR department_id >= 3;

SELECT * FROM Account WHERE gender = 'Male' AND department_id = 2;

SELECT * FROM Account WHERE department_id = 2 OR department_id = 3;

SELECT * FROM Account WHERE department_id BETWEEN 1 AND 3;

SELECT * FROM Account WHERE department_id NOT IN (3);
SELECT * FROM Account WHERE department_id <> 3 AND department_id <> 2;

SELECT  * FROM Account WHERE user_name LIKE '%1%';

SELECT  * FROM Account WHERE full_name LIKE '%Thi%';

SELECT * FROM Account WHERE created_date iS NOT NULL;

SELECT count(*), department_id FROM Account 
GROUP BY department_id;

SELECT * FROM Account;

SELECT * FROM Account
WHERE user_name = 'usr11';

SELECT * FROM Account 
WHERE (id = 13 OR id = 5 OR id = 9);

SELECT * FROM Account 
WHERE email LIKE '%gmail%';

SELECT * FROM Account
WHERE gender = 'Female' AND email LIKE '%yahoo.com%';

SELECT * FROM Account
WHERE id > 14 AND id < 19;

SELECT * FROM Account
WHERE id BETWEEN 14 AND 19;

SELECT * FROM Account 
WHERE id IN (13,  5,  9);

SELECT * FROM Account 
WHERE id NOT IN (13,  5,  9);

SELECT * FROM Account
WHERE created_date IS NOT NULL;

SELECT * FROM Account
WHERE created_date IS NULL;


SELECT * FROM Account
WHERE full_name LIKE 'Tran%';

SELECT * FROM Account
WHERE user_name LIKE '%3';

SELECT * FROM Account
WHERE email NOT LIKE '%yahoo.com%';

SELECT * FROM Account
WHERE id > 14 AND id != 19;

SELECT * FROM Account
WHERE id > 14 AND id <> 19;

SELECT * FROM Account
WHERE id >= 20;

SELECT distinct department_id FROM Account;

SELECT full_name, created_date FROM Account
WHERE created_date IS NOT NULL AND created_date < '2023-12-02'
ORDER BY created_date ASC;

SELECT count(*) FROM Account;

SELECT count(*) FROM Department;

SELECT count(distinct department_id) FROM Account;


SELECT count(*) FROM Account
WHERE email LIKE '%yahoo%';


SELECT max(id) FROM Account;
SELECT min(id) FROM Account;

SELECT max(created_date) FROM Account
WHERE created_date IS NOT NULL;

SELECT min(created_date) FROM Account
WHERE created_date IS NOT NULL;

select leng(full_name) from account;

select length(full_name), id from account
where id = 3 ;

select created_date from  account
where created_date > 2020-12-20 ;



SELECT count(*) FROM Account
WHERE department_id LIKE id = 2;

select * from account
where user_name like 'd%' AND '%o';

DELETE  from exam ; 
 
delete from account where created_date = '2020-05-11';

select * from account ;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`training`.`groupmember`, CONSTRAINT `groupmember_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`))
-- với lỗi này thì phải xóa ở bảng groupmember trước e à
-- ví dụ, ở bảng groupmember đang có user 01, nhưng giờ e xóa đi, thì ở bảng groupmember trỏ sang bảng account lại k tìm thấy đâu
-- 0	24	08:19:59	delete from account where created_date = '2020-05-11'	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`training`.`group`, CONSTRAINT `group_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `account` (`id`))	0.000 sec
-- Xóa ở đây sẽ liên quan đến khóa ngoại, ví dụ như e đặt hàng shoppe, e đưa cho họ 1 địa chỉ, xong sau này e chuyển đi nơi khác, mà k xóa địa chỉ của thằng shoppe đi, thì khi đó thằng shoppe đến địa chỉ e ghi sẽ k thấy e đâu
-- 
SET SQL_SAFE_UPDATES = 0;


 




update  account
set  full_name = 'Nguyễn Bá Lộc', email = 'loc.nguyenba@vti.com' 
where id = 5 ;





 





