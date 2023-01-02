package com.ruoyi.others_rec.mapper;

import java.util.List;
import com.ruoyi.others_rec.domain.OthersRec;

/**
 * 其它扣分记录Mapper接口
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
public interface OthersRecMapper 
{
    /**
     * 查询其它扣分记录
     * 
     * @param id 其它扣分记录主键
     * @return 其它扣分记录
     */
    public OthersRec selectOthersRecById(Long id);

    /**
     * 查询其它扣分记录列表
     * 
     * @param othersRec 其它扣分记录
     * @return 其它扣分记录集合
     */
    public List<OthersRec> selectOthersRecList(OthersRec othersRec);

    /**
     * 新增其它扣分记录
     * 
     * @param othersRec 其它扣分记录
     * @return 结果
     */
    public int insertOthersRec(OthersRec othersRec);

    /**
     * 修改其它扣分记录
     * 
     * @param othersRec 其它扣分记录
     * @return 结果
     */
    public int updateOthersRec(OthersRec othersRec);

    /**
     * 删除其它扣分记录
     * 
     * @param id 其它扣分记录主键
     * @return 结果
     */
    public int deleteOthersRecById(Long id);

    /**
     * 批量删除其它扣分记录
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteOthersRecByIds(Long[] ids);
}
