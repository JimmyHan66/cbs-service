package com.ccfc.cbs.service.game;


import com.ccfc.cbs.bean.entity.game.Trddata;
import com.ccfc.cbs.dao.game.TrddataRepository;
import com.ccfc.cbs.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

@Service
public class TrddataService extends BaseService<Trddata, Long, TrddataRepository> {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private TrddataRepository trddataRepository;

    public BigDecimal getCumulativeProfit(String date, String fundAccount) {
        BigDecimal profit = trddataRepository.getCumulativeProfit(date, fundAccount);
        return profit == null ? BigDecimal.ZERO : profit;
    }

    public BigDecimal getTotalFee(String date, String fundAccount) {
        BigDecimal fee = trddataRepository.getTotalFee(date, fundAccount);
        return fee == null ? BigDecimal.ZERO : fee;
    }
}

