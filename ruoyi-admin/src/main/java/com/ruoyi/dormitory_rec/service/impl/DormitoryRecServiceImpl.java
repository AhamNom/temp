package com.ruoyi.dormitory_rec.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dormitory_rec.mapper.DormitoryRecMapper;
import com.ruoyi.dormitory_rec.domain.DormitoryRec;
import com.ruoyi.dormitory_rec.service.IDormitoryRecService;

/**
 * 宿舍扣分记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
@Service
public class DormitoryRecServiceImpl implements IDormitoryRecService 
{
    @Autowired
    private DormitoryRecMapper dormitoryRecMapper;

    /**
     * 查询宿舍扣分记录
     * 
     * @param id 宿舍扣分记录主键
     * @return 宿舍扣分记录
     */
    @Override
    public DormitoryRec selectDormitoryRecById(Long id)
    {
        return dormitoryRecMapper.selectDormitoryRecById(id);
    }

    /**
     * 查询宿舍扣分记录列表
     * 
     * @param dormitoryRec 宿舍扣分记录
     * @return 宿舍扣分记录
     */
    @Override
    public List<DormitoryRec> selectDormitoryRecList(DormitoryRec dormitoryRec)
    {
        return dormitoryRecMapper.selectDormitoryRecList(dormitoryRec);
    }

    /**
     * 新增宿舍扣分记录
     * 
     * @param dormitoryRec 宿舍扣分记录
     * @return 结果
     */
    @Override
    public int insertDormitoryRec(DormitoryRec dormitoryRec)
    {
        return dormitoryRecMapper.insertDormitoryRec(dormitoryRec);
    }

    /**
     * 修改宿舍扣分记录
     * 
     * @param dormitoryRec 宿舍扣分记录
     * @return 结果
     */
    @Override
    public int updateDormitoryRec(DormitoryRec dormitoryRec)
    {
        return dormitoryRecMapper.updateDormitoryRec(dormitoryRec);
    }

    /**
     * 批量删除宿舍扣分记录
     * 
     * @param ids 需要删除的宿舍扣分记录主键
     * @return 结果
     */
    @Override
    public int deleteDormitoryRecByIds(Long[] ids)
    {
        return dormitoryRecMapper.deleteDormitoryRecByIds(ids);
    }

    /**
     * 删除宿舍扣分记录信息
     * 
     * @param id 宿舍扣分记录主键
     * @return 结果
     */
    @Override
    public int deleteDormitoryRecById(Long id)
    {
        return dormitoryRecMapper.deleteDormitoryRecById(id);
    }
}
