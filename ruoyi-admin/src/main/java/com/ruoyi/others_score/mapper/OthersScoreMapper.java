package com.ruoyi.others_score.mapper;

import java.util.List;
import com.ruoyi.others_score.domain.OthersScore;

/**
 * 其它扣分项管理Mapper接口
 * 
 * @author ruoyi
 * @date 2022-12-29
 */
public interface OthersScoreMapper 
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
     * 删除其它扣分项管理
     * 
     * @param id 其它扣分项管理主键
     * @return 结果
     */
    public int deleteOthersScoreById(Long id);

    /**
     * 批量删除其它扣分项管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteOthersScoreByIds(Long[] ids);
}
