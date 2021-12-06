package com.ccfc.cbs.service.research;


import com.ccfc.cbs.bean.entity.research.InterSpread;
import com.ccfc.cbs.dao.research.InterSpreadRepository;

import com.ccfc.cbs.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class InterSpreadService extends BaseService<InterSpread,Long,InterSpreadRepository>  {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private InterSpreadRepository interSpreadRepository;

    public List<Map> queryAllByField(String field, String contractCode) {
        StringBuffer sql = new StringBuffer("SELECT a." + field + " FROM t_research_interspread a " +
                "WHERE a.contract_code = '" + contractCode +"' AND a.business_date IS NOT NULL ");
        return interSpreadRepository.queryMapBySql(sql.toString());
    }
}

