package com.ccfc.cbs.service.research;


import com.ccfc.cbs.bean.entity.research.ReContractField;
import com.ccfc.cbs.dao.research.ReContractFieldRepository;
import com.ccfc.cbs.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ReContractFieldService extends BaseService<ReContractField, Long, ReContractFieldRepository> {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private ReContractFieldRepository reContractFieldRepository;

    public List<ReContractField> queryAllByTableName(String tableNameEn) {
        return reContractFieldRepository.queryAllByTableName(tableNameEn);
    }
}

