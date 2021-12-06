package com.ccfc.cbs.service.cms;


import com.ccfc.cbs.bean.entity.cms.WxGoodVoice;
import com.ccfc.cbs.dao.cms.WxGoodVoiceRepository;

import com.ccfc.cbs.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WxGoodVoiceService extends BaseService<WxGoodVoice,Long,WxGoodVoiceRepository>  {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private WxGoodVoiceRepository wxGoodVoiceRepository;

}

