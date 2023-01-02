package com.ruoyi.teachers.service;

import java.util.List;
import com.ruoyi.teachers.domain.Teachers;

/**
 * 教师管理Service接口
 * 
 * @author ruoyi
 * @date 2022-12-29
 */
public interface ITeachersService 
{
    /**
     * 查询教师管理
     * 
     * @param id 教师管理主键
     * @return 教师管理
     */
    public Teachers selectTeachersById(Long id);

    /**
     * 查询教师管理列表
     * 
     * @param teachers 教师管理
     * @return 教师管理集合
     */
    public List<Teachers> selectTeachersList(Teachers teachers);

    /**
     * 新增教师管理
     * 
     * @param teachers 教师管理
     * @return 结果
     */
    public int insertTeachers(Teachers teachers);

    /**
     * 修改教师管理
     * 
     * @param teachers 教师管理
     * @return 结果
     */
    public int updateTeachers(Teachers teachers);

    /**
     * 批量删除教师管理
     * 
     * @param ids 需要删除的教师管理主键集合
     * @return 结果
     */
    public int deleteTeachersByIds(Long[] ids);

    /**
     * 删除教师管理信息
     * 
     * @param id 教师管理主键
     * @return 结果
     */
    public int deleteTeachersById(Long id);
}
