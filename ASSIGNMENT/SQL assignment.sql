create schema nairobi_academy;
set search_path to nairobi_academy;

create table students(student_id INT primary key,
first_name VARCHAR(50) not null,
last_name VARCHAR(50) not null,
gender VARCHAR(1),
date_of_birth DATE,
class VARCHAR(10),
city VARCHAR(50));

insert into students( student_id, first_name, last_name, gender, date_of_birth, class, city)
values
(1,'Amina', 'Wanjiku', 'F', '2008-03-12', 'form 3', 'Nairobi'),
(2,'Brian', 'Ochieng', 'M', '2007-07-25', 'form 4', 'Mombasa'),
(3,'Cynthia', 'Mutua', 'F', '2008-11-05', 'FORM 3', 'Kisumu'),
(4,'David', 'Kamau', 'M', '2007-02-18', 'form 4', 'Nairobi'),
(5,'Esther', 'Akinyi', 'F', '2009-06-30', 'form 2', 'Nakuru'),
(6,'Felix', 'Otieno', 'M', '2009-09-14', 'form 2', 'Eldoret'),
(7,'Grace', 'Mwangi', 'F', '2008-01-22', 'form 3', 'Nairobi'),
(8,'Hassan', 'Abdi', 'M', '2007-04-09', 'form 4', 'Mombasa'),
(9,'Ivy', 'Chebet', 'F', '2009-12-01', 'form 2', 'Nakuru'),
(10,'James', 'Kariuki', 'M', '2008-08-17', 'form 3', 'Nairobi');

create table subjects(subject_id INT primary key,
subject_name VARCHAR(100) not null unique,
department VARCHAR(50),
teacher_name VARCHAR(100),
credits INT );

insert into subjects(subject_id, subject_name, department, teacher_name, credits)
values
(1, 'Mathematics', 'sciences', 'Mr.Njoroge', 4),
(2, 'English', 'languages', 'Ms,Adhiambo', 3),
(3, 'Biology', 'sciences', 'Ms.Otieno', 4),
(4, 'History', 'humanities', 'Mr.Waweru', 3),
(5, 'Kiswahili', 'languages', 'Ms.Nduta',3),
(6, 'Physics', 'sciences', 'Mr.Kamande', 4),
(7, 'Geography', 'humanities', 'Ms.Chebet', 3),
(8, 'Chemistry', 'scinces','Ms.Muthoni', 4),
(9, 'Computer studies', 'sciences', 'Mr.Oduya',3),
(10, 'Business studies', 'humanities', 'Ms.Wangari',3);

select * from students;
select * from subjects;

create table exam_results(result_id INT primary key,
student_id INT not null,
subject_id INT not null,
marks INT not null,
exam_date DATE,
grade VARCHAR(2));

insert into exam_results(result_id, student_id, subject_id, marks,exam_date, grade)
values 
(1,1,1,78,'2024-03-15','B'),
(2,1,2,85,'2024-03-16','A'),
(3,2,1,92,'2024-03-15','A'),
(4,2,3,55,'2024-03-17','C'),
(5,3,2,49,'2024-03-16','D'),
(6,3,4,71,'2024-03-18','B'),
(7,4,1,88,'2024-03-15','A'),
(8,4,6,63,'2024-03-19','C'),
(9,5,5,39,'2024-03-20','F'),
(10,6,9,95,'2024-03-21','A');

select *from exam_results;

alter table students
add column phone_number VARCHAR(20);

alter table subjects
rename column credits to credit_hours;

alter table students
drop column phone_number;

select * from students;
select* from subjects;
select* from exam_results;

update students
set city ='Nairobi'
where student_id = 5;

update exam_results
set marks = 59
where result_id = 5;

delete from exam_results
where result_id = 9;

select first_name, last_name, class 
from students 
where class = 'form 4';

select subject_name, department
from subjects
where department = 'sciences';

select marks
from exam_results
where marks >= 70;

select first_name, last_name, gender 
from students
where gender = 'F';

select first_name, last_name, class, city 
from students
where class = 'form 3' and city ='Nairobi';

select first_name, last_name, class 
from students 
where class = 'form2' or class = 'form 4';

select marks 
from exam_results 
where marks between 50 and 80;

select subject_id, exam_date 
from exam_results
where exam_date between'2024-03-15' and '2024-03-18';

select first_name, last_name, city 
from students 
where city in('Nairobi','Mombasa','Kisumu');

select first_name, last_name, class 
from students 
where class not in('form 2', 'form 3');

select first_name
from students 
where first_name like 'A%' or first_name like 'E%';

select subject_name 
from subjects
where subject_name like '%studies%';

select count(*) 
from students
where class = 'form 3';

select count(*) 
from exam_results
where marks >=70;

select * from exam_results;

select *,
case
when marks >=80 then 'distinction'
when marks >=60 then 'merit'
when marks >=40 then 'pass'
else 'fail'
end as perfomance
from exam_results;

SELECT 
    first_name, 
    last_name, 
    class,
    CASE 
        WHEN class IN ('Form 3', 'Form 4') THEN 'Senior'
        WHEN class IN ('Form 1', 'Form 2') THEN 'Junior'
        ELSE 'Other' 
    END AS student_level
FROM Students;

show search_path;
select * from students;
select * from subjects;
select * from exam_results;





