package com.ruoyi.attendancy_rec.controller;

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
import com.ruoyi.attendancy_rec.domain.AttendancyRec;
import com.ruoyi.attendancy_rec.service.IAttendancyRecService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 考勤扣分记录Controller
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
@RestController
@RequestMapping("/attendancy_rec/attendancy_rec")
public class AttendancyRecController extends BaseController
{
    @Autowired
    private IAttendancyRecService attendancyRecService;

    /**
     * 查询考勤扣分记录列表
     */
    @PreAuthorize("@ss.hasPermi('attendancy_rec:attendancy_rec:list')")
    @GetMapping("/list")
    public TableDataInfo list(AttendancyRec attendancyRec)
    {
        startPage();
        List<AttendancyRec> list = attendancyRecService.selectAttendancyRecList(attendancyRec);
        return getDataTable(list);
    }

    /**
     * 导出考勤扣分记录列表
     */
    @PreAuthorize("@ss.hasPermi('attendancy_rec:attendancy_rec:export')")
    @Log(title = "考勤扣分记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AttendancyRec attendancyRec)
    {
        List<AttendancyRec> list = attendancyRecService.selectAttendancyRecList(attendancyRec);
        ExcelUtil<AttendancyRec> util = new ExcelUtil<AttendancyRec>(AttendancyRec.class);
        util.exportExcel(response, list, "考勤扣分记录数据");
    }

    /**
     * 获取考勤扣分记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('attendancy_rec:attendancy_rec:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(attendancyRecService.selectAttendancyRecById(id));
    }

    /**
     * 新增考勤扣分记录
     */
    @PreAuthorize("@ss.hasPermi('attendancy_rec:attendancy_rec:add')")
    @Log(title = "考勤扣分记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AttendancyRec attendancyRec)
    {
        return toAjax(attendancyRecService.insertAttendancyRec(attendancyRec));
    }

    /**
     * 修改考勤扣分记录
     */
    @PreAuthorize("@ss.hasPermi('attendancy_rec:attendancy_rec:edit')")
    @Log(title = "考勤扣分记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AttendancyRec attendancyRec)
    {
        return toAjax(attendancyRecService.updateAttendancyRec(attendancyRec));
    }

    /**
     * 删除考勤扣分记录
     */
    @PreAuthorize("@ss.hasPermi('attendancy_rec:attendancy_rec:remove')")
    @Log(title = "考勤扣分记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(attendancyRecService.deleteAttendancyRecByIds(ids));
    }
}
