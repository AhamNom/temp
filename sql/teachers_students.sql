drop table if exists teachers_students;
create table teachers_students (
  id int(4) primary key auto_increment,
  teacher_id int(4),
  student_id int(4),
  course_name varchar(20),
  course_date date
) charset utf8mb4;
