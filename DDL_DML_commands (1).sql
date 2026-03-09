# DDL Commands
# Data Definition Language commands in Mysql are used to define, modify and manage the structre of database
# objects such as tables, indexes, views, etc.

# DDL Commands:
# 1. CREATE : Create a database objects
# 2. ALTER: Modify the existing database objects
# 3. DROP: Delete the database objects
# 4. TRUNCATE: Removes all records from a table
# 5. RENAME: Rename database objects
# 6. SHOW: Displays database structure information
# 7. DESC or DESCRIBE: Show the table structure



show databases;
drop database bepec;
create database bepec;
use bepec;
show tables;


# create a table named mobile

create table mobile
(
mobile_number int,
mobile_name varchar(20),
manufacturing_year int,
cost int
);

# command to describe the table schema
describe mobile;


# add new attribute to the table
alter table mobile add color varchar(10);

# change the attribute name color to mobile color
alter table mobile rename column color to mobile_color;

# modify the attribute datatype
alter table mobile modify column mobile_color varchar(7);
-- alter table mobile modify column mobile_color int;


# drop attributes from a table
alter table mobile drop column mobile_color;

#change table name
alter table mobile rename to mobile_description;

desc mobile_description;

# drop command
drop table mobile_description;
drop database bepec;


select * from mobile_description;

insert into mobile_description values (123456780, "BBB", 2015, 10000);
insert into mobile_description(mobile_number, mobile_name, manufacturing_year, cost) values (123456789, "AAA", 2012, 7000);
insert into mobile_description(mobile_name, cost, mobile_number, manufacturing_year) values ("ccc", 12000, 23459385, 2016);
insert into mobile_description(mobile_number, mobile_name, manufacturing_year, cost) values (879879, "EEE", 2017, 12000), (12123475, "DDD", 2013, 14000);


select * from mobile_description;

# truncate
# It is used to delete all rows from the table and free the
# space containing in the table.

truncate table mobile_description;
desc mobile_description;

drop table mobile_description;

# The difference between truncate and drop is truncate is 
# going to delete the records from the table, however, the
# table schema is preserved. But, drop is going to remove 
# entirely the table as well as all the records inside it.

#DML -> DATA MANIPULATION LANGUAGE
#1. INSERT
#2. UPDATE
#3. DELETE

#insert record (tuples) into the table

insert into mobile_description values (12345, "AA", 2019, 15000);
select * from mobile_description;
insert into mobile_description (mobile_name, cost, mobile_number, manufacturing_year) values ("AA", 17000, 12638721, 2020);
insert into mobile_description (mobile_name, cost, mobile_number, manufacturing_year) values ("AA", 17000, 12638721, 2020), ("BB", 14000, 65327153, 2021), ("CC", 20000, 237493284, 2015);

alter table mobile_description add mobile_id int primary key auto_increment;
alter table mobile_description modify column mobile_id int;
alter table mobile_description drop primary key;
desc mobile_description;


# update a tuple in the table
set SQL_SAFE_UPDATES=0;
# update (table_name) set (attribute_name) = (attribute_value) (optional : where clause)
update mobile_description set mobile_name = "some_name" where mobile_name="AAA";
update mobile_description set cost = 15000 where mobile_name="some_name";



update mobile_description set mobile_name = "XX";
update mobile_description set mobile_name = "YY", manufacturing_year=2017 where mobile_number = 123456789;
update mobile_description set mobile_name = "XY", manufacturing_year=2016, cost=15000 where mobile_id = 1;


insert into mobile_description (mobile_name, cost, mobile_number, manufacturing_year) values ("AA", 18000, 126387246, 2021), ("AA", 18000, 126387246, 2022), ("AA", 15000, 126387246, 2023);


update mobile_description set mobile_name = "BB" where manufacturing_year=2022 and cost=18000;


# Delete Command
# delete from (table_name) where condition;


delete from mobile_description where mobile_number=123456789;

delete from mobile_description where mobile_name in ("BBB", "ccc");
select * from mobile_description;

delete from mobile_description;

delete from mobile_description where manufacturing_year = 2017 and cost=12000;

delete from mobile_description where cost >= 17000;
alter table mobile_description drop column cost;
alter table mobile_description drop column mobile_number, manufacturing_year;




