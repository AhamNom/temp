package com.ruoyi.dormitory_managers.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 宿管管理对象 dormitory_managers
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
public class DormitoryManagers extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 工号 */
    @Excel(name = "工号")
    private Long id;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 管辖区 */
    @Excel(name = "管辖区")
    private Long dormitoryId;

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
    public void setDormitoryId(Long dormitoryId) 
    {
        this.dormitoryId = dormitoryId;
    }

    public Long getDormitoryId() 
    {
        return dormitoryId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("dormitoryId", getDormitoryId())
            .toString();
    }
}
