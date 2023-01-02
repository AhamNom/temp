package com.ruoyi.teach.service;

import java.util.List;
import com.ruoyi.teach.domain.TeachersStudents;

/**
 * 授课考勤Service接口
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
public interface ITeachersStudentsService 
{
    /**
     * 查询授课考勤
     * 
     * @param id 授课考勤主键
     * @return 授课考勤
     */
    public TeachersStudents selectTeachersStudentsById(Long id);

    /**
     * 查询授课考勤列表
     * 
     * @param teachersStudents 授课考勤
     * @return 授课考勤集合
     */
    public List<TeachersStudents> selectTeachersStudentsList(TeachersStudents teachersStudents);

    /**
     * 新增授课考勤
     * 
     * @param teachersStudents 授课考勤
     * @return 结果
     */
    public int insertTeachersStudents(TeachersStudents teachersStudents);

    /**
     * 修改授课考勤
     * 
     * @param teachersStudents 授课考勤
     * @return 结果
     */
    public int updateTeachersStudents(TeachersStudents teachersStudents);

    /**
     * 批量删除授课考勤
     * 
     * @param ids 需要删除的授课考勤主键集合
     * @return 结果
     */
    public int deleteTeachersStudentsByIds(Long[] ids);

    /**
     * 删除授课考勤信息
     * 
     * @param id 授课考勤主键
     * @return 结果
     */
    public int deleteTeachersStudentsById(Long id);
}
