
package com.ccfc.cbs.dao.system;


import com.ccfc.cbs.bean.entity.system.Task;
import com.ccfc.cbs.dao.BaseRepository;

import java.util.List;

public interface TaskRepository extends BaseRepository<Task, Long> {

    long countByNameLike(String name);

    List<Task> findByNameLike(String name);

    List<Task> findAllByDisabled(boolean disable);
}
