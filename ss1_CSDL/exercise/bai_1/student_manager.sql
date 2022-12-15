create database student_manager;
use student_manager;
create table class (
  id int, 
  name varchar(55)
);

create table teacher(
  id int, 
  name varchar(55), 
  age int, 
  country varchar(55)
);

insert into class(id, name) value(1, "minh"), 
(2, "meo meo"), 
(3, "doraemon");

insert into teacher(id, name, age, country) value(
  1, "Nguyễn Văn A", 28, "VietNam"
);

insert into teacher(id, name, age, country) value(
  2, "Nguyễn Văn B", 30, "VietNam"
);

insert into teacher(id, name, age, country) value(
  3, "Nguyễn Văn C", 32, "VietNam"
);

select 
  * 
from 
  class;
select 
  * 
from 
  teacher;
