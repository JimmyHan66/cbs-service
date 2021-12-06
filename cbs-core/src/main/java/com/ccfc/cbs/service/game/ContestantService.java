package com.ccfc.cbs.service.game;


import com.ccfc.cbs.bean.entity.game.Contestant;
import com.ccfc.cbs.dao.game.ContestantRepository;

import com.ccfc.cbs.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ContestantService extends BaseService<Contestant,Long,ContestantRepository>  {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private ContestantRepository contestantRepository;

}

