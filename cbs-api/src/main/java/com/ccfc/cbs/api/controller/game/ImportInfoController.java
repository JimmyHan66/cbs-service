package com.ccfc.cbs.api.controller.game;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.api.utils.ZipUtil;
import com.ccfc.cbs.bean.constant.factory.PageFactory;
import com.ccfc.cbs.bean.core.BussinessLog;
import com.ccfc.cbs.bean.entity.game.ImportInfo;
import com.ccfc.cbs.bean.enumeration.BizExceptionEnum;
import com.ccfc.cbs.bean.enumeration.ConfigKeyEnum;
import com.ccfc.cbs.bean.exception.ApplicationException;
import com.ccfc.cbs.bean.vo.front.Rets;
import com.ccfc.cbs.cache.ConfigCache;
import com.ccfc.cbs.service.game.ImportCalDataService;
import com.ccfc.cbs.service.game.ImportInfoService;
import com.ccfc.cbs.utils.factory.Page;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.scheduling.annotation.Async;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;


@RestController
@RequestMapping("/game/importinfo")
public class ImportInfoController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private ImportInfoService importInfoService;
    @Autowired
    private ImportCalDataService importCalDataService;
    @Autowired
    private ConfigCache configCache;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public Object list(@RequestParam(required = false) Long id) {
        Page<ImportInfo> page = new PageFactory<ImportInfo>().defaultPage();
        page.addFilter("id", id);
        page = importInfoService.queryPage(page);
        return Rets.success(page);
    }

    @RequestMapping(method = RequestMethod.POST)
    @BussinessLog(value = "新增结算数据导入信息表", key = "name")
    public Object add(@ModelAttribute ImportInfo importInfo) {
        importInfoService.insert(importInfo);
        this.upFile(importInfo);
        return Rets.success();
    }

    @RequestMapping(method = RequestMethod.PUT)
    @BussinessLog(value = "更新结算数据导入信息表", key = "name")
    public Object update(@ModelAttribute ImportInfo importInfo) {
        importInfoService.update(importInfo);
        return Rets.success();
    }

    @RequestMapping(method = RequestMethod.DELETE)
    @BussinessLog(value = "删除结算数据导入信息表", key = "id")
    @RequiresPermissions(value = "/game/importinfo/delete")
    public Object remove(Long id) {
        if (id == null) {
            throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
        }
        importInfoService.delete(id);
        return Rets.success();
    }

    @Async
    void upFile(ImportInfo importInfo) {
        // 赋予日期
        String date = new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime());
        String pathname = configCache.get(ConfigKeyEnum.SYSTEM_FILE_UPLOAD_PATH) + importInfo.getRealFileName();
        String outDir = configCache.get(ConfigKeyEnum.SYSTEM_FILE_UPLOAD_PATH) + "game/" + date + "/";
        logger.info("pathname : " + pathname);
        logger.info("outDir : " + outDir);
        try {
            ZipUtil.unzip(pathname, outDir);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("结算文件解压失败");
        }
    }

    @RequestMapping(value = "/calData", method = RequestMethod.GET)
    @BussinessLog(value = "手工触发结算数据计算", key = "name")
    public Object calData(@Param("calDate") String calDate) {
        // 判断对应日期的结算文件目录是否存在
        String date = calDate.replace("-", "");
        File folder = new File(configCache.get(ConfigKeyEnum.SYSTEM_FILE_UPLOAD_PATH) + "game/" + date + "/");
        if (!folder.exists() && !folder.isDirectory()) {
            return Rets.failure("对应日期结算文件目录不存在");
        } else {
            // 导入
            importCalDataService.importAllTxt(calDate);
            // 计算
            importCalDataService.calRankDay(calDate);
            return Rets.success();
        }
    }
}