package com.ruoyi.advisors.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 辅导员管理对象 advisors
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
public class Advisors extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 导员编号 */
    @Excel(name = "导员编号")
    private Long id;

    /** 用户编号 */
    @Excel(name = "用户编号")
    private Long userId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .toString();
    }
}
