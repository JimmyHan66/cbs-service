package com.ccfc.cbs.service.task;


import com.ccfc.cbs.bean.entity.system.TaskLog;
import com.ccfc.cbs.dao.system.TaskLogRepository;
import com.ccfc.cbs.service.BaseService;
import org.springframework.stereotype.Service;

/**
 * 定时任务日志服务类
 *
 * @author enilu
 * @date 2019-08-13
 */
@Service
public class TaskLogService extends BaseService<TaskLog, Long, TaskLogRepository> {
}
