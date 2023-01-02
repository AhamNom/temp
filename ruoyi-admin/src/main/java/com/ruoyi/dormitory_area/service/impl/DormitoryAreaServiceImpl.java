package com.ruoyi.dormitory_area.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.dormitory_area.mapper.DormitoryAreaMapper;
import com.ruoyi.dormitory_area.domain.DormitoryArea;
import com.ruoyi.dormitory_area.service.IDormitoryAreaService;

/**
 * 宿舍区域管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-12-28
 */
@Service
public class DormitoryAreaServiceImpl implements IDormitoryAreaService 
{
    @Autowired
    private DormitoryAreaMapper dormitoryAreaMapper;

    /**
     * 查询宿舍区域管理
     * 
     * @param id 宿舍区域管理主键
     * @return 宿舍区域管理
     */
    @Override
    public DormitoryArea selectDormitoryAreaById(Long id)
    {
        return dormitoryAreaMapper.selectDormitoryAreaById(id);
    }

    /**
     * 查询宿舍区域管理列表
     * 
     * @param dormitoryArea 宿舍区域管理
     * @return 宿舍区域管理
     */
    @Override
    public List<DormitoryArea> selectDormitoryAreaList(DormitoryArea dormitoryArea)
    {
        return dormitoryAreaMapper.selectDormitoryAreaList(dormitoryArea);
    }

    /**
     * 新增宿舍区域管理
     * 
     * @param dormitoryArea 宿舍区域管理
     * @return 结果
     */
    @Override
    public int insertDormitoryArea(DormitoryArea dormitoryArea)
    {
        return dormitoryAreaMapper.insertDormitoryArea(dormitoryArea);
    }

    /**
     * 修改宿舍区域管理
     * 
     * @param dormitoryArea 宿舍区域管理
     * @return 结果
     */
    @Override
    public int updateDormitoryArea(DormitoryArea dormitoryArea)
    {
        return dormitoryAreaMapper.updateDormitoryArea(dormitoryArea);
    }

    /**
     * 批量删除宿舍区域管理
     * 
     * @param ids 需要删除的宿舍区域管理主键
     * @return 结果
     */
    @Override
    public int deleteDormitoryAreaByIds(Long[] ids)
    {
        return dormitoryAreaMapper.deleteDormitoryAreaByIds(ids);
    }

    /**
     * 删除宿舍区域管理信息
     * 
     * @param id 宿舍区域管理主键
     * @return 结果
     */
    @Override
    public int deleteDormitoryAreaById(Long id)
    {
        return dormitoryAreaMapper.deleteDormitoryAreaById(id);
    }
}
