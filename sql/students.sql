drop table if exists students;
create table students (
  id int(4) primary key auto_increment,
  user_id int(4),
  dormitory_id int(4),
  enter_date date,
  graduated int(1),
  graduate_plan date
) charset utf8mb4;
