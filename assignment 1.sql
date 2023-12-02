create Database Assignment;
Use Assignment;

Create Table Department(
department_id bigint NOT NULL auto_increment primary key,
department_name nvarchar(50)	
);
 
 select * from department;
 
 insert into department (department_name)
 values ('sale'),('marketing'),('digital'),('photoshop'),('tkdh');



create table Position (
position_id bigint NOT NULL auto_increment primary key,
position_name nvarchar(50)

);

 select * from position;
 
 insert into  position (position_name)
 values ('Dev'),('Test'),('Scrum'),('Master'),('PM');


	Create table Account (
	account_id bigint NOT NULL auto_increment primary key,
	email nvarchar(50) unique,
	use_name nvarchar(50),
	full_name nvarchar(50),
	department_id int,
	position_id int,
	create_date date
	);

select * from Account;
INSERT into Account  (email, use_name, full_name, department_id, position_id, create_date)
values ('hu@email', 'thanh', 'phan thanh', 1, 1, now()),
	('ha@email', 'hanh', 'Van', 2, 2, now()),
    ('hy@email', 'thang', 'van thang', 3, 3, now()),
    ('ho@email', 'phuc', 'phuc ho', 4, 4, now()),
    ('he@email', 'danh', 'vo danh ', 5, 5, now());





Create table `Group`(
group_id bigint NOT NULL auto_increment primary key,
group_name nvarchar(50) unique,
creator_id bigint,
creator_date date
);

select * from `group`;

insert into `group`	(group_name, creator_id , creator_date)
values('vin', 1, now()),
('vinfast', 2, now()),
('sun', 3, now()),
('vinasun', 4, now()),
('grab', 5, now());




create table Groupaccount(
group_id bigint NOT NULL auto_increment primary key,
account_id bigint unique,
join_date date
);
select * from groupaccount;

insert into Groupaccount ( account_id , join_date)
values (1, now()),		
 (2 , now()),
 (3, now()),
 (4 , now()),
 (5, now());





create table typequestion(
type_id bigint NOT NULL auto_increment primary key,
type_name nvarchar(50)
);

select * from typequestion ;

insert into typequestion ( type_name)
values ('Thanh'), ('Hoa'),('Hoang'),('Hanh'),('Thang');


create table categoryquestion(
category_id bigint NOT NULL auto_increment primary key,
category_name nvarchar(50)
);

select * from categoryquestion ;

insert into categoryquestion(category_name)
values ('hu'),('ha'),('hua'),('thu'),('ghu');

create table question(
question_id bigint NOt NULL auto_increment primary key,
content nvarchar(50),
category_id bigint,
type_id bigint,
creator_id bigint,
creator_date date

);

select * from question;

insert into question ( content, category_id, type_id, creator_id, creator_date)
values ('sale', 1, 1, 1, now());

 


create table answer(
answer_id bigint NOT NULl auto_increment primary key,
content nvarchar(50),
question_id bigint,
iscorrect bool 

);
 trainee
 select * from answer;
  
insert into answer (content, question_id, iscorrect)
values ('python', 1, 1), ('java', 1, 1);

insert into answer (content, question_id, iscorrect)
values ('ahihi', 1, 0);


create table exam(
exam_id int NOT NULL auto_increment primary key,
co_de bigint,
title nvarchar(50),
category_id int,
duration int ,
creator_id int,
creator_date date 

);

select *from exam;
insert into exam ( co_de , title, category_id, duration, creator_id, creator_date)
values ('1' ,' Hk2' , '1', 60 , 2 , now() );


create table ExamQuestion(
exam_id bigint NOT NULL auto_increment primary key,
question_id bigint
);

select * from examquestion ;

insert into examquestion(question_id)
values (12);

 
  drop table if exists exam;
  
  

create table Trainee(
Trainee_id int,
Full_name nvarchar(50),
birth_Date date,
gender nvarchar(1),
Trainning_calss int,
evalunation_Notes nvarchar(50),
ET_IQ int,
ET_Gmath int,
ET_Einglish int
);
ALTER table trainee
add column VTI_account nvarchar(50) NOT NULL unique;



  
