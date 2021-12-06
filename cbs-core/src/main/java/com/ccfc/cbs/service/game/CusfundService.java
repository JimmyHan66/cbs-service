package com.ccfc.cbs.service.game;


import com.ccfc.cbs.bean.entity.game.Cusfund;
import com.ccfc.cbs.dao.game.CusfundRepository;
import com.ccfc.cbs.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

@Service
public class CusfundService extends BaseService<Cusfund, Long, CusfundRepository> {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private CusfundRepository cusfundRepository;

    public BigDecimal getAvgEquity(String fundAccount) {
        return cusfundRepository.getAvgEquity(fundAccount);
    }

    public Cusfund getOneByDate(String date, String fundAccount) {
        return cusfundRepository.getOneByDate(date, fundAccount);
    }
}

