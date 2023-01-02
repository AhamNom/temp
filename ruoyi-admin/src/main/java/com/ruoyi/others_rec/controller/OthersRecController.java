package com.ruoyi.others_rec.controller;

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
import com.ruoyi.others_rec.domain.OthersRec;
import com.ruoyi.others_rec.service.IOthersRecService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 其它扣分记录Controller
 * 
 * @author ruoyi
 * @date 2022-12-30
 */
@RestController
@RequestMapping("/others_rec/others_rec")
public class OthersRecController extends BaseController
{
    @Autowired
    private IOthersRecService othersRecService;

    /**
     * 查询其它扣分记录列表
     */
    @PreAuthorize("@ss.hasPermi('others_rec:others_rec:list')")
    @GetMapping("/list")
    public TableDataInfo list(OthersRec othersRec)
    {
        startPage();
        List<OthersRec> list = othersRecService.selectOthersRecList(othersRec);
        return getDataTable(list);
    }

    /**
     * 导出其它扣分记录列表
     */
    @PreAuthorize("@ss.hasPermi('others_rec:others_rec:export')")
    @Log(title = "其它扣分记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, OthersRec othersRec)
    {
        List<OthersRec> list = othersRecService.selectOthersRecList(othersRec);
        ExcelUtil<OthersRec> util = new ExcelUtil<OthersRec>(OthersRec.class);
        util.exportExcel(response, list, "其它扣分记录数据");
    }

    /**
     * 获取其它扣分记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('others_rec:others_rec:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(othersRecService.selectOthersRecById(id));
    }

    /**
     * 新增其它扣分记录
     */
    @PreAuthorize("@ss.hasPermi('others_rec:others_rec:add')")
    @Log(title = "其它扣分记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody OthersRec othersRec)
    {
        return toAjax(othersRecService.insertOthersRec(othersRec));
    }

    /**
     * 修改其它扣分记录
     */
    @PreAuthorize("@ss.hasPermi('others_rec:others_rec:edit')")
    @Log(title = "其它扣分记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody OthersRec othersRec)
    {
        return toAjax(othersRecService.updateOthersRec(othersRec));
    }

    /**
     * 删除其它扣分记录
     */
    @PreAuthorize("@ss.hasPermi('others_rec:others_rec:remove')")
    @Log(title = "其它扣分记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(othersRecService.deleteOthersRecByIds(ids));
    }
}
