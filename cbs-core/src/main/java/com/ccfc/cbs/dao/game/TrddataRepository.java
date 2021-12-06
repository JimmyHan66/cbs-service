package com.ccfc.cbs.dao.game;


import com.ccfc.cbs.bean.entity.game.Trddata;
import com.ccfc.cbs.dao.BaseRepository;
import org.springframework.data.jpa.repository.Query;

import java.math.BigDecimal;


public interface TrddataRepository extends BaseRepository<Trddata, Long> {

    @Query(nativeQuery = true, value = "SELECT SUM(a.liquid_profit_zrds) AS totalProfit FROM t_game_trddata a " +
            "WHERE a.date = ?1 AND a.fund_account = ?2")
    BigDecimal getCumulativeProfit(String date, String fundAccount);

    @Query(nativeQuery = true, value = "SELECT SUM(a.fee) AS totalFee FROM t_game_trddata a " +
            "WHERE a.date = ?1 AND a.fund_account = ?2")
    BigDecimal getTotalFee(String date, String fundAccount);
}

