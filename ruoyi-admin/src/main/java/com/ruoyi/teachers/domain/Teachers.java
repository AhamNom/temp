package com.ruoyi.teachers.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 教师管理对象 teachers
 * 
 * @author ruoyi
 * @date 2022-12-29
 */
public class Teachers extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 工号 */
    @Excel(name = "工号")
    private Long id;

    /** 用户 id */
    @Excel(name = "用户 id")
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
