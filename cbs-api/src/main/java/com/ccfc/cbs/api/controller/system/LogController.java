package com.ccfc.cbs.api.controller.system;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.constant.factory.PageFactory;
import com.ccfc.cbs.bean.constant.state.BizLogType;
import com.ccfc.cbs.bean.core.BussinessLog;
import com.ccfc.cbs.bean.entity.system.OperationLog;
import com.ccfc.cbs.bean.enumeration.Permission;
import com.ccfc.cbs.bean.vo.front.Rets;
import com.ccfc.cbs.bean.vo.query.SearchFilter;
import com.ccfc.cbs.service.system.OperationLogService;
import com.ccfc.cbs.utils.BeanUtil;
import com.ccfc.cbs.utils.DateUtil;
import com.ccfc.cbs.utils.HttpUtil;
import com.ccfc.cbs.utils.StringUtil;
import com.ccfc.cbs.utils.factory.Page;
import com.ccfc.cbs.warpper.LogWarpper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * LogController
 *
 * @author enilu
 * @version 2018/10/5 0005
 */
@RestController
@RequestMapping("/log")
public class LogController extends BaseController {
    @Autowired
    private OperationLogService operationLogService;

    /**
     * 查询操作日志列表
     */
    @RequestMapping("/list")
    @ResponseBody
    @RequiresPermissions(value = {Permission.LOG})
    public Object list(@RequestParam(required = false) String beginTime,
                       @RequestParam(required = false) String endTime,
                       @RequestParam(required = false) String logName,
                       @RequestParam(required = false) Integer logType) {
        Page<OperationLog> page = new PageFactory<OperationLog>().defaultPage();
        if (StringUtil.isNotEmpty(beginTime)) {
            page.addFilter("createTime", SearchFilter.Operator.GTE, DateUtil.parseDate(beginTime));
        }
        if (StringUtil.isNotEmpty(endTime)) {
            page.addFilter("createTime", SearchFilter.Operator.LTE, DateUtil.parseDate(endTime));
        }
        page.addFilter("logname", SearchFilter.Operator.LIKE, logName);
        if (logType != null) {
            page.addFilter(SearchFilter.build("logtype", SearchFilter.Operator.EQ, BizLogType.valueOf(logType)));
        }
        page = operationLogService.queryPage(page);
        page.setRecords((List<OperationLog>) new LogWarpper(BeanUtil.objectsToMaps(page.getRecords())).warp());
        return Rets.success(page);
    }

    /**
     * 查询指定用户的操作日志列表
     */
    @RequestMapping("/queryByUser")
    @ResponseBody
    public Object list() {
        Page<OperationLog> page = new Page<OperationLog>();
        page.addFilter(SearchFilter.build("userid", SearchFilter.Operator.EQ, getIdUser(HttpUtil.getRequest())));
        Page<OperationLog> pageResult = operationLogService.queryPage(page);
        return Rets.success(pageResult.getRecords());
    }

    /**
     * 清空日志
     */
    @RequestMapping(method = RequestMethod.DELETE)
    @BussinessLog(value = "清空业务日志")
    @RequiresPermissions(value = {Permission.LOG_CLEAR})
    public Object delLog() {
        operationLogService.clear();
        return Rets.success();
    }
}
