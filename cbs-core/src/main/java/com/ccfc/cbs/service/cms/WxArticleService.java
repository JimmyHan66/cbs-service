package com.ccfc.cbs.service.cms;


import com.ccfc.cbs.bean.entity.cms.WxArticle;
import com.ccfc.cbs.dao.cms.WxArticleRepository;

import com.ccfc.cbs.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WxArticleService extends BaseService<WxArticle,Long,WxArticleRepository>  {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private WxArticleRepository wxArticleRepository;

}

