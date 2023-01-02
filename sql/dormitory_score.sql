drop table if exists dormitory_score;
create table dormitory_score (
  id int(4) primary key auto_increment,
  type_name varchar(20),
  score int(4)
) charset utf8mb4;
