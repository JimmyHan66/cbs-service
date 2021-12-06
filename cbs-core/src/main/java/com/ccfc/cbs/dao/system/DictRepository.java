
package com.ccfc.cbs.dao.system;


import com.ccfc.cbs.bean.entity.system.Dict;
import com.ccfc.cbs.dao.BaseRepository;

import java.util.List;

public interface DictRepository extends BaseRepository<Dict, Long> {
    List<Dict> findByPid(Long pid);

    List<Dict> findByNameAndPid(String name, Long pid);

    List<Dict> findByNameLike(String name);
}
