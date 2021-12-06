package com.ccfc.cbs.service.cms;


import com.ccfc.cbs.bean.entity.cms.WxChannel;
import com.ccfc.cbs.dao.cms.WxChannelRepository;

import com.ccfc.cbs.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WxChannelService extends BaseService<WxChannel,Long,WxChannelRepository>  {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private WxChannelRepository wxChannelRepository;

}

