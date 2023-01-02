package com.ruoyi.others_score.controller;

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
import com.ruoyi.others_score.domain.OthersScore;
import com.ruoyi.others_score.service.IOthersScoreService;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 其它扣分项管理Controller
 * 
 * @author ruoyi
 * @date 2022-12-29
 */
@RestController
@RequestMapping("/others_score/others_score")
public class OthersScoreController extends BaseController
{
    @Autowired
    private IOthersScoreService othersScoreService;

    /**
     * 查询其它扣分项管理列表
     */
    @PreAuthorize("@ss.hasPermi('others_score:others_score:list')")
    @GetMapping("/list")
    public AjaxResult list(OthersScore othersScore)
    {
        List<OthersScore> list = othersScoreService.selectOthersScoreList(othersScore);
        return success(list);
    }

    /**
     * 导出其它扣分项管理列表
     */
    @PreAuthorize("@ss.hasPermi('others_score:others_score:export')")
    @Log(title = "其它扣分项管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, OthersScore othersScore)
    {
        List<OthersScore> list = othersScoreService.selectOthersScoreList(othersScore);
        ExcelUtil<OthersScore> util = new ExcelUtil<OthersScore>(OthersScore.class);
        util.exportExcel(response, list, "其它扣分项管理数据");
    }

    /**
     * 获取其它扣分项管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('others_score:others_score:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(othersScoreService.selectOthersScoreById(id));
    }

    /**
     * 新增其它扣分项管理
     */
    @PreAuthorize("@ss.hasPermi('others_score:others_score:add')")
    @Log(title = "其它扣分项管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody OthersScore othersScore)
    {
        return toAjax(othersScoreService.insertOthersScore(othersScore));
    }

    /**
     * 修改其它扣分项管理
     */
    @PreAuthorize("@ss.hasPermi('others_score:others_score:edit')")
    @Log(title = "其它扣分项管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody OthersScore othersScore)
    {
        return toAjax(othersScoreService.updateOthersScore(othersScore));
    }

    /**
     * 删除其它扣分项管理
     */
    @PreAuthorize("@ss.hasPermi('others_score:others_score:remove')")
    @Log(title = "其它扣分项管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(othersScoreService.deleteOthersScoreByIds(ids));
    }
}
