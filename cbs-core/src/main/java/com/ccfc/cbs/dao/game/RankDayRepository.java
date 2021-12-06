package com.ccfc.cbs.dao.game;


import com.ccfc.cbs.bean.entity.game.RankDay;
import com.ccfc.cbs.dao.BaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


public interface RankDayRepository extends BaseRepository<RankDay, Long> {

    @Query(nativeQuery = true, value = "SELECT * FROM t_game_rankday a " +
            "WHERE a.date < ?1 AND a.fund_account = ?2 ORDER BY a.date DESC LIMIT 1")
    RankDay getOneByLastDate(String date, String fundAccount);

    @Query(nativeQuery = true, value = "SELECT * FROM t_game_rankday a " +
            "WHERE a.date = ?1 AND a.fund_account = ?2 LIMIT 1")
    RankDay getOneByDate(String date, String fundAccount);

    @Query(nativeQuery = true, value = "SELECT * FROM t_game_rankday a " +
            "WHERE a.date = ?1 AND a.group_type = ?2 ORDER BY a.max_principal_rate_grade DESC")
    List<RankDay> queryByDateGroup(String date, Integer groupType);

    @Query(nativeQuery = true, value = "SELECT MAX(a.max_principal_rate) FROM t_game_rankday a " +
            "WHERE a.date = ?1 AND a.group_type = ?2")
    BigDecimal getMaxPrincipalRate(String date, Integer groupType);

    @Query(nativeQuery = true, value = "SELECT * FROM t_game_rankday a " +
            "WHERE a.date = (SELECT MAX(b.date) FROM t_game_rankday b) " +
            "AND IF(?1 != null, a.group_type = ?1, 1=1)" +
            "AND IF(?2 != '', a.fund_account = ?2, 1=1) " +
            "AND IF(?3 != '', a.contestant_nickname LIKE CONCAT('%',?3,'%'), 1=1)" +
            "ORDER BY a.rank_day")
    List<RankDay> listRankDay(Integer groupType, String fundAccount, String contestantNickname);

    @Query(nativeQuery = true, value = "SELECT MAX(b.date) FROM t_game_rankday b")
    Date getMaxDate();
}

