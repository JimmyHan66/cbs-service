package com.ccfc.cbs.api.controller.publicity;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.constant.factory.PageFactory;
import com.ccfc.cbs.bean.core.BussinessLog;
import com.ccfc.cbs.bean.entity.publicity.Margin;
import com.ccfc.cbs.bean.entity.publicity.SpecialMargin;
import com.ccfc.cbs.bean.enumeration.BizExceptionEnum;
import com.ccfc.cbs.bean.exception.ApplicationException;
import com.ccfc.cbs.bean.vo.front.Rets;
import com.ccfc.cbs.bean.vo.query.SearchFilter;
import com.ccfc.cbs.service.publicity.MarginService;
import com.ccfc.cbs.service.publicity.SpecialMarginService;
import com.ccfc.cbs.utils.factory.Page;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;


@RestController
@RequestMapping("/publicity/specialmargin")
public class SpecialMarginController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private SpecialMarginService specialMarginService;
    @Autowired
    private MarginService marginService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public Object list(@RequestParam(required = false) String contractCode) {
        Page<SpecialMargin> page = new PageFactory<SpecialMargin>().defaultPage();
        page.addFilter("contractCode", contractCode);
        page = specialMarginService.queryPage(page);
        return Rets.success(page);
    }

    @RequestMapping(method = RequestMethod.POST)
    @BussinessLog(value = "新增特殊保证金公示信息", key = "name")
    @RequiresPermissions(value = "/publicity/specialmargin/add")
    public Object add(@ModelAttribute SpecialMargin specialMargin) {
        SearchFilter filter = new SearchFilter("specialContractCode", SearchFilter.Operator.EQ,
                specialMargin.getSpecialContractCode());
        if (specialMarginService.get(filter) != null) {
            return Rets.failure("已存在相同的特殊合约记录！");
        } else {
            specialMarginService.insert(specialMargin);
            // 特殊合约有增改，更新对应标准合约的修改时间
            SearchFilter marginFilter = new SearchFilter("contractCode", SearchFilter.Operator.EQ,
                    specialMargin.getContractCode());
            Margin margin = marginService.get(marginFilter);
            margin.setModifyTime(new Date());
            marginService.update(margin);
            return Rets.success();
        }
    }

    @RequestMapping(method = RequestMethod.PUT)
    @BussinessLog(value = "更新特殊保证金公示信息", key = "name")
    @RequiresPermissions(value = "/publicity/specialmargin/update")
    public Object update(@ModelAttribute SpecialMargin specialMargin) {
        specialMarginService.update(specialMargin);
        // 特殊合约有增改，更新对应标准合约的修改时间
        SearchFilter marginFilter = new SearchFilter("contractCode", SearchFilter.Operator.EQ,
                specialMargin.getContractCode());
        Margin margin = marginService.get(marginFilter);
        margin.setModifyTime(new Date());
        marginService.update(margin);
        return Rets.success();
    }

    @RequestMapping(method = RequestMethod.DELETE)
    @BussinessLog(value = "删除特殊保证金公示信息", key = "id")
    @RequiresPermissions(value = "/publicity/specialmargin/delete")
    public Object remove(Long id) {
        if (id == null) {
            throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
        }
        specialMarginService.delete(id);
        return Rets.success();
    }
}