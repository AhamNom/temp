drop table if exists dormitory_managers;
create table dormitory_managers (
  id int(4) primary key auto_increment,
  user_id int(4),
  dormitory_id int(4)
) charset utf8mb4;
