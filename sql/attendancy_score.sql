drop table if exists attendancy_score;
create table attendancy_score (
  id int(4) primary key auto_increment,
  type_name int(4),
  score int(4)
) charset utf8mb4;
