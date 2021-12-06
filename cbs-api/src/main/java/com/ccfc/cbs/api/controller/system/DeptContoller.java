package com.ccfc.cbs.api.controller.system;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.core.BussinessLog;
import com.ccfc.cbs.bean.entity.system.Dept;
import com.ccfc.cbs.bean.enumeration.BizExceptionEnum;
import com.ccfc.cbs.bean.enumeration.ConfigKeyEnum;
import com.ccfc.cbs.bean.enumeration.Permission;
import com.ccfc.cbs.bean.exception.ApplicationException;
import com.ccfc.cbs.bean.vo.front.Rets;
import com.ccfc.cbs.bean.vo.node.DeptNode;
import com.ccfc.cbs.cache.ConfigCache;
import com.ccfc.cbs.service.system.DeptService;
import com.ccfc.cbs.service.system.LogObjectHolder;
import com.ccfc.cbs.utils.BeanUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

/**
 * DeptContoller
 *
 * @author enilu
 * @version 2018/9/15 0015
 */
@RestController
@RequestMapping("/dept")
public class DeptContoller extends BaseController {
    private Logger logger = LoggerFactory.getLogger(MenuController.class);

    @Autowired
    private DeptService deptService;

    @Autowired
    private ConfigCache configCache;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @RequiresPermissions(value = {Permission.DEPT})
    public Object list() {
        List<DeptNode> list = deptService.queryAllNode();
        return Rets.success(list);
    }

    @RequestMapping(method = RequestMethod.POST)
    @BussinessLog(value = "编辑部门", key = "simplename")
    @RequiresPermissions(value = {Permission.DEPT_EDIT})
    public Object save(@ModelAttribute @Valid Dept dept) {
        if (BeanUtil.isOneEmpty(dept, dept.getSimplename())) {
            throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
        }
        if (dept.getId() != null) {
            Dept old = deptService.get(dept.getId());
            LogObjectHolder.me().set(old);
            old.setPid(dept.getPid());
            old.setSimplename(dept.getSimplename());
            old.setFullname(dept.getFullname());
            old.setNum(dept.getNum());
            old.setTips(dept.getTips());
            deptService.deptSetPids(old);
            deptService.update(old);
        } else {
            deptService.deptSetPids(dept);
            deptService.insert(dept);
        }
        return Rets.success();
    }

    @RequestMapping(method = RequestMethod.DELETE)
    @BussinessLog(value = "删除部门", key = "id")
    @RequiresPermissions(value = {Permission.DEPT_DEL})
    public Object remove(@RequestParam Long id) {
        logger.info("id:{}", id);
        if (id == null) {
            throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
        }
        deptService.deleteDept(id);
        return Rets.success();
    }

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
