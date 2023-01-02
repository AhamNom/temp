package com.ruoyi.others_score.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.TreeEntity;

/**
 * 其它扣分项管理对象 others_score
 * 
 * @author ruoyi
 * @date 2022-12-29
 */
public class OthersScore extends TreeEntity
{
    private static final long serialVersionUID = 1L;

    /** 类型编号 */
    @Excel(name = "类型编号")
    private Long id;

    /** 上级类型 */
    @Excel(name = "上级类型")
    private Long pId;

    /** 类型名 */
    @Excel(name = "类型名")
    private String typeName;

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
    public void setpId(Long pId) 
    {
        this.pId = pId;
    }

    public Long getpId() 
    {
        return pId;
    }
    public void setTypeName(String typeName) 
    {
        this.typeName = typeName;
    }

    public String getTypeName() 
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
            .append("pId", getpId())
            .append("typeName", getTypeName())
            .append("score", getScore())
            .toString();
    }
}
