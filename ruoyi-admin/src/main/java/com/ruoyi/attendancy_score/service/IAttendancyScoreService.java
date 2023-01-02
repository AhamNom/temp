package com.ruoyi.attendancy_score.service;

import java.util.List;
import com.ruoyi.attendancy_score.domain.AttendancyScore;

/**
 * 考勤扣分项管理Service接口
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
public interface IAttendancyScoreService 
{
    /**
     * 查询考勤扣分项管理
     * 
     * @param id 考勤扣分项管理主键
     * @return 考勤扣分项管理
     */
    public AttendancyScore selectAttendancyScoreById(Long id);

    /**
     * 查询考勤扣分项管理列表
     * 
     * @param attendancyScore 考勤扣分项管理
     * @return 考勤扣分项管理集合
     */
    public List<AttendancyScore> selectAttendancyScoreList(AttendancyScore attendancyScore);

    /**
     * 新增考勤扣分项管理
     * 
     * @param attendancyScore 考勤扣分项管理
     * @return 结果
     */
    public int insertAttendancyScore(AttendancyScore attendancyScore);

    /**
     * 修改考勤扣分项管理
     * 
     * @param attendancyScore 考勤扣分项管理
     * @return 结果
     */
    public int updateAttendancyScore(AttendancyScore attendancyScore);

    /**
     * 批量删除考勤扣分项管理
     * 
     * @param ids 需要删除的考勤扣分项管理主键集合
     * @return 结果
     */
    public int deleteAttendancyScoreByIds(Long[] ids);

    /**
     * 删除考勤扣分项管理信息
     * 
     * @param id 考勤扣分项管理主键
     * @return 结果
     */
    public int deleteAttendancyScoreById(Long id);
}
