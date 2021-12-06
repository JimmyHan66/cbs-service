package com.ccfc.cbs.bean.vo.offcialsite.research;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author shibl
 * @date 2021-12-01 15:18
 */
@Data
public class HisBasisChartVo {
    private String name;
    private String type;
    private String stack;
    private List<BigDecimal> data;
    private List<String> dateList;
}
