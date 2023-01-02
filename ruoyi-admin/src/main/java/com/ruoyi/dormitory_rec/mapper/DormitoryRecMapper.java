package com.ruoyi.dormitory_rec.mapper;

import java.util.List;
import com.ruoyi.dormitory_rec.domain.DormitoryRec;

/**
 * 宿舍扣分记录Mapper接口
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
public interface DormitoryRecMapper 
{
    /**
     * 查询宿舍扣分记录
     * 
     * @param id 宿舍扣分记录主键
     * @return 宿舍扣分记录
     */
    public DormitoryRec selectDormitoryRecById(Long id);

    /**
     * 查询宿舍扣分记录列表
     * 
     * @param dormitoryRec 宿舍扣分记录
     * @return 宿舍扣分记录集合
     */
    public List<DormitoryRec> selectDormitoryRecList(DormitoryRec dormitoryRec);

    /**
     * 新增宿舍扣分记录
     * 
     * @param dormitoryRec 宿舍扣分记录
     * @return 结果
     */
    public int insertDormitoryRec(DormitoryRec dormitoryRec);

    /**
     * 修改宿舍扣分记录
     * 
     * @param dormitoryRec 宿舍扣分记录
     * @return 结果
     */
    public int updateDormitoryRec(DormitoryRec dormitoryRec);

    /**
     * 删除宿舍扣分记录
     * 
     * @param id 宿舍扣分记录主键
     * @return 结果
     */
    public int deleteDormitoryRecById(Long id);

    /**
     * 批量删除宿舍扣分记录
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDormitoryRecByIds(Long[] ids);
}
