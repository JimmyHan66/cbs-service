package com.ccfc.cbs.dao.research;


import com.ccfc.cbs.bean.entity.research.ResearchContract;
import com.ccfc.cbs.dao.BaseRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Map;


public interface ResearchContractRepository extends BaseRepository<ResearchContract,Long>{

    @Query(nativeQuery = true, value = "SELECT DISTINCT contract_code AS contractCode, contract_name AS contractName " +
            "FROM t_research_researchcontract a " +
            "WHERE a.is_show = 1")
    List<Map> queryAllContract();

    @Query(nativeQuery = true, value = "SELECT * FROM t_research_researchcontract a " +
            "WHERE a.contract_code = ? AND a.is_show = 1")
    List<ResearchContract> queryAllByContract(String contractCode);

}

