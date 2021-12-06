package com.ccfc.cbs.service.task.job;

import com.ccfc.cbs.service.game.ImportCalDataService;
import com.ccfc.cbs.service.task.JobExecuter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Map;

/**
 * @author shibl
 * @date 2021-04-01 8:21
 */
@Component
public class GameCalJob extends JobExecuter {
    private final Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private ImportCalDataService importCalDataService;

    @Override
    public void execute(Map<String, Object> dataMap) throws Exception {
        // 获取指定的导入计算日期，如果空，则取系统日期
        String date = (String) dataMap.get("importDate");
        if (date == null || date.isEmpty()) {
            date = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
        }
        logger.info("结算数据导入定时任务的导入日期为: " + date);
        // 读取数据文件，导入数据库
        importCalDataService.importAllTxt(date);
        // 开始计算，结果插入日排行表
        importCalDataService.calRankDay(date);
    }
}
