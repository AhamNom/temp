-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学生管理', '1', '1', 'students', 'students/students/index', 1, 0, 'C', '0', '0', 'students:students:list', '#', 'admin', sysdate(), '', null, '学生管理菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学生管理查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'students:students:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学生管理新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'students:students:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学生管理修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'students:students:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学生管理删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'students:students:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学生管理导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'students:students:export',       '#', 'admin', sysdate(), '', null, '');
