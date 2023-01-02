package com.ruoyi.others_rec.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 其它扣分记录对象 others_rec
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
public class OthersRec extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    @Excel(name = "编号")
    private Long id;

    /** 扣分学生 */
    @Excel(name = "扣分学生")
    private Long studentId;

    /** 类型编号 */
    @Excel(name = "类型编号")
    private Long typeId;

    /** 添加者 */
    @Excel(name = "添加者")
    private Long addedBy;

    /** 备注 */
    @Excel(name = "备注")
    private String comm;

    /** 扣分日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "扣分日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date recDate;

    /** 是否已取消 */
    @Excel(name = "是否已取消")
    private Integer canceled;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setStudentId(Long studentId) 
    {
        this.studentId = studentId;
    }

    public Long getStudentId() 
    {
        return studentId;
    }
    public void setTypeId(Long typeId) 
    {
        this.typeId = typeId;
    }

    public Long getTypeId() 
    {
        return typeId;
    }
    public void setAddedBy(Long addedBy) 
    {
        this.addedBy = addedBy;
    }

    public Long getAddedBy() 
    {
        return addedBy;
    }
    public void setComm(String comm) 
    {
        this.comm = comm;
    }

    public String getComm() 
    {
        return comm;
    }
    public void setRecDate(Date recDate) 
    {
        this.recDate = recDate;
    }

    public Date getRecDate() 
    {
        return recDate;
    }
    public void setCanceled(Integer canceled) 
    {
        this.canceled = canceled;
    }

    public Integer getCanceled() 
    {
        return canceled;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("studentId", getStudentId())
            .append("typeId", getTypeId())
            .append("addedBy", getAddedBy())
            .append("comm", getComm())
            .append("recDate", getRecDate())
            .append("canceled", getCanceled())
            .toString();
    }
}
