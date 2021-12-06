package com.ccfc.cbs.core.factory;

import com.ccfc.cbs.bean.dto.UserDto;
import com.ccfc.cbs.bean.entity.system.User;
import com.ccfc.cbs.utils.MD5;
import org.springframework.beans.BeanUtils;

/**
 * 用户创建工厂
 *
 * @author fengshuonan
 * @date 2017-05-05 22:43
 */
public class UserFactory {
    // 默认的重置密码
    private static final String PWD = "1Qaz2wsx";

    public static User createUser(UserDto userDto, User user) {
        if (userDto == null) {
            return null;
        } else {
            BeanUtils.copyProperties(userDto, user);
            return user;
        }
    }

    public static User updateUser(UserDto userDto, User user) {
        if (userDto == null) {
            return null;
        } else {
            user.setName(userDto.getName());
            user.setDeptid(userDto.getDeptid());
            user.setSex(userDto.getSex());
            user.setPhone(userDto.getPhone());
            user.setEmail(userDto.getEmail());
            user.setBirthday(userDto.getBirthday());
            if (userDto.getStatus() != null) {
                user.setStatus(userDto.getStatus());
            }
            // 如果密码等于默认的重置密码，则认为是重置密码操作
            if (userDto.getPassword().equals(PWD)) {
                user.setPassword(MD5.md5(PWD, user.getSalt()));
            }
            return user;
        }
    }
}
