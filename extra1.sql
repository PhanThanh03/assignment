Create database ExtraASM;
 Use ExtraASM;
 
 create table Types(
 id bigint NOT NULL auto_increment primary key,
 full_name nvarchar(50),
 co_de nvarchar(5),
 modified_date date 
 
 );
 
 select * from Types;
 
 Insert into Types (full_name, co_de , modified_date)
 values ('English', '12345', now()),
 ('Tieng Viet', '23456', now());
 
 Create table demo(
 id bigint NOT NULL auto_increment primary key,
 full_name nvarchar(50),
 birth_day datetime ,
 gender Enum ('0','1', 'null','unknow'),
 isdeleted_flag bool	
 );
 
 select * from demo;
 
		 insert into demo (full_name, birth_day, gender, isdeleted_flag)
		 values ('Hoang', '2003-5-19', 'null ', 0),('Hoa', '2003-6-19' , '1 ', 1);
 
 
 