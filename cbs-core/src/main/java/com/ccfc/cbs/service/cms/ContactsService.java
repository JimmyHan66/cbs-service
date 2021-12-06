package com.ccfc.cbs.service.cms;

import com.ccfc.cbs.bean.entity.cms.Contacts;
import com.ccfc.cbs.dao.cms.ContactsRepository;
import com.ccfc.cbs.service.BaseService;
import org.springframework.stereotype.Service;

@Service
public class ContactsService extends BaseService<Contacts, Long, ContactsRepository> {
}
