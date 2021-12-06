package com.ccfc.cbs.dao.research;


import com.ccfc.cbs.bean.entity.research.ReContractField;
import com.ccfc.cbs.dao.BaseRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Map;


public interface ReContractFieldRepository extends BaseRepository<ReContractField, Long> {

    @Query(nativeQuery = true, value = "SELECT * FROM t_research_contractfield a " +
            "WHERE a.table_name_en = ? AND a.is_show = 1 " +
            "ORDER BY field_order")
    List<ReContractField> queryAllByTableName(String tableNameEn);
}

