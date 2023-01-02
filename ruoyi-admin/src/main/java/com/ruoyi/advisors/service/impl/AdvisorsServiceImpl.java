package com.ruoyi.advisors.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.advisors.mapper.AdvisorsMapper;
import com.ruoyi.advisors.domain.Advisors;
import com.ruoyi.advisors.service.IAdvisorsService;

/**
 * 辅导员管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
@Service
public class AdvisorsServiceImpl implements IAdvisorsService 
{
    @Autowired
    private AdvisorsMapper advisorsMapper;

    /**
     * 查询辅导员管理
     * 
     * @param id 辅导员管理主键
     * @return 辅导员管理
     */
    @Override
    public Advisors selectAdvisorsById(Long id)
    {
        return advisorsMapper.selectAdvisorsById(id);
    }

    /**
     * 查询辅导员管理列表
     * 
     * @param advisors 辅导员管理
     * @return 辅导员管理
     */
    @Override
    public List<Advisors> selectAdvisorsList(Advisors advisors)
    {
        return advisorsMapper.selectAdvisorsList(advisors);
    }

    /**
     * 新增辅导员管理
     * 
     * @param advisors 辅导员管理
     * @return 结果
     */
    @Override
    public int insertAdvisors(Advisors advisors)
    {
        return advisorsMapper.insertAdvisors(advisors);
    }

    /**
     * 修改辅导员管理
     * 
     * @param advisors 辅导员管理
     * @return 结果
     */
    @Override
    public int updateAdvisors(Advisors advisors)
    {
        return advisorsMapper.updateAdvisors(advisors);
    }

    /**
     * 批量删除辅导员管理
     * 
     * @param ids 需要删除的辅导员管理主键
     * @return 结果
     */
    @Override
    public int deleteAdvisorsByIds(Long[] ids)
    {
        return advisorsMapper.deleteAdvisorsByIds(ids);
    }

    /**
     * 删除辅导员管理信息
     * 
     * @param id 辅导员管理主键
     * @return 结果
     */
    @Override
    public int deleteAdvisorsById(Long id)
    {
        return advisorsMapper.deleteAdvisorsById(id);
    }
}
