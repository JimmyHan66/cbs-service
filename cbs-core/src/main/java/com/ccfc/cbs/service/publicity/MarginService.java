package com.ccfc.cbs.service.publicity;


import com.ccfc.cbs.bean.entity.publicity.Margin;
import com.ccfc.cbs.dao.publicity.MarginRepository;

import com.ccfc.cbs.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MarginService extends BaseService<Margin,Long,MarginRepository>  {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private MarginRepository marginRepository;

}

