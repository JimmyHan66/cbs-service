package com.ccfc.cbs.api.controller.publicity;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.constant.factory.PageFactory;
import com.ccfc.cbs.bean.core.BussinessLog;
import com.ccfc.cbs.bean.entity.publicity.RiskCalendar;
import com.ccfc.cbs.bean.enumeration.BizExceptionEnum;
import com.ccfc.cbs.bean.exception.ApplicationException;
import com.ccfc.cbs.bean.vo.front.Rets;
import com.ccfc.cbs.bean.vo.query.SearchFilter;
import com.ccfc.cbs.service.publicity.RiskCalendarService;
import com.ccfc.cbs.utils.BeanUtil;
import com.ccfc.cbs.utils.DateUtil;
import com.ccfc.cbs.utils.factory.Page;
import com.ccfc.cbs.warpper.RiskCalendarWarpper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.*;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@RestController
@RequestMapping("/publicity/riskcalendar")
public class RiskCalendarController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private RiskCalendarService riskCalendarService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public Object list(@RequestParam(required = false) String riskDate) throws ParseException {
        Page<RiskCalendar> page = new PageFactory<RiskCalendar>().defaultPage();
        if (riskDate != null && !riskDate.isEmpty()) {
            page.addFilter("riskDate", DateUtil.parseDate(riskDate));
        }
        page.setSort(Sort.by(Sort.Direction.DESC, "riskDate"));
        page = riskCalendarService.queryPage(page);
        // 包装类转义
        List list = (List) new RiskCalendarWarpper(BeanUtil.objectsToMaps(page.getRecords())).warp();
        page.setRecords(list);
        return Rets.success(page);
    }

    @RequestMapping(method = RequestMethod.POST)
    @BussinessLog(value = "新增风控日历", key = "name")
    @RequiresPermissions(value = "/publicity/riskcalendar/add")
    public Object add(@ModelAttribute RiskCalendar riskCalendar) {
        SearchFilter filter = new SearchFilter("riskDate", SearchFilter.Operator.EQ,
                riskCalendar.getRiskDate());
        RiskCalendar result = riskCalendarService.get(filter);
        if (result == null) {
            riskCalendarService.insert(riskCalendar);
        } else {
            return Rets.failure("已存在该日期的风控日历信息，请勿重复添加！");
        }
        return Rets.success();
    }

    @RequestMapping(method = RequestMethod.PUT)
    @BussinessLog(value = "更新风控日历", key = "name")
    @RequiresPermissions(value = "/publicity/riskcalendar/update")
    public Object update(@ModelAttribute RiskCalendar riskCalendar) {
        riskCalendarService.update(riskCalendar);
        return Rets.success();
    }

    @RequestMapping(method = RequestMethod.DELETE)
    @BussinessLog(value = "删除风控日历", key = "id")
    @RequiresPermissions(value = "/publicity/riskcalendar/delete")
    public Object remove(Long id) {
        if (id == null) {
            throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
        }
        riskCalendarService.delete(id);
        return Rets.success();
    }
}