package com.ccfc.cbs.bean.vo.offcialsite;

import com.ccfc.cbs.bean.entity.publicity.Margin;
import com.ccfc.cbs.bean.entity.publicity.SpecialMargin;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * @author shibl
 * @date 2020-11-27 9:48
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class MarginVo extends Margin {
    private List<SpecialMargin> specialMarginList;
}
