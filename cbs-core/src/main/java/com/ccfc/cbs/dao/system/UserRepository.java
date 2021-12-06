package com.ccfc.cbs.dao.system;


import com.ccfc.cbs.bean.entity.system.User;
import com.ccfc.cbs.dao.BaseRepository;

/**
 * Created  on 2018/3/21 0021.
 *
 * @author enilu
 */
public interface UserRepository extends BaseRepository<User, Long> {
    User findByAccount(String account);

    User findByAccountAndStatusNot(String account, Integer status);
}
