
package com.ccfc.cbs.dao.system;

import com.ccfc.cbs.bean.entity.system.Cfg;
import com.ccfc.cbs.dao.BaseRepository;

/**
 * 全局参数dao
 *
 * @author ：enilu
 * @date ：Created in 2019/6/29 12:50
 */
public interface CfgRepository extends BaseRepository<Cfg, Long> {

    Cfg findByCfgName(String cfgName);
}
