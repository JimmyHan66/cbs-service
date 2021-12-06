package com.ccfc.cbs.warpper;

import com.ccfc.cbs.service.system.impl.ConstantFactory;

import java.util.List;
import java.util.Map;

/**
 * 参赛者报名信息包装类
 *
 * @author shibl
 * @date 2021-02-22 11:08
 */
public class ContestantWarpper extends BaseControllerWarpper {
    public ContestantWarpper(List<Map<String, Object>> list) {
        super(list);
    }

    @Override
    public void warpTheMap(Map<String, Object> map) {
        map.put("isQuantifyName", ConstantFactory.me().getWhetherName((Boolean) map.get("isQuantify")));
        map.put("isHedgeArbitrageName", ConstantFactory.me().getWhetherName((Boolean) map.get("isHedgeArbitrage")));
        map.put("isAgencyName", ConstantFactory.me().getWhetherName((Boolean) map.get("isAgency")));
        map.put("isValidName", ConstantFactory.me().getWhetherName((Boolean) map.get("isValid")));

        // 文件导出生成期货日报实盘大赛需要的格式
        map.put("isQuantifyXLS", (Boolean) map.get("isQuantify") ? "1" : "0");
        map.put("isHedgeArbitrageXLS", (Boolean) map.get("isHedgeArbitrage") ? "1" : "0");
        map.put("isAgencyXLS", (Boolean) map.get("isAgency") ? "1" : "0");
    }
}
