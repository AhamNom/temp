package com.ruoyi.dormitory_score.controller;

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
import com.ruoyi.dormitory_score.domain.DormitoryScore;
import com.ruoyi.dormitory_score.service.IDormitoryScoreService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 宿舍扣分项管理Controller
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
@RestController
@RequestMapping("/dormitory_score/dormitory_score")
public class DormitoryScoreController extends BaseController
{
    @Autowired
    private IDormitoryScoreService dormitoryScoreService;

    /**
     * 查询宿舍扣分项管理列表
     */
    @PreAuthorize("@ss.hasPermi('dormitory_score:dormitory_score:list')")
    @GetMapping("/list")
    public TableDataInfo list(DormitoryScore dormitoryScore)
    {
        startPage();
        List<DormitoryScore> list = dormitoryScoreService.selectDormitoryScoreList(dormitoryScore);
        return getDataTable(list);
    }

    /**
     * 导出宿舍扣分项管理列表
     */
    @PreAuthorize("@ss.hasPermi('dormitory_score:dormitory_score:export')")
    @Log(title = "宿舍扣分项管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DormitoryScore dormitoryScore)
    {
        List<DormitoryScore> list = dormitoryScoreService.selectDormitoryScoreList(dormitoryScore);
        ExcelUtil<DormitoryScore> util = new ExcelUtil<DormitoryScore>(DormitoryScore.class);
        util.exportExcel(response, list, "宿舍扣分项管理数据");
    }

    /**
     * 获取宿舍扣分项管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('dormitory_score:dormitory_score:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dormitoryScoreService.selectDormitoryScoreById(id));
    }

    /**
     * 新增宿舍扣分项管理
     */
    @PreAuthorize("@ss.hasPermi('dormitory_score:dormitory_score:add')")
    @Log(title = "宿舍扣分项管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DormitoryScore dormitoryScore)
    {
        return toAjax(dormitoryScoreService.insertDormitoryScore(dormitoryScore));
    }

    /**
     * 修改宿舍扣分项管理
     */
    @PreAuthorize("@ss.hasPermi('dormitory_score:dormitory_score:edit')")
    @Log(title = "宿舍扣分项管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DormitoryScore dormitoryScore)
    {
        return toAjax(dormitoryScoreService.updateDormitoryScore(dormitoryScore));
    }

    /**
     * 删除宿舍扣分项管理
     */
    @PreAuthorize("@ss.hasPermi('dormitory_score:dormitory_score:remove')")
    @Log(title = "宿舍扣分项管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dormitoryScoreService.deleteDormitoryScoreByIds(ids));
    }
}
