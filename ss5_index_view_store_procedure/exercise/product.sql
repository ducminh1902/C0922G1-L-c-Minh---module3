create database product;
use product;

create table product(
  id int, 
  product_code varchar(55), 
  product_name varchar(55), 
  product_price double, 
  product_amount int, 
  product_description varchar(55), 
  product_status varchar(55)
);

insert into product(
  id, product_code, product_name, product_price, 
  product_amount, product_description, 
  product_status
) value(
  1, "A01", "Tủ Lạnh", 20.000, 20, 
  "ok", "Còn hàng"
);

insert into product(
  id, product_code, product_name, product_price, 
  product_amount, product_description, 
  product_status
) value(
  2, "A02", "Ti Vi", 30.000, 15, "ok", 
  "Còn hàng"
);

insert into product(
  id, product_code, product_name, product_price, 
  product_amount, product_description, 
  product_status
) value(
  3, "A03", "Bếp", 35.000, 23, "ok", 
  "Còn hàng"
);

select 
  * 
from 
  product;
  
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
alter table 
  products 
add 
  unique index(product_code);
  
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)

alter table 
  products 
add 
  index(product_name, product_price);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain 
select 
  * 
from 
  product 
where 
  id = 3;
  
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.

create view product_view as 
select 
  product_code, 
  product_name, 
  product_price, 
  product_status 
from 
  product;
select 
  * 
from 
  product_view;
  
-- Tiến hành sửa đổi view
set 
  SQL_SAFE_UPDATES = 0;
update 
  product_view 
set 
  product_name = "Xe Đạp", 
  product_price = 15.000 
where 
  product_code like "A01";
select 
  * 
from 
  product_view;
-- Tiến hành xoá view
drop 
  view product_view;
  
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter // create procedure show_list() begin 
select 
  * 
from 
  product;
end // delimiter // call show_list;

-- Tạo store procedure thêm một sản phẩm mới
delimiter // create procedure insert_product(
  new_id int, 
  new_code varchar(55), 
  new_name varchar(55), 
  new_price double, 
  new_amount int, 
  new_description varchar(55), 
  new_status varchar(55)
) begin insert into product(
  id, product_code, product_name, product_price, 
  product_amount, product_description, 
  product_status
) value(
  new_id, new_code, new_name, new_price, 
  new_amount, new_description, new_status
);
end // delimiter // call insert_product(
  7, "A05", "Máy Giặt", 20.000, 12, 
  "ok", "còn hàng"
);

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter // create procedure edit_product(
  new_id int, 
  new_code varchar(55), 
  new_name varchar(55), 
  new_price double, 
  new_amount int, 
  new_description varchar(55), 
  new_status varchar(55)
) begin 
update 
  product 
set 
  product_code = new_code, 
  product_name = new_name, 
  product_price = new_price, 
  product_amount = new_description, 
  product_status = new_status 
where 
  id = new_id;
end // delimiter // call edit_product(
  7, "A09", "Ô Tô", 12.000, "ok", "Còn Hàng"
);

-- Tạo store procedure xoá sản phẩm theo id
delimiter // create procedure delete_product(delete_id int) begin 
delete from 
  product 
where 
  id = delete_id;
end // delimiter //
