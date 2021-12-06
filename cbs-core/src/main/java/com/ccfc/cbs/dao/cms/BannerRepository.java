
package com.ccfc.cbs.dao.cms;

import com.ccfc.cbs.bean.entity.cms.Banner;
import com.ccfc.cbs.dao.BaseRepository;

import java.util.List;

public interface BannerRepository extends BaseRepository<Banner, Long> {
    /**
     * 查询指定类别的banner列表
     *
     * @param type
     * @return
     */
    List<Banner> findAllByType(String type);
}
