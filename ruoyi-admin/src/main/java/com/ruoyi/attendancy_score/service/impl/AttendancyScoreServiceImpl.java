package com.ruoyi.attendancy_score.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.attendancy_score.mapper.AttendancyScoreMapper;
import com.ruoyi.attendancy_score.domain.AttendancyScore;
import com.ruoyi.attendancy_score.service.IAttendancyScoreService;

/**
 * 考勤扣分项管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
@Service
public class AttendancyScoreServiceImpl implements IAttendancyScoreService 
{
    @Autowired
    private AttendancyScoreMapper attendancyScoreMapper;

    /**
     * 查询考勤扣分项管理
     * 
     * @param id 考勤扣分项管理主键
     * @return 考勤扣分项管理
     */
    @Override
    public AttendancyScore selectAttendancyScoreById(Long id)
    {
        return attendancyScoreMapper.selectAttendancyScoreById(id);
    }

    /**
     * 查询考勤扣分项管理列表
     * 
     * @param attendancyScore 考勤扣分项管理
     * @return 考勤扣分项管理
     */
    @Override
    public List<AttendancyScore> selectAttendancyScoreList(AttendancyScore attendancyScore)
    {
        return attendancyScoreMapper.selectAttendancyScoreList(attendancyScore);
    }

    /**
     * 新增考勤扣分项管理
     * 
     * @param attendancyScore 考勤扣分项管理
     * @return 结果
     */
    @Override
    public int insertAttendancyScore(AttendancyScore attendancyScore)
    {
        return attendancyScoreMapper.insertAttendancyScore(attendancyScore);
    }

    /**
     * 修改考勤扣分项管理
     * 
     * @param attendancyScore 考勤扣分项管理
     * @return 结果
     */
    @Override
    public int updateAttendancyScore(AttendancyScore attendancyScore)
    {
        return attendancyScoreMapper.updateAttendancyScore(attendancyScore);
    }

    /**
     * 批量删除考勤扣分项管理
     * 
     * @param ids 需要删除的考勤扣分项管理主键
     * @return 结果
     */
    @Override
    public int deleteAttendancyScoreByIds(Long[] ids)
    {
        return attendancyScoreMapper.deleteAttendancyScoreByIds(ids);
    }

    /**
     * 删除考勤扣分项管理信息
     * 
     * @param id 考勤扣分项管理主键
     * @return 结果
     */
    @Override
    public int deleteAttendancyScoreById(Long id)
    {
        return attendancyScoreMapper.deleteAttendancyScoreById(id);
    }
}
