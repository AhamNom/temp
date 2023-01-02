package com.ruoyi.attendancy_rec.mapper;

import java.util.List;
import com.ruoyi.attendancy_rec.domain.AttendancyRec;

/**
 * 考勤扣分记录Mapper接口
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
public interface AttendancyRecMapper 
{
    /**
     * 查询考勤扣分记录
     * 
     * @param id 考勤扣分记录主键
     * @return 考勤扣分记录
     */
    public AttendancyRec selectAttendancyRecById(Long id);

    /**
     * 查询考勤扣分记录列表
     * 
     * @param attendancyRec 考勤扣分记录
     * @return 考勤扣分记录集合
     */
    public List<AttendancyRec> selectAttendancyRecList(AttendancyRec attendancyRec);

    /**
     * 新增考勤扣分记录
     * 
     * @param attendancyRec 考勤扣分记录
     * @return 结果
     */
    public int insertAttendancyRec(AttendancyRec attendancyRec);

    /**
     * 修改考勤扣分记录
     * 
     * @param attendancyRec 考勤扣分记录
     * @return 结果
     */
    public int updateAttendancyRec(AttendancyRec attendancyRec);

    /**
     * 删除考勤扣分记录
     * 
     * @param id 考勤扣分记录主键
     * @return 结果
     */
    public int deleteAttendancyRecById(Long id);

    /**
     * 批量删除考勤扣分记录
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAttendancyRecByIds(Long[] ids);
}
