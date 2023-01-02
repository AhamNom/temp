package com.ruoyi.dormitory_score.service;

import java.util.List;
import com.ruoyi.dormitory_score.domain.DormitoryScore;

/**
 * 宿舍扣分项管理Service接口
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
public interface IDormitoryScoreService 
{
    /**
     * 查询宿舍扣分项管理
     * 
     * @param id 宿舍扣分项管理主键
     * @return 宿舍扣分项管理
     */
    public DormitoryScore selectDormitoryScoreById(Long id);

    /**
     * 查询宿舍扣分项管理列表
     * 
     * @param dormitoryScore 宿舍扣分项管理
     * @return 宿舍扣分项管理集合
     */
    public List<DormitoryScore> selectDormitoryScoreList(DormitoryScore dormitoryScore);

    /**
     * 新增宿舍扣分项管理
     * 
     * @param dormitoryScore 宿舍扣分项管理
     * @return 结果
     */
    public int insertDormitoryScore(DormitoryScore dormitoryScore);

    /**
     * 修改宿舍扣分项管理
     * 
     * @param dormitoryScore 宿舍扣分项管理
     * @return 结果
     */
    public int updateDormitoryScore(DormitoryScore dormitoryScore);

    /**
     * 批量删除宿舍扣分项管理
     * 
     * @param ids 需要删除的宿舍扣分项管理主键集合
     * @return 结果
     */
    public int deleteDormitoryScoreByIds(Long[] ids);

    /**
     * 删除宿舍扣分项管理信息
     * 
     * @param id 宿舍扣分项管理主键
     * @return 结果
     */
    public int deleteDormitoryScoreById(Long id);
}
