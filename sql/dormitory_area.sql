drop table if exists dormitory_area;
create table dormitory_area (
    id int(4) primary key auto_increment,
    p_id int(4),
    dept_id int(4),
    name varchar(20)
) charset utf8mb4;
