package com.ruoyi.dormitory_area.service;

import java.util.List;
import com.ruoyi.dormitory_area.domain.DormitoryArea;

/**
 * 宿舍区域管理Service接口
 * 
 * @author ruoyi
 * @date 2022-12-28
 */
public interface IDormitoryAreaService 
{
    /**
     * 查询宿舍区域管理
     * 
     * @param id 宿舍区域管理主键
     * @return 宿舍区域管理
     */
    public DormitoryArea selectDormitoryAreaById(Long id);

    /**
     * 查询宿舍区域管理列表
     * 
     * @param dormitoryArea 宿舍区域管理
     * @return 宿舍区域管理集合
     */
    public List<DormitoryArea> selectDormitoryAreaList(DormitoryArea dormitoryArea);

    /**
     * 新增宿舍区域管理
     * 
     * @param dormitoryArea 宿舍区域管理
     * @return 结果
     */
    public int insertDormitoryArea(DormitoryArea dormitoryArea);

    /**
     * 修改宿舍区域管理
     * 
     * @param dormitoryArea 宿舍区域管理
     * @return 结果
     */
    public int updateDormitoryArea(DormitoryArea dormitoryArea);

    /**
     * 批量删除宿舍区域管理
     * 
     * @param ids 需要删除的宿舍区域管理主键集合
     * @return 结果
     */
    public int deleteDormitoryAreaByIds(Long[] ids);

    /**
     * 删除宿舍区域管理信息
     * 
     * @param id 宿舍区域管理主键
     * @return 结果
     */
    public int deleteDormitoryAreaById(Long id);
}
