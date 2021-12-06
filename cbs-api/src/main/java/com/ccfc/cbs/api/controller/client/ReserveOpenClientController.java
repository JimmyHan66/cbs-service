package com.ccfc.cbs.api.controller.client;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.constant.factory.PageFactory;
import com.ccfc.cbs.bean.core.BussinessLog;
import com.ccfc.cbs.bean.entity.client.ReserveOpenClient;
import com.ccfc.cbs.bean.entity.system.FileInfo;
import com.ccfc.cbs.bean.enumeration.BizExceptionEnum;
import com.ccfc.cbs.bean.enumeration.ConfigKeyEnum;
import com.ccfc.cbs.bean.exception.ApplicationException;
import com.ccfc.cbs.bean.vo.front.Rets;
import com.ccfc.cbs.bean.vo.query.SearchFilter;
import com.ccfc.cbs.cache.ConfigCache;
import com.ccfc.cbs.service.client.ReserveOpenClientService;
import com.ccfc.cbs.service.system.FileService;
import com.ccfc.cbs.utils.BeanUtil;
import com.ccfc.cbs.utils.Maps;
import com.ccfc.cbs.utils.factory.Page;
import com.ccfc.cbs.warpper.ReserveOpenClientWarpper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/client/reserveopenclient")
public class ReserveOpenClientController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private ReserveOpenClientService reserveOpenClientService;
    @Autowired
    private ConfigCache configCache;
    @Autowired
    private FileService fileService;

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public Object list(@RequestParam(required = false) String clientName,
                       @RequestParam(required = false) String fundAccount,
                       @RequestParam(required = false) String clientPhoneNo,
                       @RequestParam(required = false) Boolean isOpenSuccess,
                       @RequestParam(required = false) Boolean isHistory,
                       @RequestParam(required = false) String channel,
                       @RequestParam(required = false) String startTime,
                       @RequestParam(required = false) String endTime,
                       @RequestParam() Integer deptId,
                       @RequestParam() String roleId) {
        Page<ReserveOpenClient> page = new PageFactory<ReserveOpenClient>().defaultPage();
        // 调用过滤查询
        List list = this.pageQuery(page, clientName, fundAccount, clientPhoneNo, isOpenSuccess, isHistory,
                channel, startTime, endTime, deptId, roleId);
        page.setRecords(list);
        return Rets.success(page);
    }

    @RequestMapping(method = RequestMethod.POST)
    @BussinessLog(value = "编辑预约开户客户信息", key = "name")
    public Object save(@ModelAttribute ReserveOpenClient tClientReserveopenclient) {
        if (tClientReserveopenclient.getId() == null) {
            reserveOpenClientService.insert(tClientReserveopenclient);
        } else {
            reserveOpenClientService.update(tClientReserveopenclient);
        }
        return Rets.success();
    }

    @RequestMapping(method = RequestMethod.DELETE)
    @BussinessLog(value = "删除预约开户客户信息", key = "id")
    public Object remove(Long id) {
        if (id == null) {
            throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
        }
        reserveOpenClientService.delete(id);
        return Rets.success();
    }


    @RequestMapping(value = "/export", method = RequestMethod.POST)
    @RequiresPermissions(value = "/client/reserveopenclient/export")
    public Object export(@RequestParam(required = false) String clientName,
                         @RequestParam(required = false) String fundAccount,
                         @RequestParam(required = false) String clientPhoneNo,
                         @RequestParam(required = false) Boolean isOpenSuccess,
                         @RequestParam(required = false) Boolean isHistory,
                         @RequestParam(required = false) String channel,
                         @RequestParam(required = false) String startTime,
                         @RequestParam(required = false) String endTime,
                         @RequestParam() Integer deptId,
                         @RequestParam() String roleId) {
        Page<ReserveOpenClient> page = new Page<ReserveOpenClient>(1, 99999999);
        // 调用过滤查询
        List list = this.pageQuery(page, clientName, fundAccount, clientPhoneNo, isOpenSuccess, isHistory,
                channel, startTime, endTime, deptId, roleId);
        Map<String, Object> map = Maps.newHashMap("list", list);
        FileInfo fileInfo = fileService.createExcel("templates/open.xlsx", "预约客户信息.xlsx",
                map);
        return Rets.success(fileInfo);
    }

    /**
     * 将过滤查询抽出公共方法供查询展示和信息导出使用
     */
    private List pageQuery(Page page, String clientName, String fundAccount, String clientPhoneNo, Boolean isOpenSuccess, Boolean isHistory,
                           String channel, String startTime, String endTime, Integer deptId, String roleId) {
        page.addFilter("clientName", SearchFilter.Operator.LIKE, clientName);
        page.addFilter("fundAccount", fundAccount);
        page.addFilter("clientPhoneNo", clientPhoneNo);
        if (isOpenSuccess != null) {
            page.addFilter("isOpenSuccess", isOpenSuccess);
        }
        if (isHistory != null) {
            page.addFilter("isHistory", isHistory);
        }
        if (channel != null) {
            page.addFilter("channel", channel);
        }
        // 过滤修改时间条件
        if (startTime != null && !startTime.isEmpty() && endTime != null && !endTime.isEmpty()) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
                Date startDateTime = sdf.parse(startTime);
                Date endDateTime = sdf.parse(endTime);
                page.addFilter("createTime", SearchFilter.Operator.GTE, startDateTime);
                page.addFilter("createTime", SearchFilter.Operator.LTE, endDateTime);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        String roleIdTemp = "," + roleId + ",";
        // 如果不是超级管理员和开户管理角色，则根据操作员部门序号过滤
        if (!roleIdTemp.contains(",1,") &&
                !roleIdTemp.contains("," + Integer.valueOf(configCache.get(ConfigKeyEnum.SYSTEM_ROLE_OPENADMIN)).toString() + ",")) {
            page.addFilter("deptId", deptId);
        }
        page = reserveOpenClientService.queryPage(page);
        // 包装类转义
        List list = (List) new ReserveOpenClientWarpper(BeanUtil.objectsToMaps(page.getRecords())).warp();

        return list;
    }
}