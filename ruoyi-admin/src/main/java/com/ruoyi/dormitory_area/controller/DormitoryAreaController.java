package com.ruoyi.dormitory_area.controller;

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
import com.ruoyi.dormitory_area.domain.DormitoryArea;
import com.ruoyi.dormitory_area.service.IDormitoryAreaService;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 宿舍区域管理Controller
 * 
 * @author ruoyi
 * @date 2022-12-28
 */
@RestController
@RequestMapping("/dormitory_area/dormitory_area")
public class DormitoryAreaController extends BaseController
{
    @Autowired
    private IDormitoryAreaService dormitoryAreaService;

    /**
     * 查询宿舍区域管理列表
     */
    @PreAuthorize("@ss.hasPermi('dormitory_area:dormitory_area:list')")
    @GetMapping("/list")
    public AjaxResult list(DormitoryArea dormitoryArea)
    {
        List<DormitoryArea> list = dormitoryAreaService.selectDormitoryAreaList(dormitoryArea);
        return success(list);
    }

    /**
     * 导出宿舍区域管理列表
     */
    @PreAuthorize("@ss.hasPermi('dormitory_area:dormitory_area:export')")
    @Log(title = "宿舍区域管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DormitoryArea dormitoryArea)
    {
        List<DormitoryArea> list = dormitoryAreaService.selectDormitoryAreaList(dormitoryArea);
        ExcelUtil<DormitoryArea> util = new ExcelUtil<DormitoryArea>(DormitoryArea.class);
        util.exportExcel(response, list, "宿舍区域管理数据");
    }

    /**
     * 获取宿舍区域管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('dormitory_area:dormitory_area:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dormitoryAreaService.selectDormitoryAreaById(id));
    }

    /**
     * 新增宿舍区域管理
     */
    @PreAuthorize("@ss.hasPermi('dormitory_area:dormitory_area:add')")
    @Log(title = "宿舍区域管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DormitoryArea dormitoryArea)
    {
        return toAjax(dormitoryAreaService.insertDormitoryArea(dormitoryArea));
    }

    /**
     * 修改宿舍区域管理
     */
    @PreAuthorize("@ss.hasPermi('dormitory_area:dormitory_area:edit')")
    @Log(title = "宿舍区域管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DormitoryArea dormitoryArea)
    {
        return toAjax(dormitoryAreaService.updateDormitoryArea(dormitoryArea));
    }

    /**
     * 删除宿舍区域管理
     */
    @PreAuthorize("@ss.hasPermi('dormitory_area:dormitory_area:remove')")
    @Log(title = "宿舍区域管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dormitoryAreaService.deleteDormitoryAreaByIds(ids));
    }
}
