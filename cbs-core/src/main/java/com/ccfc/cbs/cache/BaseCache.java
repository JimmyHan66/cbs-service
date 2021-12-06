package com.ccfc.cbs.cache;

import com.ccfc.cbs.bean.vo.SpringContextHolder;
import com.ccfc.cbs.service.system.impl.ConstantFactory;

/**
 * @author ：enilu
 * @date ：Created in 2020/4/26 19:07
 */
public abstract class BaseCache implements Cache {
    @Override
    public void cache() {
        SpringContextHolder.getBean(ConstantFactory.class).cleanLocalCache();
    }
}
