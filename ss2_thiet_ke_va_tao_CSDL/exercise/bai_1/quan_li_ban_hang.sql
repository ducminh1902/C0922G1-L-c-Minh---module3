create database quan_li_ban_hang;
use quan_li_ban_hang;

create table customer(
c_id int primary key,
c_name varchar(55),
c_age int
);

create table `order`(
o_id int primary key,
c_id int,
foreign key(c_id) references customer(c_id),
o_date date,
o_total_price int
);

create table product(
p_id int primary key,
p_name varchar(55),
p_price double
);

create table order_detail(
o_id int,
p_id int , 
foreign key(o_id) references `order`(o_id),
foreign key(p_id) references product(p_id),
od_qty int
);