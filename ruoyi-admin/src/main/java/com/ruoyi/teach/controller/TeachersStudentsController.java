package com.ruoyi.teach.controller;

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
import com.ruoyi.teach.domain.TeachersStudents;
import com.ruoyi.teach.service.ITeachersStudentsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 授课考勤Controller
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
@RestController
@RequestMapping("/teach/teach")
public class TeachersStudentsController extends BaseController
{
    @Autowired
    private ITeachersStudentsService teachersStudentsService;

    /**
     * 查询授课考勤列表
     */
    @PreAuthorize("@ss.hasPermi('teach:teach:list')")
    @GetMapping("/list")
    public TableDataInfo list(TeachersStudents teachersStudents)
    {
        startPage();
        List<TeachersStudents> list = teachersStudentsService.selectTeachersStudentsList(teachersStudents);
        return getDataTable(list);
    }

    /**
     * 导出授课考勤列表
     */
    @PreAuthorize("@ss.hasPermi('teach:teach:export')")
    @Log(title = "授课考勤", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TeachersStudents teachersStudents)
    {
        List<TeachersStudents> list = teachersStudentsService.selectTeachersStudentsList(teachersStudents);
        ExcelUtil<TeachersStudents> util = new ExcelUtil<TeachersStudents>(TeachersStudents.class);
        util.exportExcel(response, list, "授课考勤数据");
    }

    /**
     * 获取授课考勤详细信息
     */
    @PreAuthorize("@ss.hasPermi('teach:teach:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(teachersStudentsService.selectTeachersStudentsById(id));
    }

    /**
     * 新增授课考勤
     */
    @PreAuthorize("@ss.hasPermi('teach:teach:add')")
    @Log(title = "授课考勤", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TeachersStudents teachersStudents)
    {
        return toAjax(teachersStudentsService.insertTeachersStudents(teachersStudents));
    }

    /**
     * 修改授课考勤
     */
    @PreAuthorize("@ss.hasPermi('teach:teach:edit')")
    @Log(title = "授课考勤", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TeachersStudents teachersStudents)
    {
        return toAjax(teachersStudentsService.updateTeachersStudents(teachersStudents));
    }

    /**
     * 删除授课考勤
     */
    @PreAuthorize("@ss.hasPermi('teach:teach:remove')")
    @Log(title = "授课考勤", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(teachersStudentsService.deleteTeachersStudentsByIds(ids));
    }
}
