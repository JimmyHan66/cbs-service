package com.ccfc.cbs.cache.impl;

import com.ccfc.cbs.bean.entity.system.Cfg;
import com.ccfc.cbs.bean.enumeration.ConfigKeyEnum;
import com.ccfc.cbs.cache.BaseCache;
import com.ccfc.cbs.cache.CacheDao;
import com.ccfc.cbs.cache.ConfigCache;
import com.ccfc.cbs.dao.system.CfgRepository;
import com.ccfc.cbs.utils.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 全局参数缓存实现类
 *
 * @author enilu
 * @version 2018/12/20 0020
 */
@Service
public class ConfigCacheImpl extends BaseCache implements ConfigCache {
    private static final Logger logger = LoggerFactory.getLogger(ConfigCacheImpl.class);
    @Autowired
    private CfgRepository cfgRepository;
    @Autowired
    private CacheDao cacheDao;

    @Override
    public Object get(String key) {
        return cacheDao.hget(CacheDao.CONSTANT, key);
    }

    @Override
    public String get(String key, boolean local) {
        String ret = null;
        if (local) {
            ret = (String) get(key);
        } else {
            ret = cfgRepository.findByCfgName(key).getCfgValue();
            set(key, ret);
        }
        return ret;
    }

    @Override
    public String get(String key, String def) {
        String ret = (String) get(key);
        if (StringUtil.isEmpty(ret)) {
            return ret;
        }
        return ret;
    }

    @Override
    public String get(ConfigKeyEnum configKeyEnum) {
        return get(configKeyEnum.getValue(), null);
    }


    @Override
    public void set(String key, Object val) {
        cacheDao.hset(CacheDao.CONSTANT, key, val);
    }

    @Override
    public void del(String key, String val) {
        cacheDao.hdel(CacheDao.CONSTANT, val);
    }

    @Override
    public void cache() {
        super.cache();
        List<Cfg> list = cfgRepository.findAll();
        if (list != null && !list.isEmpty()) {
            for (Cfg cfg : list) {
                if (StringUtil.isNotEmpty(cfg.getCfgName()) && StringUtil.isNotEmpty(cfg.getCfgValue())) {
                    set(cfg.getCfgName(), cfg.getCfgValue());
                }
            }
        }
    }
}
