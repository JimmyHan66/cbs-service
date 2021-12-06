package com.ccfc.cbs.warpper;

import com.ccfc.cbs.service.system.impl.ConstantFactory;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

/**
 * 预约开户信息包装类
 *
 * @author shibl
 */
public class ReserveOpenClientWarpper extends BaseControllerWarpper {

    public ReserveOpenClientWarpper(List<Map<String, Object>> list) {
        super(list);
    }

    @Override
    public void warpTheMap(Map<String, Object> map) {
        map.put("sexName", ConstantFactory.me().getSexName((Integer) map.get("sex")));
        map.put("openTypeName", ConstantFactory.me().getDictsByName("开户类型", String.valueOf(map.get("openType"))));
        map.put("clientTypeName", ConstantFactory.me().getDictsByName("客户类型", String.valueOf(map.get("clientType"))));
        map.put("isOpenInOthersName", ConstantFactory.me().getWhetherName((Boolean) map.get("isOpenInOthers")));
        map.put("isOpenInHereName", ConstantFactory.me().getWhetherName((Boolean) map.get("isOpenInHere")));
        map.put("isOpenSuccessName", ConstantFactory.me().getWhetherName((Boolean) map.get("isOpenSuccess")));
        map.put("isHistoryName", ConstantFactory.me().getWhetherName((Boolean) map.get("isHistory")));
        if (map.get("openDate") != null) {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            map.put("openDateFormat", format.format(map.get("openDate")));
        }
    }
}
