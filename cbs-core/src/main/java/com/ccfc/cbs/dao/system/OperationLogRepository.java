package com.ccfc.cbs.dao.system;


import com.ccfc.cbs.bean.entity.system.OperationLog;
import com.ccfc.cbs.dao.BaseRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;

/**
 * Created  on 2018/3/21 0021.
 *
 * @author enilu
 */
public interface OperationLogRepository extends BaseRepository<OperationLog, Long> {
    @Modifying
    @Transactional
    @Query(nativeQuery = true, value = "delete from t_sys_operation_log")
    int clear();
}
