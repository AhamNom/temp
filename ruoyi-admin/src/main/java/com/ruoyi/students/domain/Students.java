package com.ruoyi.students.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 学生管理对象 students
 * 
 * @author ruoyi
 * @date 2022-12-29
 */
public class Students extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 学号 */
    @Excel(name = "学号")
    private Long id;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 宿舍号 */
    @Excel(name = "宿舍号")
    private Long dormitoryId;

    /** 入学时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "入学时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date enterDate;

    /** 是否已毕业 */
    @Excel(name = "是否已毕业")
    private Long graduated;

    /** 预计毕业时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "预计毕业时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date graduatePlan;

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
    public void setEnterDate(Date enterDate) 
    {
        this.enterDate = enterDate;
    }

    public Date getEnterDate() 
    {
        return enterDate;
    }
    public void setGraduated(Long graduated) 
    {
        this.graduated = graduated;
    }

    public Long getGraduated() 
    {
        return graduated;
    }
    public void setGraduatePlan(Date graduatePlan) 
    {
        this.graduatePlan = graduatePlan;
    }

    public Date getGraduatePlan() 
    {
        return graduatePlan;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("dormitoryId", getDormitoryId())
            .append("enterDate", getEnterDate())
            .append("graduated", getGraduated())
            .append("graduatePlan", getGraduatePlan())
            .toString();
    }
}
