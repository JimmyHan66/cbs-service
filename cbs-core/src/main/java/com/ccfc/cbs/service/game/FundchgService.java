package com.ccfc.cbs.service.game;


import com.ccfc.cbs.bean.entity.game.Fundchg;
import com.ccfc.cbs.dao.game.FundchgRepository;
import com.ccfc.cbs.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FundchgService extends BaseService<Fundchg, Long, FundchgRepository> {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private FundchgRepository fundchgRepository;

    public List<Fundchg> queryAllByDate(String date, String fundAccount) {
        return fundchgRepository.queryAllByDate(date, fundAccount);
    }
}

