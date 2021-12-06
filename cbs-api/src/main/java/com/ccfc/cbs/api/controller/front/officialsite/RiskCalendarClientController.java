package com.ccfc.cbs.api.controller.front.officialsite;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.entity.publicity.RiskCalendar;
import com.ccfc.cbs.bean.vo.front.Rets;
import com.ccfc.cbs.bean.vo.offcialsite.RiskCalendarVo;
import com.ccfc.cbs.bean.vo.query.SearchFilter;
import com.ccfc.cbs.service.publicity.RiskCalendarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.constraints.NotNull;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * @author shibl
 * @date 2021-01-28 9:49
 */
@RestController
@RequestMapping("/offcialsite/riskcalendar")
public class RiskCalendarClientController extends BaseController {
    @Autowired
    private RiskCalendarService riskCalendarService;

    /**
     * 根据日期获取日历风控记录信息
     *
     * @param riskDate
     * @return RiskCalendar
     */
    @RequestMapping(value = "/getRiskInfoByDate", method = RequestMethod.GET)
    public Object getRiskInfoByDate(@Param("riskDate") @NotNull(message = "日期条件不能为空") String riskDate) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        SearchFilter filter = new SearchFilter("riskDate", SearchFilter.Operator.EQ, sdf.parse(riskDate));
        RiskCalendar riskCalendar = riskCalendarService.get(filter);
        if (riskCalendar != null) {
            return Rets.success(this.convertObject(riskCalendar));
        } else {
            return Rets.failure("没有相应的风控日历记录信息");
        }
    }

    /**
     * 根据月份获取风控日历标志信息
     *
     * @param month
     * @return list
     */
    @RequestMapping(value = "/getCalendarByMonth", method = RequestMethod.GET)
    public Object getCalendarByMonth(@Param("month") @NotNull(message = "月份条件不能为空") String month) {
        SearchFilter filter = new SearchFilter("month", SearchFilter.Operator.EQ,
                Integer.valueOf(month.replace("-", "")));
        List<RiskCalendar> list = riskCalendarService.queryAll(filter, Sort.by("riskDate"));
        if (!list.isEmpty()) {
            List<RiskCalendarVo> riskCalendarVoList = new ArrayList<>();
            for (RiskCalendar riskCalendar : list) {
                riskCalendarVoList.add(this.convertObject(riskCalendar));
            }
            return Rets.success(riskCalendarVoList);
        } else {
            return Rets.failure("没有相应的风控日历标志信息");
        }
    }

    private RiskCalendarVo convertObject(RiskCalendar riskCalendar) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        RiskCalendarVo riskCalendarVo = new RiskCalendarVo();
        riskCalendarVo.setRiskDate(sdf.format(riskCalendar.getRiskDate()));
        riskCalendarVo.setMonth(riskCalendar.getMonth());
        riskCalendarVo.setIsClosed(riskCalendar.getIsClosed());
        riskCalendarVo.setIsContent(riskCalendar.getIsContent());
        riskCalendarVo.setIsNoNight(riskCalendar.getIsNoNight());
        riskCalendarVo.setRiskContent(riskCalendar.getRiskContent());

        return riskCalendarVo;
    }
}
