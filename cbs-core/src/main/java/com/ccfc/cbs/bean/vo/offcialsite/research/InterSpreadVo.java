package com.ccfc.cbs.bean.vo.offcialsite.research;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author shibl
 * @date 2021-12-02 14:47
 */
@Data
public class InterSpreadVo {
    private String name;
    private String type;
    private String stack;
    private List<BigDecimal> data;
    private List<String> dateList;
}
