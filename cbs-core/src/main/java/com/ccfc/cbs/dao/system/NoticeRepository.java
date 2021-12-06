package com.ccfc.cbs.dao.system;


import com.ccfc.cbs.bean.entity.system.Notice;
import com.ccfc.cbs.dao.BaseRepository;

import java.util.List;

/**
 * Created  on 2018/3/21 0021.
 *
 * @author enilu
 */
public interface NoticeRepository extends BaseRepository<Notice, Long> {
    List<Notice> findByTitleLike(String name);
}
