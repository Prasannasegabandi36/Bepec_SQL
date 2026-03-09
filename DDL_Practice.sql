show databases;
drop database bepec;
create database bepec;
use bepec;
show tables;

create table students
(
student_id int,
name varchar (50),
email varchar (100),
city varchar (50)
);
#Create a Courses Table
Create table courses 
(
course_id int,
course_name varchar(50),
instructor varchar(50),
price int 
);
describe table courses;
show tables;
# command to describe the table schema
describe students;
# Display all tables present in the database.
show tables;
#Display the structure of the students table.
describe students;
#Add a column phone_number.
alter table students
add phone_number varchar(10);
#You realize phone numbers may include country codes, so increase the size to VARCHAR(20).
alter table students
modify phone_number varchar(20);
#Rename the column name to student_name
alter table students
change name student_name VARCHAR(50);
# the company decides to rename the table students to platform_students.
rename table students to platform_students;
describe  platform_students;

# Add a column enrollment_date to store when students joined.
alter table platform_students
add enrollment_date DATE;

# You decide course price should allow decimals. Modify the datatype of price in courses.
describe table courses;
show tables;
alter table courses
modify price decimal(10,2);

# Remove all students from the table but keep the structure.
delete from platform_students;
# Quickly remove all rows from the courses table.
truncate table courses;

# You no longer want to store the city column.
alter table platform_students
drop column city;
# Remove the courses table completely from the database.
drop table courses;
# Display all databases
SHOW DATABASES;