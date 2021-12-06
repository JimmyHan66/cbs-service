package com.ccfc.cbs.api.controller.front.officialsite;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.enumeration.ConfigKeyEnum;
import com.ccfc.cbs.bean.vo.front.Rets;
import com.ccfc.cbs.bean.vo.node.DeptNode;
import com.ccfc.cbs.cache.ConfigCache;
import com.ccfc.cbs.service.system.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * @author shibl
 */
@RestController
@RequestMapping("/offcialsite/system")
public class SystemController extends BaseController {

    @Autowired
    private DeptService deptService;

    @Autowired
    private ConfigCache configCache;

    @RequestMapping(value = "/getOpenBranch", method = RequestMethod.GET)
    public Object getOpenBranch() {
        List<DeptNode> listAll = deptService.queryAllNode();
        List<DeptNode> list = new ArrayList<>();
        for (DeptNode deptNode : listAll) {
            if (deptNode.getId().toString().equals(configCache.get(ConfigKeyEnum.SYSTEM_DEPT_BRANCH))) {
                // 将分支机构下的营业部部门信息返回
                return Rets.success(deptNode.getChildren());
            }
        }
        return Rets.success(list);
    }
}
