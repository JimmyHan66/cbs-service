package com.ccfc.cbs.api.controller.research;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.constant.factory.PageFactory;
import com.ccfc.cbs.bean.core.BussinessLog;
import com.ccfc.cbs.bean.entity.research.InterSpread;
import com.ccfc.cbs.bean.entity.research.ReContractField;
import com.ccfc.cbs.bean.enumeration.BizExceptionEnum;
import com.ccfc.cbs.bean.exception.ApplicationException;
import com.ccfc.cbs.bean.vo.front.Rets;
import com.ccfc.cbs.bean.vo.offcialsite.research.InterSpreadVo;
import com.ccfc.cbs.service.research.InterSpreadService;
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
@RequestMapping("/research/interspread")
public class InterSpreadController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private InterSpreadService interSpreadService;
    @Autowired
    private ReContractFieldService reContractFieldService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public Object list(@RequestParam(required = false) String contractCode) {
        Page<InterSpread> page = new PageFactory<InterSpread>().defaultPage();
        page.addFilter("contractCode", contractCode);
        page = interSpreadService.queryPage(page);
        return Rets.success(page);
    }

    @RequestMapping(method = RequestMethod.POST)
    @BussinessLog(value = "新增跨期价差表", key = "name")
//    @RequiresPermissions(value = "/research/interspread/add")
    public Object add(@ModelAttribute InterSpread interSpread) {
        interSpreadService.insert(interSpread);
        return Rets.success();
    }

    @RequestMapping(method = RequestMethod.PUT)
    @BussinessLog(value = "更新跨期价差表", key = "name")
//    @RequiresPermissions(value = "/research/interspread/update")
    public Object update(@ModelAttribute InterSpread interSpread) {
        interSpreadService.update(interSpread);
        return Rets.success();
    }

    @RequestMapping(method = RequestMethod.DELETE)
    @BussinessLog(value = "删除跨期价差表", key = "id")
//    @RequiresPermissions(value = "/research/interspread/delete")
    public Object remove(Long id) {
        if (id == null) {
            throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
        }
        interSpreadService.delete(id);
        return Rets.success();
    }

    @RequestMapping(value = "/getInterSpreadChart", method = RequestMethod.GET)
    public Object getInterSpreadChart(@Param("contractCode") String contractCode) {
        List<InterSpreadVo> list = new ArrayList<>();
        List<ReContractField> fieldList = reContractFieldService.queryAllByTableName("t_research_interspread");
        for (ReContractField field : fieldList) {
            InterSpreadVo chartVo = new InterSpreadVo();

            if (field.getTableFieldDb().equals("business_date")) {
                chartVo.setName(field.getTableFieldName());

                List<Map> dates = interSpreadService.queryAllByField(field.getTableFieldDb(), contractCode);
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

                List<Map> maps = interSpreadService.queryAllByField(field.getTableFieldDb(), contractCode);
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