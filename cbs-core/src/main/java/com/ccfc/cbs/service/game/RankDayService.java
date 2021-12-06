package com.ccfc.cbs.service.game;


import com.ccfc.cbs.bean.entity.game.RankDay;
import com.ccfc.cbs.dao.game.RankDayRepository;
import com.ccfc.cbs.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Service
public class RankDayService extends BaseService<RankDay, Long, RankDayRepository> {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private RankDayRepository rankDayRepository;

    public RankDay getOneByLastDate(String date, String fundAccount) {
        return rankDayRepository.getOneByLastDate(date, fundAccount);
    }

    public RankDay getOneByDate(String date, String fundAccount) {
        return rankDayRepository.getOneByDate(date, fundAccount);
    }

    public List<RankDay> queryByDateGroup(String date, Integer groupType) {
        return rankDayRepository.queryByDateGroup(date, groupType);
    }

    public BigDecimal getMaxPrincipalRate(String date, Integer groupType) {
        return rankDayRepository.getMaxPrincipalRate(date, groupType);
    }

    public List<RankDay> listRankDay(Integer groupType, String fundAccount, String contestantNickname) {
        return rankDayRepository.listRankDay(groupType, fundAccount, contestantNickname);
    }

    public Date getMaxDate() {
        return rankDayRepository.getMaxDate();
    }
}

