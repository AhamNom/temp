package com.ruoyi.dormitory_rec.controller;

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
import com.ruoyi.dormitory_rec.domain.DormitoryRec;
import com.ruoyi.dormitory_rec.service.IDormitoryRecService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 宿舍扣分记录Controller
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
@RestController
@RequestMapping("/dormitory_rec/dormitory_rec")
public class DormitoryRecController extends BaseController
{
    @Autowired
    private IDormitoryRecService dormitoryRecService;

    /**
     * 查询宿舍扣分记录列表
     */
    @PreAuthorize("@ss.hasPermi('dormitory_rec:dormitory_rec:list')")
    @GetMapping("/list")
    public TableDataInfo list(DormitoryRec dormitoryRec)
    {
        startPage();
        List<DormitoryRec> list = dormitoryRecService.selectDormitoryRecList(dormitoryRec);
        return getDataTable(list);
    }

    /**
     * 导出宿舍扣分记录列表
     */
    @PreAuthorize("@ss.hasPermi('dormitory_rec:dormitory_rec:export')")
    @Log(title = "宿舍扣分记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DormitoryRec dormitoryRec)
    {
        List<DormitoryRec> list = dormitoryRecService.selectDormitoryRecList(dormitoryRec);
        ExcelUtil<DormitoryRec> util = new ExcelUtil<DormitoryRec>(DormitoryRec.class);
        util.exportExcel(response, list, "宿舍扣分记录数据");
    }

    /**
     * 获取宿舍扣分记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('dormitory_rec:dormitory_rec:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dormitoryRecService.selectDormitoryRecById(id));
    }

    /**
     * 新增宿舍扣分记录
     */
    @PreAuthorize("@ss.hasPermi('dormitory_rec:dormitory_rec:add')")
    @Log(title = "宿舍扣分记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DormitoryRec dormitoryRec)
    {
        return toAjax(dormitoryRecService.insertDormitoryRec(dormitoryRec));
    }

    /**
     * 修改宿舍扣分记录
     */
    @PreAuthorize("@ss.hasPermi('dormitory_rec:dormitory_rec:edit')")
    @Log(title = "宿舍扣分记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DormitoryRec dormitoryRec)
    {
        return toAjax(dormitoryRecService.updateDormitoryRec(dormitoryRec));
    }

    /**
     * 删除宿舍扣分记录
     */
    @PreAuthorize("@ss.hasPermi('dormitory_rec:dormitory_rec:remove')")
    @Log(title = "宿舍扣分记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dormitoryRecService.deleteDormitoryRecByIds(ids));
    }
}
