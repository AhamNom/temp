package com.ruoyi.others_score.service;

import java.util.List;
import com.ruoyi.others_score.domain.OthersScore;

/**
 * 其它扣分项管理Service接口
 * 
 * @author ruoyi
 * @date 2022-12-29
 */
public interface IOthersScoreService 
{
    /**
     * 查询其它扣分项管理
     * 
     * @param id 其它扣分项管理主键
     * @return 其它扣分项管理
     */
    public OthersScore selectOthersScoreById(Long id);

    /**
     * 查询其它扣分项管理列表
     * 
     * @param othersScore 其它扣分项管理
     * @return 其它扣分项管理集合
     */
    public List<OthersScore> selectOthersScoreList(OthersScore othersScore);

    /**
     * 新增其它扣分项管理
     * 
     * @param othersScore 其它扣分项管理
     * @return 结果
     */
    public int insertOthersScore(OthersScore othersScore);

    /**
     * 修改其它扣分项管理
     * 
     * @param othersScore 其它扣分项管理
     * @return 结果
     */
    public int updateOthersScore(OthersScore othersScore);

    /**
     * 批量删除其它扣分项管理
     * 
     * @param ids 需要删除的其它扣分项管理主键集合
     * @return 结果
     */
    public int deleteOthersScoreByIds(Long[] ids);

    /**
     * 删除其它扣分项管理信息
     * 
     * @param id 其它扣分项管理主键
     * @return 结果
     */
    public int deleteOthersScoreById(Long id);
}
