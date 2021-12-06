package com.ccfc.cbs.warpper;

import com.ccfc.cbs.service.system.impl.ConstantFactory;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

/**
 * @author shibl
 * @date 2021-01-27 14:41
 */
public class RiskCalendarWarpper extends BaseControllerWarpper {
    public RiskCalendarWarpper(List<Map<String, Object>> list) {
        super(list);
    }

    @Override
    public void warpTheMap(Map<String, Object> map) {
        map.put("isClosedName", ConstantFactory.me().getWhetherName((Boolean) map.get("isClosed")));
        map.put("isNoNightName", ConstantFactory.me().getWhetherName((Boolean) map.get("isNoNight")));
        map.put("isContentName", ConstantFactory.me().getWhetherName((Boolean) map.get("isContent")));


        if (map.get("riskDate") != null) {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            map.put("riskDateFormat", format.format(map.get("riskDate")));
        }
    }
}