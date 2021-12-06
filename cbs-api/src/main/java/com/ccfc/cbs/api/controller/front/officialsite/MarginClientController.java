package com.ccfc.cbs.api.controller.front.officialsite;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.entity.publicity.Margin;
import com.ccfc.cbs.bean.entity.publicity.SpecialMargin;
import com.ccfc.cbs.bean.vo.front.Rets;
import com.ccfc.cbs.bean.vo.offcialsite.MarginVo;
import com.ccfc.cbs.bean.vo.query.SearchFilter;
import com.ccfc.cbs.service.publicity.MarginService;
import com.ccfc.cbs.service.publicity.SpecialMarginService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * 保证金公示客户端
 *
 * @author shibl
 * @date 2020/11/11 10:52
 */
@RestController
@RequestMapping("/offcialsite/margin")
public class MarginClientController extends BaseController {
    @Autowired
    private MarginService marginService;
    @Autowired
    private SpecialMarginService specialMarginService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public Object list() {
        List<Margin> marginList = marginService.queryAll();
        // 查询标准合约下的特殊合约
        List<MarginVo> marginVoList = new ArrayList<>();
        for (Margin margin : marginList) {
            MarginVo marginVo = new MarginVo();
            BeanUtils.copyProperties(margin,marginVo);
            List<SpecialMargin> specialMarginList = new ArrayList<>();
            SearchFilter filter = new SearchFilter("contractCode", SearchFilter.Operator.EQ,
                    margin.getContractCode());
            try {
                specialMarginList = specialMarginService.queryAll(filter);
            } catch (Exception e) {
                System.out.println(e.getMessage());
                specialMarginList = null;
            }

            marginVo.setSpecialMarginList(specialMarginList);
            marginVoList.add(marginVo);
        }
        return Rets.success(marginVoList);
    }
}
