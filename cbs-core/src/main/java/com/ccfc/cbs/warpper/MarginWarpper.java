package com.ccfc.cbs.warpper;

import com.ccfc.cbs.service.system.impl.ConstantFactory;

import java.util.List;
import java.util.Map;

/**
 * 保证金信息包装类
 *
 * @author shibl
 * @date 2020/11/10 10:22
 */
public class MarginWarpper extends BaseControllerWarpper {
    public MarginWarpper(List<Map<String, Object>> list) {
        super(list);
    }

    @Override
    public void warpTheMap(Map<String, Object> map) {
        map.put("marketName", ConstantFactory.me().getDictsByName("期货交易所编号", String.valueOf(map.get("marketNo"))));
    }
}
