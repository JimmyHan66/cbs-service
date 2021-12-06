package com.ccfc.cbs.warpper;

import java.util.List;
import java.util.Map;

/**
 * @author shibl
 * @date 2021-04-29 9:15
 */
public class GameClientWarpper extends BaseControllerWarpper {

    public GameClientWarpper(List<Map<String, Object>> list) {
        super(list);
    }

    @Override
    protected void warpTheMap(Map<String, Object> map) {
        map.put("fundAccountName", this.dealStr(map.get("fundAccount").toString()));
    }

    private String dealStr(String string) {
        StringBuilder str = new StringBuilder(string);
        str.replace(2, 7, "*****");
        return str.toString();
    }
}
