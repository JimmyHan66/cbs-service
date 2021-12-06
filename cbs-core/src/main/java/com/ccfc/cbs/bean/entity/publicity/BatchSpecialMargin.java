package com.ccfc.cbs.bean.entity.publicity;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author shibl
 * @date 2021-06-03 9:26
 */
@Data
public class BatchSpecialMargin {
    /**
     * 交易市场编号
     */
    private Integer marketNo;
    private String contractCodeList;
    private String contractMonth;
    private BigDecimal exchangeMargin;
    private BigDecimal companyMargin;
    private BigDecimal quoteChange;
    private String remark;
}
