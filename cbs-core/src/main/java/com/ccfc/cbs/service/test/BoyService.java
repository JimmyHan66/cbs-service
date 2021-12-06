package com.ccfc.cbs.service.test;


import com.ccfc.cbs.bean.entity.test.Boy;
import com.ccfc.cbs.dao.test.BoyRepository;

import com.ccfc.cbs.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoyService extends BaseService<Boy, Long, BoyRepository> {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private BoyRepository boyRepository;

}

