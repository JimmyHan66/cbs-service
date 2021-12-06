package com.ccfc.cbs.dao.message;


import com.ccfc.cbs.bean.entity.message.MessageTemplate;
import com.ccfc.cbs.dao.BaseRepository;

import java.util.List;


public interface MessagetemplateRepository extends BaseRepository<MessageTemplate, Long> {
    MessageTemplate findByCode(String code);

    List<MessageTemplate> findByIdMessageSender(Long idMessageSender);
}

