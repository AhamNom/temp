package com.ruoyi.dormitory_managers.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dormitory_managers.mapper.DormitoryManagersMapper;
import com.ruoyi.dormitory_managers.domain.DormitoryManagers;
import com.ruoyi.dormitory_managers.service.IDormitoryManagersService;

/**
 * 宿管管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
@Service
public class DormitoryManagersServiceImpl implements IDormitoryManagersService 
{
    @Autowired
    private DormitoryManagersMapper dormitoryManagersMapper;

    /**
     * 查询宿管管理
     * 
     * @param id 宿管管理主键
     * @return 宿管管理
     */
    @Override
    public DormitoryManagers selectDormitoryManagersById(Long id)
    {
        return dormitoryManagersMapper.selectDormitoryManagersById(id);
    }

    /**
     * 查询宿管管理列表
     * 
     * @param dormitoryManagers 宿管管理
     * @return 宿管管理
     */
    @Override
    public List<DormitoryManagers> selectDormitoryManagersList(DormitoryManagers dormitoryManagers)
    {
        return dormitoryManagersMapper.selectDormitoryManagersList(dormitoryManagers);
    }

    /**
     * 新增宿管管理
     * 
     * @param dormitoryManagers 宿管管理
     * @return 结果
     */
    @Override
    public int insertDormitoryManagers(DormitoryManagers dormitoryManagers)
    {
        return dormitoryManagersMapper.insertDormitoryManagers(dormitoryManagers);
    }

    /**
     * 修改宿管管理
     * 
     * @param dormitoryManagers 宿管管理
     * @return 结果
     */
    @Override
    public int updateDormitoryManagers(DormitoryManagers dormitoryManagers)
    {
        return dormitoryManagersMapper.updateDormitoryManagers(dormitoryManagers);
    }

    /**
     * 批量删除宿管管理
     * 
     * @param ids 需要删除的宿管管理主键
     * @return 结果
     */
    @Override
    public int deleteDormitoryManagersByIds(Long[] ids)
    {
        return dormitoryManagersMapper.deleteDormitoryManagersByIds(ids);
    }

    /**
     * 删除宿管管理信息
     * 
     * @param id 宿管管理主键
     * @return 结果
     */
    @Override
    public int deleteDormitoryManagersById(Long id)
    {
        return dormitoryManagersMapper.deleteDormitoryManagersById(id);
    }
}
