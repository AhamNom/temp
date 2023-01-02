package com.ruoyi.dormitory_managers.controller;

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
import com.ruoyi.dormitory_managers.domain.DormitoryManagers;
import com.ruoyi.dormitory_managers.service.IDormitoryManagersService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 宿管管理Controller
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
@RestController
@RequestMapping("/dormitory_managers/dormitory_managers")
public class DormitoryManagersController extends BaseController
{
    @Autowired
    private IDormitoryManagersService dormitoryManagersService;

    /**
     * 查询宿管管理列表
     */
    @PreAuthorize("@ss.hasPermi('dormitory_managers:dormitory_managers:list')")
    @GetMapping("/list")
    public TableDataInfo list(DormitoryManagers dormitoryManagers)
    {
        startPage();
        List<DormitoryManagers> list = dormitoryManagersService.selectDormitoryManagersList(dormitoryManagers);
        return getDataTable(list);
    }

    /**
     * 导出宿管管理列表
     */
    @PreAuthorize("@ss.hasPermi('dormitory_managers:dormitory_managers:export')")
    @Log(title = "宿管管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DormitoryManagers dormitoryManagers)
    {
        List<DormitoryManagers> list = dormitoryManagersService.selectDormitoryManagersList(dormitoryManagers);
        ExcelUtil<DormitoryManagers> util = new ExcelUtil<DormitoryManagers>(DormitoryManagers.class);
        util.exportExcel(response, list, "宿管管理数据");
    }

    /**
     * 获取宿管管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('dormitory_managers:dormitory_managers:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dormitoryManagersService.selectDormitoryManagersById(id));
    }

    /**
     * 新增宿管管理
     */
    @PreAuthorize("@ss.hasPermi('dormitory_managers:dormitory_managers:add')")
    @Log(title = "宿管管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DormitoryManagers dormitoryManagers)
    {
        return toAjax(dormitoryManagersService.insertDormitoryManagers(dormitoryManagers));
    }

    /**
     * 修改宿管管理
     */
    @PreAuthorize("@ss.hasPermi('dormitory_managers:dormitory_managers:edit')")
    @Log(title = "宿管管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DormitoryManagers dormitoryManagers)
    {
        return toAjax(dormitoryManagersService.updateDormitoryManagers(dormitoryManagers));
    }

    /**
     * 删除宿管管理
     */
    @PreAuthorize("@ss.hasPermi('dormitory_managers:dormitory_managers:remove')")
    @Log(title = "宿管管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dormitoryManagersService.deleteDormitoryManagersByIds(ids));
    }
}
