create database selling_manager;
use selling_manager;

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
  p_id int, 
  foreign key(o_id) references `order`(o_id), 
  foreign key(p_id) references product(p_id), 
  od_qty int
);

insert into customer(c_id, c_name, c_age) value (1, "Minh Quan", 10);
insert into customer(c_id, c_name, c_age) value (2, "Ngoc Oanh", 20);
insert into customer(c_id, c_name, c_age) value (3, "Hong Ha", 50);

insert into `order` (o_id, c_id, o_date, o_total_price) value(1, 1, "2006-03-21", null);
insert into `order` (o_id, c_id, o_date, o_total_price) value(2, 2, "2006-03-23", null);
insert into `order` (o_id, c_id, o_date, o_total_price) value(3, 1, "2006-03-16", null);

insert into product(p_id, p_name, p_price) value(1, "May Giat", 3);
insert into product(p_id, p_name, p_price) value(2, "Tu Lanh", 5);
insert into product(p_id, p_name, p_price) value(3, "Dieu Hoa", 7);
insert into product(p_id, p_name, p_price) value(4, "Quat", 1);
insert into product(p_id, p_name, p_price) value(5, "Bep Dien", 2);

insert into order_detail(o_id, p_id, od_qty) value(1, 1, 3);
insert into order_detail(o_id, p_id, od_qty) value(1, 3, 7);
insert into order_detail(o_id, p_id, od_qty) value(1, 4, 2);
insert into order_detail(o_id, p_id, od_qty) value(2, 1, 1);
insert into order_detail(o_id, p_id, od_qty) value(3, 1, 8);
insert into order_detail(o_id, p_id, od_qty) value(2, 5, 4);
insert into order_detail(o_id, p_id, od_qty) value(2, 3, 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select 
  o_id, 
  o_date, 
  o_total_price 
from 
  `order`;
  
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select 
  customer.c_name as "khách hàng đã mua hàng" 
from 
  customer 
  join `order` on customer.c_id = `order`.c_id;
select 
  product.p_name as "sản phẩm được mua" 
from 
  product 
  join order_detail on product.p_id = order_detail.p_id;
  
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select 
  customer.c_id, 
  customer.c_name as "khách hành không mua hàng" 
from 
  customer 
where 
  customer.c_name not in (
    select 
      customer.c_name as "khách hàng đã mua hàng" 
    from 
      customer 
      join `order` on customer.c_id = `order`.c_id
  );
