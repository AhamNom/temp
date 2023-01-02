drop table if exists others_score;
create table others_score (
  id int(4) primary key auto_increment,
  p_id int(4),
  type_name varchar(20),
  score int(4)
) charset utf8mb4;
