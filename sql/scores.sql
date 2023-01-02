drop table if exists scores;
create table scores (
  id int(4) primary key auto_increment,
  attendancy int(4) not null default 25,
  dormitory int(4) not null default 25,
  network int(4) not null default 25,
  activity int(4) not null default 25
) charset utf8mb4;
