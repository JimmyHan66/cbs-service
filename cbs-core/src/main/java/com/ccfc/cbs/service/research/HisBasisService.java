package com.ccfc.cbs.service.research;


import com.ccfc.cbs.bean.entity.research.HisBasis;
import com.ccfc.cbs.dao.research.HisBasisRepository;

import com.ccfc.cbs.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class HisBasisService extends BaseService<HisBasis, Long, HisBasisRepository> {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private HisBasisRepository hisBasisRepository;

    public List<Map> queryAllByField(String field, String contractCode) {
        StringBuffer sql = new StringBuffer("SELECT a." + field + " FROM t_research_hisbasis a " +
                "WHERE a.contract_code = '" + contractCode +"' AND a.business_date IS NOT NULL ");
        return hisBasisRepository.queryMapBySql(sql.toString());
    }
}

