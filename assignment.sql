Create Database Assignment;
Use Assignment;

Create Table Department(
Department_id int,
Department_name nvarchar(50)	
);

create table Position (
position_id int,
position_name nvarchar(50)

);

Create table Account (
Account_id int,
Email nvarchar(50),
Usename nvarchar(50),
Fullname nvarchar(50),
Department_id int,
Position_id int,
Create_Date date


);
