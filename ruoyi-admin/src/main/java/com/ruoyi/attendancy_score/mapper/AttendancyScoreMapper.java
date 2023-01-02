package com.ruoyi.attendancy_score.mapper;

import java.util.List;
import com.ruoyi.attendancy_score.domain.AttendancyScore;

/**
 * 考勤扣分项管理Mapper接口
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
public interface AttendancyScoreMapper 
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
     * 删除考勤扣分项管理
     * 
     * @param id 考勤扣分项管理主键
     * @return 结果
     */
    public int deleteAttendancyScoreById(Long id);

    /**
     * 批量删除考勤扣分项管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAttendancyScoreByIds(Long[] ids);
}
