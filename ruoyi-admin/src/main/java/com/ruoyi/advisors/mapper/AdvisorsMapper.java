package com.ruoyi.advisors.mapper;

import java.util.List;
import com.ruoyi.advisors.domain.Advisors;

/**
 * 辅导员管理Mapper接口
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
public interface AdvisorsMapper 
{
    /**
     * 查询辅导员管理
     * 
     * @param id 辅导员管理主键
     * @return 辅导员管理
     */
    public Advisors selectAdvisorsById(Long id);

    /**
     * 查询辅导员管理列表
     * 
     * @param advisors 辅导员管理
     * @return 辅导员管理集合
     */
    public List<Advisors> selectAdvisorsList(Advisors advisors);

    /**
     * 新增辅导员管理
     * 
     * @param advisors 辅导员管理
     * @return 结果
     */
    public int insertAdvisors(Advisors advisors);

    /**
     * 修改辅导员管理
     * 
     * @param advisors 辅导员管理
     * @return 结果
     */
    public int updateAdvisors(Advisors advisors);

    /**
     * 删除辅导员管理
     * 
     * @param id 辅导员管理主键
     * @return 结果
     */
    public int deleteAdvisorsById(Long id);

    /**
     * 批量删除辅导员管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAdvisorsByIds(Long[] ids);
}
