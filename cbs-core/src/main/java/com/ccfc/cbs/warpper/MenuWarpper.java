package com.ccfc.cbs.warpper;

import com.ccfc.cbs.bean.vo.node.IsMenu;
import com.ccfc.cbs.service.system.impl.ConstantFactory;

import java.util.List;
import java.util.Map;

/**
 * 菜单列表的包装类
 *
 * @author fengshuonan
 * @date 2017年2月19日15:07:29
 */
public class MenuWarpper extends BaseControllerWarpper {

    public MenuWarpper(List<Map<String, Object>> list) {
        super(list);
    }

    @Override
    public void warpTheMap(Map<String, Object> map) {
        map.put("isMenuName", IsMenu.valueOf((Integer) map.get("ismenu")));
    }

}
