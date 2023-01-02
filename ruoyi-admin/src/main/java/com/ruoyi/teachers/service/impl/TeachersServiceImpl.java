package com.ruoyi.teachers.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.teachers.mapper.TeachersMapper;
import com.ruoyi.teachers.domain.Teachers;
import com.ruoyi.teachers.service.ITeachersService;

/**
 * 教师管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-12-29
 */
@Service
public class TeachersServiceImpl implements ITeachersService 
{
    @Autowired
    private TeachersMapper teachersMapper;

    /**
     * 查询教师管理
     * 
     * @param id 教师管理主键
     * @return 教师管理
     */
    @Override
    public Teachers selectTeachersById(Long id)
    {
        return teachersMapper.selectTeachersById(id);
    }

    /**
     * 查询教师管理列表
     * 
     * @param teachers 教师管理
     * @return 教师管理
     */
    @Override
    public List<Teachers> selectTeachersList(Teachers teachers)
    {
        return teachersMapper.selectTeachersList(teachers);
    }

    /**
     * 新增教师管理
     * 
     * @param teachers 教师管理
     * @return 结果
     */
    @Override
    public int insertTeachers(Teachers teachers)
    {
        return teachersMapper.insertTeachers(teachers);
    }

    /**
     * 修改教师管理
     * 
     * @param teachers 教师管理
     * @return 结果
     */
    @Override
    public int updateTeachers(Teachers teachers)
    {
        return teachersMapper.updateTeachers(teachers);
    }

    /**
     * 批量删除教师管理
     * 
     * @param ids 需要删除的教师管理主键
     * @return 结果
     */
    @Override
    public int deleteTeachersByIds(Long[] ids)
    {
        return teachersMapper.deleteTeachersByIds(ids);
    }

    /**
     * 删除教师管理信息
     * 
     * @param id 教师管理主键
     * @return 结果
     */
    @Override
    public int deleteTeachersById(Long id)
    {
        return teachersMapper.deleteTeachersById(id);
    }
}
