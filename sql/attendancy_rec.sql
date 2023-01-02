drop table if exists attendancy_rec;
create table attendancy_rec (
  id int(4) primary key auto_increment,
  student_id int(4),
  type_id int(4),
  added_by int(4),
  course_name varchar(30),
  rec_date date,
  canceled boolean
) charset utf8mb4;
