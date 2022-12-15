create database student_insert;
use student_insert;

create table class(
class_id int primary key,
class_name varchar(55),
start_date datetime,
status int
);

create table student(
student_id int primary key,
student_name varchar(55),
address varchar(55),
phone varchar(55),
status int,
class_id int,
foreign key(class_id) references class(class_id) 
);

create table `subject`(
sub_id int primary key,
sub_name varchar(55),
credit int,
statuc int
);

create table mark(
mark_id int,
sub_id int ,
foreign key(sub_id) references `subject`(sub_id),
student_id int,
foreign key(student_id) references student(student_id),
mark int,
exam_times int
);

INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO class
VALUES (3, 'B3', current_date, 0);

INSERT INTO student 
VALUES (1,'Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (student_id, student_name, address, status, class_id)
VALUES (2,'Hoa', 'Hai phong', 1, 1);
INSERT INTO student (student_id,student_name, address, phone, status, class_id)
VALUES (3,'Manh', 'HCM', '0123123123', 0, 2);


INSERT INTO `subject`
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO mark (mark_id,sub_id, student_id, mark, exam_times)
VALUES (1,1, 1, 8, 1),
       (2,1, 2, 10, 2),
       (3,2, 1, 12, 1);       
       
       
       
 -- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student where student_name  like "H%";
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class where start_date like "%-12-%";
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from `subject` where credit = "3" or credit = "4" or credit = "5";
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
 set SQL_SAFE_UPDATES = 0;
update student set class_id = 2 where student_name = "Hung";
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select student.student_name,`subject`.sub_name,mark.mark from student 
join mark on student.student_id=mark.student_id
join `subject` on mark.sub_id= `subject`.sub_id
order by mark.mark desc;