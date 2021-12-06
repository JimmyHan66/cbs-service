package com.ccfc.cbs.dao.game;


import com.ccfc.cbs.bean.entity.game.Cusfund;
import com.ccfc.cbs.dao.BaseRepository;
import org.springframework.data.jpa.repository.Query;

import java.math.BigDecimal;


public interface CusfundRepository extends BaseRepository<Cusfund, Long> {
    @Query(nativeQuery = true, value = "SELECT AVG(a.equity_total) AS equityAvg FROM t_game_cusfund a " +
            "WHERE a.fund_account = ? ORDER BY a.date DESC LIMIT 30")
    BigDecimal getAvgEquity(String fundAccount);

    @Query(nativeQuery = true, value = "SELECT * FROM t_game_cusfund a " +
            "WHERE a.date = ?1 AND a.fund_account = ?2 LIMIT 1")
    Cusfund getOneByDate(String date, String fundAccount);
}

