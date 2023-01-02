package com.ruoyi.others_score.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.others_score.mapper.OthersScoreMapper;
import com.ruoyi.others_score.domain.OthersScore;
import com.ruoyi.others_score.service.IOthersScoreService;

/**
 * 其它扣分项管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-12-29
 */
@Service
public class OthersScoreServiceImpl implements IOthersScoreService 
{
    @Autowired
    private OthersScoreMapper othersScoreMapper;

    /**
     * 查询其它扣分项管理
     * 
     * @param id 其它扣分项管理主键
     * @return 其它扣分项管理
     */
    @Override
    public OthersScore selectOthersScoreById(Long id)
    {
        return othersScoreMapper.selectOthersScoreById(id);
    }

    /**
     * 查询其它扣分项管理列表
     * 
     * @param othersScore 其它扣分项管理
     * @return 其它扣分项管理
     */
    @Override
    public List<OthersScore> selectOthersScoreList(OthersScore othersScore)
    {
        return othersScoreMapper.selectOthersScoreList(othersScore);
    }

    /**
     * 新增其它扣分项管理
     * 
     * @param othersScore 其它扣分项管理
     * @return 结果
     */
    @Override
    public int insertOthersScore(OthersScore othersScore)
    {
        return othersScoreMapper.insertOthersScore(othersScore);
    }

    /**
     * 修改其它扣分项管理
     * 
     * @param othersScore 其它扣分项管理
     * @return 结果
     */
    @Override
    public int updateOthersScore(OthersScore othersScore)
    {
        return othersScoreMapper.updateOthersScore(othersScore);
    }

    /**
     * 批量删除其它扣分项管理
     * 
     * @param ids 需要删除的其它扣分项管理主键
     * @return 结果
     */
    @Override
    public int deleteOthersScoreByIds(Long[] ids)
    {
        return othersScoreMapper.deleteOthersScoreByIds(ids);
    }

    /**
     * 删除其它扣分项管理信息
     * 
     * @param id 其它扣分项管理主键
     * @return 结果
     */
    @Override
    public int deleteOthersScoreById(Long id)
    {
        return othersScoreMapper.deleteOthersScoreById(id);
    }
}
