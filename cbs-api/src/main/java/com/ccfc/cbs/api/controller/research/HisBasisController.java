package com.ccfc.cbs.api.controller.research;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.constant.factory.PageFactory;
import com.ccfc.cbs.bean.core.BussinessLog;
import com.ccfc.cbs.bean.entity.research.HisBasis;
import com.ccfc.cbs.bean.entity.research.ReContractField;
import com.ccfc.cbs.bean.enumeration.BizExceptionEnum;
import com.ccfc.cbs.bean.exception.ApplicationException;
import com.ccfc.cbs.bean.vo.front.Rets;
import com.ccfc.cbs.bean.vo.offcialsite.research.HisBasisChartVo;
import com.ccfc.cbs.service.research.HisBasisService;
import com.ccfc.cbs.service.research.ReContractFieldService;
import com.ccfc.cbs.utils.factory.Page;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/research/hisbasis")
public class HisBasisController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private HisBasisService hisBasisService;
    @Autowired
    private ReContractFieldService reContractFieldService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public Object list(@RequestParam(required = false) String contractCode) {
        Page<HisBasis> page = new PageFactory<HisBasis>().defaultPage();
        page.addFilter("contractCode", contractCode);
        page = hisBasisService.queryPage(page);
        return Rets.success(page);
    }

    @RequestMapping(method = RequestMethod.POST)
    @BussinessLog(value = "新增历史基差表", key = "name")
//    @RequiresPermissions(value = "/research/hisbasis/add")
    public Object add(@ModelAttribute HisBasis hisBasis) {
        hisBasisService.insert(hisBasis);
        return Rets.success();
    }

    @RequestMapping(method = RequestMethod.PUT)
    @BussinessLog(value = "更新历史基差表", key = "name")
//    @RequiresPermissions(value = "/research/hisbasis/update")
    public Object update(@ModelAttribute HisBasis hisBasis) {
        hisBasisService.update(hisBasis);
        return Rets.success();
    }

    @RequestMapping(method = RequestMethod.DELETE)
    @BussinessLog(value = "删除历史基差表", key = "id")
//    @RequiresPermissions(value = "/research/hisbasis/delete")
    public Object remove(Long id) {
        if (id == null) {
            throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
        }
        hisBasisService.delete(id);
        return Rets.success();
    }

    @RequestMapping(value = "/getHisBasisChart", method = RequestMethod.GET)
    public Object getHisBasisChart(@Param("contractCode") String contractCode) {
        List<HisBasisChartVo> list = new ArrayList<>();
        List<ReContractField> fieldList = reContractFieldService.queryAllByTableName("t_research_hisbasis");
        for (ReContractField field : fieldList) {
            HisBasisChartVo chartVo = new HisBasisChartVo();

            if (field.getTableFieldDb().equals("business_date")) {
                chartVo.setName(field.getTableFieldName());

                List<Map> dates = hisBasisService.queryAllByField(field.getTableFieldDb(), contractCode);
                List<String> dataList = new ArrayList<>();
                for (Map m : dates) {
                    String value = (String) m.get(field.getTableFieldDb());
                    dataList.add(value);
                }
                chartVo.setDateList(dataList);
            } else {
                chartVo.setName(field.getTableFieldName());
                chartVo.setType("line");
                chartVo.setStack("Total");

                List<Map> maps = hisBasisService.queryAllByField(field.getTableFieldDb(), contractCode);
                List<BigDecimal> data = new ArrayList<>();
                for (Map map : maps) {
                    BigDecimal value = (BigDecimal) map.get(field.getTableFieldDb());
                    data.add(value);
                }
                chartVo.setData(data);
            }

            list.add(chartVo);
        }

        return Rets.success(list);
    }
}