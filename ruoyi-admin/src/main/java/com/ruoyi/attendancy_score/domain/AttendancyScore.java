package com.ruoyi.attendancy_score.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 考勤扣分项管理对象 attendancy_score
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
public class AttendancyScore extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    @Excel(name = "编号")
    private Long id;

    /** 扣分项名 */
    @Excel(name = "扣分项名")
    private Long typeName;

    /** 扣分 */
    @Excel(name = "扣分")
    private Long score;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTypeName(Long typeName) 
    {
        this.typeName = typeName;
    }

    public Long getTypeName() 
    {
        return typeName;
    }
    public void setScore(Long score) 
    {
        this.score = score;
    }

    public Long getScore() 
    {
        return score;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("typeName", getTypeName())
            .append("score", getScore())
            .toString();
    }
}
