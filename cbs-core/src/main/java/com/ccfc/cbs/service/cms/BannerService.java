package com.ccfc.cbs.service.cms;

import com.ccfc.cbs.bean.entity.cms.Banner;
import com.ccfc.cbs.bean.enumeration.cms.BannerTypeEnum;
import com.ccfc.cbs.bean.vo.offcialsite.BannerVo;
import com.ccfc.cbs.dao.cms.BannerRepository;
import com.ccfc.cbs.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BannerService extends BaseService<Banner, Long, BannerRepository> {
    @Autowired
    private BannerRepository bannerRepository;

    /**
     * 查询首页banner数据
     *
     * @return
     */
    public BannerVo queryIndexBanner() {
        return queryBanner(BannerTypeEnum.INDEX.getValue());
    }

    public BannerVo queryBanner(String type) {
        BannerVo banner = new BannerVo();
        List<Banner> bannerList = bannerRepository.findAllByType(type);
        banner.setIndex(0);
        banner.setList(bannerList);
        return banner;
    }
}
