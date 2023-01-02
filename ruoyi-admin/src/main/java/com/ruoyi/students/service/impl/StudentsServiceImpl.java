package com.ruoyi.students.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.students.mapper.StudentsMapper;
import com.ruoyi.students.domain.Students;
import com.ruoyi.students.service.IStudentsService;

/**
 * 学生管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-12-29
 */
@Service
public class StudentsServiceImpl implements IStudentsService 
{
    @Autowired
    private StudentsMapper studentsMapper;

    /**
     * 查询学生管理
     * 
     * @param id 学生管理主键
     * @return 学生管理
     */
    @Override
    public Students selectStudentsById(Long id)
    {
        return studentsMapper.selectStudentsById(id);
    }

    /**
     * 查询学生管理列表
     * 
     * @param students 学生管理
     * @return 学生管理
     */
    @Override
    public List<Students> selectStudentsList(Students students)
    {
        return studentsMapper.selectStudentsList(students);
    }

    /**
     * 新增学生管理
     * 
     * @param students 学生管理
     * @return 结果
     */
    @Override
    public int insertStudents(Students students)
    {
        return studentsMapper.insertStudents(students);
    }

    /**
     * 修改学生管理
     * 
     * @param students 学生管理
     * @return 结果
     */
    @Override
    public int updateStudents(Students students)
    {
        return studentsMapper.updateStudents(students);
    }

    /**
     * 批量删除学生管理
     * 
     * @param ids 需要删除的学生管理主键
     * @return 结果
     */
    @Override
    public int deleteStudentsByIds(Long[] ids)
    {
        return studentsMapper.deleteStudentsByIds(ids);
    }

    /**
     * 删除学生管理信息
     * 
     * @param id 学生管理主键
     * @return 结果
     */
    @Override
    public int deleteStudentsById(Long id)
    {
        return studentsMapper.deleteStudentsById(id);
    }
}
