package com.ruoyi.attendancy_score.controller;

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
import com.ruoyi.attendancy_score.domain.AttendancyScore;
import com.ruoyi.attendancy_score.service.IAttendancyScoreService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 考勤扣分项管理Controller
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
@RestController
@RequestMapping("/attendancy_score/attendancy_score")
public class AttendancyScoreController extends BaseController
{
    @Autowired
    private IAttendancyScoreService attendancyScoreService;

    /**
     * 查询考勤扣分项管理列表
     */
    @PreAuthorize("@ss.hasPermi('attendancy_score:attendancy_score:list')")
    @GetMapping("/list")
    public TableDataInfo list(AttendancyScore attendancyScore)
    {
        startPage();
        List<AttendancyScore> list = attendancyScoreService.selectAttendancyScoreList(attendancyScore);
        return getDataTable(list);
    }

    /**
     * 导出考勤扣分项管理列表
     */
    @PreAuthorize("@ss.hasPermi('attendancy_score:attendancy_score:export')")
    @Log(title = "考勤扣分项管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AttendancyScore attendancyScore)
    {
        List<AttendancyScore> list = attendancyScoreService.selectAttendancyScoreList(attendancyScore);
        ExcelUtil<AttendancyScore> util = new ExcelUtil<AttendancyScore>(AttendancyScore.class);
        util.exportExcel(response, list, "考勤扣分项管理数据");
    }

    /**
     * 获取考勤扣分项管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('attendancy_score:attendancy_score:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(attendancyScoreService.selectAttendancyScoreById(id));
    }

    /**
     * 新增考勤扣分项管理
     */
    @PreAuthorize("@ss.hasPermi('attendancy_score:attendancy_score:add')")
    @Log(title = "考勤扣分项管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AttendancyScore attendancyScore)
    {
        return toAjax(attendancyScoreService.insertAttendancyScore(attendancyScore));
    }

    /**
     * 修改考勤扣分项管理
     */
    @PreAuthorize("@ss.hasPermi('attendancy_score:attendancy_score:edit')")
    @Log(title = "考勤扣分项管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AttendancyScore attendancyScore)
    {
        return toAjax(attendancyScoreService.updateAttendancyScore(attendancyScore));
    }

    /**
     * 删除考勤扣分项管理
     */
    @PreAuthorize("@ss.hasPermi('attendancy_score:attendancy_score:remove')")
    @Log(title = "考勤扣分项管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(attendancyScoreService.deleteAttendancyScoreByIds(ids));
    }
}
