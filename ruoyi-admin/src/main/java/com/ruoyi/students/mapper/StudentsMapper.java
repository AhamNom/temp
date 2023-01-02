package com.ruoyi.students.mapper;

import java.util.List;
import com.ruoyi.students.domain.Students;

/**
 * 学生管理Mapper接口
 * 
 * @author ruoyi
 * @date 2022-12-29
 */
public interface StudentsMapper 
{
    /**
     * 查询学生管理
     * 
     * @param id 学生管理主键
     * @return 学生管理
     */
    public Students selectStudentsById(Long id);

    /**
     * 查询学生管理列表
     * 
     * @param students 学生管理
     * @return 学生管理集合
     */
    public List<Students> selectStudentsList(Students students);

    /**
     * 新增学生管理
     * 
     * @param students 学生管理
     * @return 结果
     */
    public int insertStudents(Students students);

    /**
     * 修改学生管理
     * 
     * @param students 学生管理
     * @return 结果
     */
    public int updateStudents(Students students);

    /**
     * 删除学生管理
     * 
     * @param id 学生管理主键
     * @return 结果
     */
    public int deleteStudentsById(Long id);

    /**
     * 批量删除学生管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteStudentsByIds(Long[] ids);
}
