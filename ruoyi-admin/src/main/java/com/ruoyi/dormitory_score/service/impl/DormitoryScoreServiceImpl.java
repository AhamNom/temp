package com.ruoyi.dormitory_score.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dormitory_score.mapper.DormitoryScoreMapper;
import com.ruoyi.dormitory_score.domain.DormitoryScore;
import com.ruoyi.dormitory_score.service.IDormitoryScoreService;

/**
 * 宿舍扣分项管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
@Service
public class DormitoryScoreServiceImpl implements IDormitoryScoreService 
{
    @Autowired
    private DormitoryScoreMapper dormitoryScoreMapper;

    /**
     * 查询宿舍扣分项管理
     * 
     * @param id 宿舍扣分项管理主键
     * @return 宿舍扣分项管理
     */
    @Override
    public DormitoryScore selectDormitoryScoreById(Long id)
    {
        return dormitoryScoreMapper.selectDormitoryScoreById(id);
    }

    /**
     * 查询宿舍扣分项管理列表
     * 
     * @param dormitoryScore 宿舍扣分项管理
     * @return 宿舍扣分项管理
     */
    @Override
    public List<DormitoryScore> selectDormitoryScoreList(DormitoryScore dormitoryScore)
    {
        return dormitoryScoreMapper.selectDormitoryScoreList(dormitoryScore);
    }

    /**
     * 新增宿舍扣分项管理
     * 
     * @param dormitoryScore 宿舍扣分项管理
     * @return 结果
     */
    @Override
    public int insertDormitoryScore(DormitoryScore dormitoryScore)
    {
        return dormitoryScoreMapper.insertDormitoryScore(dormitoryScore);
    }

    /**
     * 修改宿舍扣分项管理
     * 
     * @param dormitoryScore 宿舍扣分项管理
     * @return 结果
     */
    @Override
    public int updateDormitoryScore(DormitoryScore dormitoryScore)
    {
        return dormitoryScoreMapper.updateDormitoryScore(dormitoryScore);
    }

    /**
     * 批量删除宿舍扣分项管理
     * 
     * @param ids 需要删除的宿舍扣分项管理主键
     * @return 结果
     */
    @Override
    public int deleteDormitoryScoreByIds(Long[] ids)
    {
        return dormitoryScoreMapper.deleteDormitoryScoreByIds(ids);
    }

    /**
     * 删除宿舍扣分项管理信息
     * 
     * @param id 宿舍扣分项管理主键
     * @return 结果
     */
    @Override
    public int deleteDormitoryScoreById(Long id)
    {
        return dormitoryScoreMapper.deleteDormitoryScoreById(id);
    }
}
