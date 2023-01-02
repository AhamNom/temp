package com.ruoyi.dormitory_area.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.TreeEntity;

/**
 * 宿舍区域管理对象 dormitory_area
 * 
 * @author ruoyi
 * @date 2022-12-28
 */
public class DormitoryArea extends TreeEntity
{
    private static final long serialVersionUID = 1L;

    /** 宿舍区编号 */
    @Excel(name = "宿舍区编号")
    private Long id;

    /** 上级区域编号 */
    @Excel(name = "上级区域编号")
    private Long pId;

    /** 所属部门（校区/学院/专业等） */
    @Excel(name = "所属部门", readConverterExp = "校=区/学院/专业等")
    private Long deptId;

    /** 宿舍区名 */
    @Excel(name = "宿舍区名")
    private String name;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setpId(Long pId) 
    {
        this.pId = pId;
    }

    public Long getpId() 
    {
        return pId;
    }
    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("pId", getpId())
            .append("deptId", getDeptId())
            .append("name", getName())
            .toString();
    }
}
