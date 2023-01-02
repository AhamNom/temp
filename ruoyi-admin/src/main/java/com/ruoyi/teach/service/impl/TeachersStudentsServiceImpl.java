package com.ruoyi.teach.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.teach.mapper.TeachersStudentsMapper;
import com.ruoyi.teach.domain.TeachersStudents;
import com.ruoyi.teach.service.ITeachersStudentsService;

/**
 * 授课考勤Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
@Service
public class TeachersStudentsServiceImpl implements ITeachersStudentsService 
{
    @Autowired
    private TeachersStudentsMapper teachersStudentsMapper;

    /**
     * 查询授课考勤
     * 
     * @param id 授课考勤主键
     * @return 授课考勤
     */
    @Override
    public TeachersStudents selectTeachersStudentsById(Long id)
    {
        return teachersStudentsMapper.selectTeachersStudentsById(id);
    }

    /**
     * 查询授课考勤列表
     * 
     * @param teachersStudents 授课考勤
     * @return 授课考勤
     */
    @Override
    public List<TeachersStudents> selectTeachersStudentsList(TeachersStudents teachersStudents)
    {
        return teachersStudentsMapper.selectTeachersStudentsList(teachersStudents);
    }

    /**
     * 新增授课考勤
     * 
     * @param teachersStudents 授课考勤
     * @return 结果
     */
    @Override
    public int insertTeachersStudents(TeachersStudents teachersStudents)
    {
        return teachersStudentsMapper.insertTeachersStudents(teachersStudents);
    }

    /**
     * 修改授课考勤
     * 
     * @param teachersStudents 授课考勤
     * @return 结果
     */
    @Override
    public int updateTeachersStudents(TeachersStudents teachersStudents)
    {
        return teachersStudentsMapper.updateTeachersStudents(teachersStudents);
    }

    /**
     * 批量删除授课考勤
     * 
     * @param ids 需要删除的授课考勤主键
     * @return 结果
     */
    @Override
    public int deleteTeachersStudentsByIds(Long[] ids)
    {
        return teachersStudentsMapper.deleteTeachersStudentsByIds(ids);
    }

    /**
     * 删除授课考勤信息
     * 
     * @param id 授课考勤主键
     * @return 结果
     */
    @Override
    public int deleteTeachersStudentsById(Long id)
    {
        return teachersStudentsMapper.deleteTeachersStudentsById(id);
    }
}
