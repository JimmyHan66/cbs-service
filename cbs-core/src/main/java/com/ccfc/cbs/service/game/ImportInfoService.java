package com.ccfc.cbs.service.game;


import com.ccfc.cbs.bean.entity.game.ImportInfo;
import com.ccfc.cbs.dao.game.ImportInfoRepository;

import com.ccfc.cbs.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ImportInfoService extends BaseService<ImportInfo,Long,ImportInfoRepository>  {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private ImportInfoRepository importInfoRepository;

}

