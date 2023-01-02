package com.ruoyi.dormitory_managers.service;

import java.util.List;
import com.ruoyi.dormitory_managers.domain.DormitoryManagers;

/**
 * 宿管管理Service接口
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
public interface IDormitoryManagersService 
{
    /**
     * 查询宿管管理
     * 
     * @param id 宿管管理主键
     * @return 宿管管理
     */
    public DormitoryManagers selectDormitoryManagersById(Long id);

    /**
     * 查询宿管管理列表
     * 
     * @param dormitoryManagers 宿管管理
     * @return 宿管管理集合
     */
    public List<DormitoryManagers> selectDormitoryManagersList(DormitoryManagers dormitoryManagers);

    /**
     * 新增宿管管理
     * 
     * @param dormitoryManagers 宿管管理
     * @return 结果
     */
    public int insertDormitoryManagers(DormitoryManagers dormitoryManagers);

    /**
     * 修改宿管管理
     * 
     * @param dormitoryManagers 宿管管理
     * @return 结果
     */
    public int updateDormitoryManagers(DormitoryManagers dormitoryManagers);

    /**
     * 批量删除宿管管理
     * 
     * @param ids 需要删除的宿管管理主键集合
     * @return 结果
     */
    public int deleteDormitoryManagersByIds(Long[] ids);

    /**
     * 删除宿管管理信息
     * 
     * @param id 宿管管理主键
     * @return 结果
     */
    public int deleteDormitoryManagersById(Long id);
}
