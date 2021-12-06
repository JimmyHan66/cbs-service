package com.ccfc.cbs.bean.vo.offcialsite;

import com.ccfc.cbs.bean.entity.cms.Banner;
import lombok.Data;

import java.util.List;

@Data
public class BannerVo {
    private Integer index = 0;
    private List<Banner> list;

}
