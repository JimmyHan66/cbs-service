package com.ccfc.cbs.bean.vo.offcialsite;

import lombok.Data;

/**
 * @author shibl
 * @date 2021-02-01 9:06
 */
@Data
public class RiskCalendarVo {

    private String riskDate;
    private Integer month;
    private Boolean isClosed;
    private Boolean isNoNight;
    private Boolean isContent;
    private String riskContent;
}
