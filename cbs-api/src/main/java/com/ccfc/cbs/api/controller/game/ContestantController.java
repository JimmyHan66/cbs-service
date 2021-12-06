package com.ccfc.cbs.api.controller.game;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.constant.factory.PageFactory;
import com.ccfc.cbs.bean.core.BussinessLog;
import com.ccfc.cbs.bean.entity.game.Contestant;
import com.ccfc.cbs.bean.entity.system.FileInfo;
import com.ccfc.cbs.bean.enumeration.BizExceptionEnum;
import com.ccfc.cbs.bean.exception.ApplicationException;
import com.ccfc.cbs.bean.vo.front.Rets;
import com.ccfc.cbs.bean.vo.query.SearchFilter;
import com.ccfc.cbs.service.game.ContestantService;
import com.ccfc.cbs.service.system.FileService;
import com.ccfc.cbs.utils.BeanUtil;
import com.ccfc.cbs.utils.Maps;
import com.ccfc.cbs.utils.factory.Page;
import com.ccfc.cbs.warpper.ContestantWarpper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/game/contestant")
public class ContestantController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private ContestantService contestantService;
    @Autowired
    private FileService fileService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public Object list(@RequestParam(required = false) String contestantName,
                       @RequestParam(required = false) String fundAccount,
                       @RequestParam(required = false) String contestantPhoneNo,
                       @RequestParam(required = false) Boolean isValid) {
        Page<Contestant> page = new PageFactory<Contestant>().defaultPage();
        // 调用过滤查询
        List list = this.pageQuery(page, contestantName, fundAccount, contestantPhoneNo, isValid);
        page.setRecords(list);
        return Rets.success(page);
    }

    @RequestMapping(method = RequestMethod.POST)
    @BussinessLog(value = "新增实盘大赛参赛者信息", key = "name")
    @RequiresPermissions(value = "/game/contestant/add")
    public Object add(@ModelAttribute Contestant contestant) {
        contestantService.insert(contestant);
        return Rets.success();
    }

    @RequestMapping(method = RequestMethod.PUT)
    @BussinessLog(value = "更新实盘大赛参赛者信息", key = "name")
    @RequiresPermissions(value = "/game/contestant/update")
    public Object update(@ModelAttribute Contestant contestant) {
        contestantService.update(contestant);
        return Rets.success();
    }

    @RequestMapping(method = RequestMethod.DELETE)
    @BussinessLog(value = "删除实盘大赛参赛者信息", key = "id")
    @RequiresPermissions(value = "/game/contestant/delete")
    public Object remove(Long id) {
        if (id == null) {
            throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
        }
        contestantService.delete(id);
        return Rets.success();
    }

    @RequestMapping(value = "/export", method = RequestMethod.POST)
    @RequiresPermissions(value = "/game/contestant/export")
    public Object export(@RequestParam(required = false) String contestantName,
                         @RequestParam(required = false) String fundAccount,
                         @RequestParam(required = false) String contestantPhoneNo,
                         @RequestParam(required = false) Boolean isValid) {
        Page<Contestant> page = new Page<Contestant>(1, 99999999);
        // 调用过滤查询
        List list = this.pageQuery(page, contestantName, fundAccount, contestantPhoneNo, isValid);
        Map<String, Object> map = Maps.newHashMap("list", list);
        FileInfo fileInfo = fileService.createExcel("templates/game_sign.xls", "0199.xls",
                map);
        return Rets.success(fileInfo);
    }

    /**
     * 将过滤查询抽出公共方法供查询展示和信息导出使用
     */
    private List pageQuery(Page page, String contestantName, String fundAccount, String contestantPhoneNo, Boolean isValid) {
        page.addFilter("contestantName", SearchFilter.Operator.LIKE, contestantName);
        page.addFilter("fundAccount", fundAccount);
        page.addFilter("contestantPhoneNo", contestantPhoneNo);
        if (isValid != null) {
            page.addFilter("isValid", isValid);
        }
        page = contestantService.queryPage(page);
        // 包装类转义
        List list = (List) new ContestantWarpper(BeanUtil.objectsToMaps(page.getRecords())).warp();

        return list;
    }
}