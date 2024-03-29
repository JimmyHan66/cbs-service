package com.ccfc.cbs.dao.system;

import com.ccfc.cbs.bean.entity.system.Relation;
import com.ccfc.cbs.dao.BaseRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created  on 2018/3/21 0021.
 *
 * @author enilu
 */
public interface RelationRepository extends BaseRepository<Relation, Long> {
    @Transactional
    @Modifying
    @Query(nativeQuery = true, value = "delete from t_sys_relation where roleid=?1")
    int deleteByRoleId(Long roleId);
}
