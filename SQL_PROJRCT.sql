create database store ;

show databases;

use store;


create table countries (
code int(10) primary key,
name varchar(20) not null,
continent_name varchar(20) unique
);
show columns from countries;

create table users(
id int(10) primary key ,
full_name varchar(20) ,
email varchar(20) unique ,
gender char(1) check(gender between 'm' and 'f') ,
data_of_birth varchar(15) ,
created_at datetime ,
country_code int(10) ,
foreign key(country_code) references countries(code)
);
show columns from users;


create table orders(
id int(10) primary key ,
user_id int(10) ,
status varchar(6) check(status between 'start' and 'finish') ,
created_at datetime ,
foreign key(user_id) references users(id)
);
show columns from orders;


create table products(
id int primary key ,
name varchar(10) not null ,
price int default 0,
status varchar(10) check(status between 'valid' and 'expired') ,
created_at datetime default current_timestamp
);
show columns from products;



create table order_products(
order_id int  ,
product_id int ,
quantity int(10) default 0 ,
foreign key(order_id) references orders(id) ,
foreign key(product_id) references products(id),
 CONSTRAINT PK_Person PRIMARY KEY (order_id,product_id)
);
show columns from order_products;


insert into countries(code , name , continent_name) values (1 , "Riyadh" , "saudi arabia");
select * from countries;

insert into users values(2,"Noura Alnafea","noura1@gmail.com","f","23-8-1998","2022-04-17 1:36:09 PM","1111");
select * from users;

insert into orders values(1,1,"finish","2022-04-17 1:36:09 pm");
select * from orders;

insert into products values(6 ,"makeup",500,"valid","2022-04-17 1:36:09 pm");
select * from products;

insert into order_products values(1,1,3);
select * from order_products;

update countries
set name="Jedah"
where code=1;
select * from countries;

delete from products where id=6;
select * from products;




