package com.ruoyi.test_temp.mapper;

import java.util.List;
import com.ruoyi.test_temp.domain.TestTemp;

/**
 * 测试Mapper接口
 * 
 * @author ruoyi
 * @date 2022-12-29
 */
public interface TestTempMapper 
{
    /**
     * 查询测试
     * 
     * @param id 测试主键
     * @return 测试
     */
    public TestTemp selectTestTempById(Long id);

    /**
     * 查询测试列表
     * 
     * @param testTemp 测试
     * @return 测试集合
     */
    public List<TestTemp> selectTestTempList(TestTemp testTemp);

    /**
     * 新增测试
     * 
     * @param testTemp 测试
     * @return 结果
     */
    public int insertTestTemp(TestTemp testTemp);

    /**
     * 修改测试
     * 
     * @param testTemp 测试
     * @return 结果
     */
    public int updateTestTemp(TestTemp testTemp);

    /**
     * 删除测试
     * 
     * @param id 测试主键
     * @return 结果
     */
    public int deleteTestTempById(Long id);

    /**
     * 批量删除测试
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTestTempByIds(Long[] ids);
}
