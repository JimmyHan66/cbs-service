package com.ccfc.cbs.dao.game;


import com.ccfc.cbs.bean.entity.game.Cusfund;
import com.ccfc.cbs.bean.entity.game.Fundchg;
import com.ccfc.cbs.dao.BaseRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface FundchgRepository extends BaseRepository<Fundchg,Long>{

    @Query(nativeQuery = true, value = "SELECT * FROM t_game_fundchg a " +
            "WHERE a.date = ?1 AND a.fund_account = ?2")
    List<Fundchg> queryAllByDate(String date, String fundAccount);
}

