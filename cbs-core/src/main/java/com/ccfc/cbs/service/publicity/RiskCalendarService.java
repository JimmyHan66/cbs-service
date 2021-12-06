package com.ccfc.cbs.service.publicity;


import com.ccfc.cbs.bean.entity.publicity.RiskCalendar;
import com.ccfc.cbs.dao.publicity.RiskCalendarRepository;

import com.ccfc.cbs.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RiskCalendarService extends BaseService<RiskCalendar,Long,RiskCalendarRepository>  {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private RiskCalendarRepository riskCalendarRepository;

}

