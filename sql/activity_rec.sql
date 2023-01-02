drop table if exists activity_rec;
create table activity_rec (
  id int(4) primary key auto_increment,
  student_id int(4),
  added_by int(4),
  rec_date date,
  time int(4),
  comm varchar(30)
) charset utf8mb4;
