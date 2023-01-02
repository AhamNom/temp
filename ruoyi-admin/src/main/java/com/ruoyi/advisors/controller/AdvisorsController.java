package com.ruoyi.advisors.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.advisors.domain.Advisors;
import com.ruoyi.advisors.service.IAdvisorsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 辅导员管理Controller
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
@RestController
@RequestMapping("/advisors/advisors")
public class AdvisorsController extends BaseController
{
    @Autowired
    private IAdvisorsService advisorsService;

    /**
     * 查询辅导员管理列表
     */
    @PreAuthorize("@ss.hasPermi('advisors:advisors:list')")
    @GetMapping("/list")
    public TableDataInfo list(Advisors advisors)
    {
        startPage();
        List<Advisors> list = advisorsService.selectAdvisorsList(advisors);
        return getDataTable(list);
    }

    /**
     * 导出辅导员管理列表
     */
    @PreAuthorize("@ss.hasPermi('advisors:advisors:export')")
    @Log(title = "辅导员管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Advisors advisors)
    {
        List<Advisors> list = advisorsService.selectAdvisorsList(advisors);
        ExcelUtil<Advisors> util = new ExcelUtil<Advisors>(Advisors.class);
        util.exportExcel(response, list, "辅导员管理数据");
    }

    /**
     * 获取辅导员管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('advisors:advisors:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(advisorsService.selectAdvisorsById(id));
    }

    /**
     * 新增辅导员管理
     */
    @PreAuthorize("@ss.hasPermi('advisors:advisors:add')")
    @Log(title = "辅导员管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Advisors advisors)
    {
        return toAjax(advisorsService.insertAdvisors(advisors));
    }

    /**
     * 修改辅导员管理
     */
    @PreAuthorize("@ss.hasPermi('advisors:advisors:edit')")
    @Log(title = "辅导员管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Advisors advisors)
    {
        return toAjax(advisorsService.updateAdvisors(advisors));
    }

    /**
     * 删除辅导员管理
     */
    @PreAuthorize("@ss.hasPermi('advisors:advisors:remove')")
    @Log(title = "辅导员管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(advisorsService.deleteAdvisorsByIds(ids));
    }
}
