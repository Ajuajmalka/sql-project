create database ekart;
use ekart;
create table branch(branch_no int primary key,manager_id int,branch_address varchar(50),contact_no int);
insert into branch values(01,801,'ekm',652165281);
insert into branch values(02,802,'thr',652189875);
insert into branch values(03,803,'mpm',652145893);
insert into branch values(04,804,'knr',652165789);
insert into branch values(05,805,'wynd',652156784);

create table employee(emp_id int primary key,emp_name varchar(60),post varchar(60),salary decimal(10,2));
insert into employee values(801,'kiran','manager',22000);
insert into employee values(802,'midhun','incharge',12000);
insert into employee values(803,'muneer','accountant',18000);
insert into employee values(804,'manaf','cashier',14000);
insert into employee values(805,'nabeel','security',11000);

create table customer_(customer_id int primary key,customer_name varchar(30),customer_address varchar(50),reg_date date);
insert into customer_ values(101,'rahul','gandhinagar','2023-4-01');
insert into customer_ values(102,'amal','east nada','2023-4-02');
insert into customer_ values(103,'aslam','west nada','2023-4-03');
insert into customer_ values(104,'nadhirsha','kodugallur','2023-4-04');
insert into customer_ values(105,'abhi','mala','2023-4-05');

create table books(isbn varchar(20)primary key ,book_title varchar(50),category varchar(50),rental_price decimal(10,2),
status enum('yes','no'),author varchar(100),publisher varchar(100));

insert into books values('isbn_1','balyakalasagi','short story',50.00,'yes','basheer','dc books');
insert into books values('isbn_2','aadujivitham','novel',110.00,'yes','benyamin','penguin books');
insert into books values('isbn_3','khasakinte ithihasam','novel',95.00,'no','ov vijayan','current books');
insert into books values('isbn_4','mathilukal','novel',205.00,'yes','basheer','dc books');
insert into books values('isbn_5','my story','autobiography',55.00,'no','kamala surayya','sterlig publishers');

create table issuestatus(issue_id int primary key,issued_cust_id int ,issued_book varchar(50),issue_date date,
isbn_book varchar(20),foreign key(issued_cust_id)references customer_(customer_id),foreign key(isbn_book)references
books(isbn));

insert into issuestatus values(01,101,'balyakalasagi','2022-02-01','isbn_1');
insert into issuestatus values(02,102,'aadujivitham','2022-02-02','isbn_2');
insert into issuestatus values(03,103,'khasakinte ithihasam','2022-02-03','isbn_3');
insert into issuestatus values(04,104,'mathilukal','2022-02-04','isbn_4');
insert into issuestatus values(05,105,'','2022-02-05','isbn_5');

create table returnstatus(return_id int primary key, return_cust_id int,return_book_name varchar(60),
return_date date,isbn_book2 varchar(30),foreign key(return_cust_id)references customer_(customer_id),
foreign key(isbn_book2)references books(isbn));

insert into returnstatus values(01,101,'balyakalasagi','2022-4-15','isbn_1');

insert into returnstatus values(02,102,'balyakalasagi','2022-4-17','isbn_2');

insert into returnstatus values(03,103,'khasakinte ithihasam','2022-4-21','isbn_3');

insert into returnstatus values(04,104,'mathilukal','2022-4-27','isbn_4');

insert into returnstatus values(05,105,'my story','2022-4-29','isbn_5');

select book_title,category,rental_price from books where status='yes';

select emp_name,salary from employee order by salary desc;

select b.book_title,c.customer_name from issuestatus i join books b on i. isbn_book=b.isbn
join customer_ c on i.issued_cust_id=c.customer_id;

select category,count(*)as book_count from books  group by category;

select emp_name,post from employee where salary>15000;

select customer_name from customer_ where reg_date<'2022-02-02'and customer_id not in (select issued_cust_id from issuestatus);

select b.branch_no,count(*)as total_count from employee e join branch b on e.emp_id = b.manager_id = e.emp_id 
group by b.branch_no;
 
select c.customer_name from customer c join issuestatus i on c. customer_id =i. issued_cust_id
where i.issued_date >='2022-01-31' and i.issue_date <'2022-02-28';

select book_title from books where category = 'short story';

select b.branch_no,count(*)as empolyee_count from employee e
join branch b on e.emp_id = b. manager_id group by b.branch_no
having employee_count >5;


