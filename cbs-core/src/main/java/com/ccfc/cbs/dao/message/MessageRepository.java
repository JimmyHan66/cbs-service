package com.ccfc.cbs.dao.message;


import com.ccfc.cbs.bean.entity.message.Message;
import com.ccfc.cbs.dao.BaseRepository;

import java.util.ArrayList;


public interface MessageRepository extends BaseRepository<Message, Long> {
    void deleteAllByIdIn(ArrayList<String> list);
}

