drop table if exists advisors;
create table advisors (
  id int(4) primary key auto_increment,
  user_id int(4)
) charset utf8mb4;
