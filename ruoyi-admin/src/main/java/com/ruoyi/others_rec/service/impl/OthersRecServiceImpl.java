package com.ruoyi.others_rec.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.others_rec.mapper.OthersRecMapper;
import com.ruoyi.others_rec.domain.OthersRec;
import com.ruoyi.others_rec.service.IOthersRecService;

/**
 * 其它扣分记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
@Service
public class OthersRecServiceImpl implements IOthersRecService 
{
    @Autowired
    private OthersRecMapper othersRecMapper;

    /**
     * 查询其它扣分记录
     * 
     * @param id 其它扣分记录主键
     * @return 其它扣分记录
     */
    @Override
    public OthersRec selectOthersRecById(Long id)
    {
        return othersRecMapper.selectOthersRecById(id);
    }

    /**
     * 查询其它扣分记录列表
     * 
     * @param othersRec 其它扣分记录
     * @return 其它扣分记录
     */
    @Override
    public List<OthersRec> selectOthersRecList(OthersRec othersRec)
    {
        return othersRecMapper.selectOthersRecList(othersRec);
    }

    /**
     * 新增其它扣分记录
     * 
     * @param othersRec 其它扣分记录
     * @return 结果
     */
    @Override
    public int insertOthersRec(OthersRec othersRec)
    {
        return othersRecMapper.insertOthersRec(othersRec);
    }

    /**
     * 修改其它扣分记录
     * 
     * @param othersRec 其它扣分记录
     * @return 结果
     */
    @Override
    public int updateOthersRec(OthersRec othersRec)
    {
        return othersRecMapper.updateOthersRec(othersRec);
    }

    /**
     * 批量删除其它扣分记录
     * 
     * @param ids 需要删除的其它扣分记录主键
     * @return 结果
     */
    @Override
    public int deleteOthersRecByIds(Long[] ids)
    {
        return othersRecMapper.deleteOthersRecByIds(ids);
    }

    /**
     * 删除其它扣分记录信息
     * 
     * @param id 其它扣分记录主键
     * @return 结果
     */
    @Override
    public int deleteOthersRecById(Long id)
    {
        return othersRecMapper.deleteOthersRecById(id);
    }
}
