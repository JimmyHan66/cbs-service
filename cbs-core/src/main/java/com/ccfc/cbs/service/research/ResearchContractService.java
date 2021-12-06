package com.ccfc.cbs.service.research;


import com.ccfc.cbs.bean.entity.research.ResearchContract;
import com.ccfc.cbs.dao.research.ResearchContractRepository;
import com.ccfc.cbs.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ResearchContractService extends BaseService<ResearchContract, Long, ResearchContractRepository> {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private ResearchContractRepository researchContractRepository;

    public List<Map> queryAllContract() {
        return researchContractRepository.queryAllContract();
    }

    public List<ResearchContract> queryAllByContract(String contractCode) {
        return researchContractRepository.queryAllByContract(contractCode);
    }
}

