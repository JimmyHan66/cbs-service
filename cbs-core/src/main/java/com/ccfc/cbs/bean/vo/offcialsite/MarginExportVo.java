package com.ccfc.cbs.bean.vo.offcialsite;

import lombok.Data;

/**
 * @author shibl
 * @date 2020-12-01 15:13
 */
@Data
public class MarginExportVo {
    private String marketName;
    private String contractCode;
    private String contractName;
    private String multiplier;
    private String exchangeMargin;
    private String companyMargin;
    private String quoteChange;
    private String specialContractCode;
    private String specialExchangeMargin;
    private String specialCompanyMargin;
    private String specialQuoteChange;
    private String specialRemark;
}
