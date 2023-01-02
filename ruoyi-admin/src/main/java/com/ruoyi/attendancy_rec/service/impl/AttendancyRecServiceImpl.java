package com.ruoyi.attendancy_rec.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.attendancy_rec.mapper.AttendancyRecMapper;
import com.ruoyi.attendancy_rec.domain.AttendancyRec;
import com.ruoyi.attendancy_rec.service.IAttendancyRecService;

/**
 * 考勤扣分记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
@Service
public class AttendancyRecServiceImpl implements IAttendancyRecService 
{
    @Autowired
    private AttendancyRecMapper attendancyRecMapper;

    /**
     * 查询考勤扣分记录
     * 
     * @param id 考勤扣分记录主键
     * @return 考勤扣分记录
     */
    @Override
    public AttendancyRec selectAttendancyRecById(Long id)
    {
        return attendancyRecMapper.selectAttendancyRecById(id);
    }

    /**
     * 查询考勤扣分记录列表
     * 
     * @param attendancyRec 考勤扣分记录
     * @return 考勤扣分记录
     */
    @Override
    public List<AttendancyRec> selectAttendancyRecList(AttendancyRec attendancyRec)
    {
        return attendancyRecMapper.selectAttendancyRecList(attendancyRec);
    }

    /**
     * 新增考勤扣分记录
     * 
     * @param attendancyRec 考勤扣分记录
     * @return 结果
     */
    @Override
    public int insertAttendancyRec(AttendancyRec attendancyRec)
    {
        return attendancyRecMapper.insertAttendancyRec(attendancyRec);
    }

    /**
     * 修改考勤扣分记录
     * 
     * @param attendancyRec 考勤扣分记录
     * @return 结果
     */
    @Override
    public int updateAttendancyRec(AttendancyRec attendancyRec)
    {
        return attendancyRecMapper.updateAttendancyRec(attendancyRec);
    }

    /**
     * 批量删除考勤扣分记录
     * 
     * @param ids 需要删除的考勤扣分记录主键
     * @return 结果
     */
    @Override
    public int deleteAttendancyRecByIds(Long[] ids)
    {
        return attendancyRecMapper.deleteAttendancyRecByIds(ids);
    }

    /**
     * 删除考勤扣分记录信息
     * 
     * @param id 考勤扣分记录主键
     * @return 结果
     */
    @Override
    public int deleteAttendancyRecById(Long id)
    {
        return attendancyRecMapper.deleteAttendancyRecById(id);
    }
}
