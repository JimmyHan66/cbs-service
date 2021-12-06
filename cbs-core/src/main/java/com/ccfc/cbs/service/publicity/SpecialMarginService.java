package com.ccfc.cbs.service.publicity;


import com.ccfc.cbs.bean.entity.publicity.SpecialMargin;
import com.ccfc.cbs.dao.publicity.SpecialMarginRepository;

import com.ccfc.cbs.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SpecialMarginService extends BaseService<SpecialMargin,Long,SpecialMarginRepository>  {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private SpecialMarginRepository specialMarginRepository;

}

