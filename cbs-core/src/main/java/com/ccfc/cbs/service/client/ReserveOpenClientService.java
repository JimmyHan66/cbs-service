package com.ccfc.cbs.service.client;


import com.ccfc.cbs.bean.entity.client.ReserveOpenClient;
import com.ccfc.cbs.bean.entity.system.User;
import com.ccfc.cbs.bean.enumeration.ConfigKeyEnum;
import com.ccfc.cbs.bean.vo.query.SearchFilter;
import com.ccfc.cbs.cache.ConfigCache;
import com.ccfc.cbs.dao.client.ReserveOpenClientRepository;
import com.ccfc.cbs.service.BaseService;
import com.ccfc.cbs.service.message.MessageService;
import com.ccfc.cbs.service.system.UserService;
import com.ccfc.cbs.service.system.impl.ConstantFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ReserveOpenClientService extends BaseService<ReserveOpenClient,Long,ReserveOpenClientRepository>  {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private ReserveOpenClientRepository reserveOpenClientRepository;

    @Value("${mail.open.sendadress}")
    private String sendMailAddress;
    @Value("${mail.open.copyadress}")
    private String copyMailAddress;
    @Value("${mail.open.template}")
    private String emailTemplate;

    @Autowired
    private MessageService messageService;
    @Autowired
    private UserService userService;
    @Autowired
    private ConfigCache configCache;

    /**
     * 发送预约开户通知邮件给对应营业部开户岗人员
     *
     */
    @Async
    public void sendNoticeMail(ReserveOpenClient tClientReserveopenclient) {
        // 根据预约的营业部找到对应营业部开户岗帐号的邮箱地址
        List<SearchFilter> filters = new ArrayList<>();
        SearchFilter filter1 = new SearchFilter("deptid", SearchFilter.Operator.EQ,
                tClientReserveopenclient.getDeptId());
        filters.add(filter1);
        SearchFilter filter2 = new SearchFilter("roleid", SearchFilter.Operator.EQ,
                Integer.valueOf(configCache.get(ConfigKeyEnum.SYSTEM_ROLE_OPENPOST)));
        filters.add(filter2);
        User user = userService.get(filters);
        // 邮箱地址不为空则发送
        if (!user.getEmail().isEmpty()) {
            // 设置邮件数据
            Map<String, Object> dataMap = new HashMap<>();
            // 加密姓名电话，翻译性别
            StringBuilder sb = new StringBuilder(tClientReserveopenclient.getClientName());
            String clientName = sb.replace(1, sb.length(), "**").toString();
            dataMap.put("clientName", clientName);
            dataMap.put("sex", ConstantFactory.me().getSexName(tClientReserveopenclient.getSex()));
            sb = new StringBuilder(tClientReserveopenclient.getClientPhoneNo());
            String clientPhoneNo = sb.replace(3, 7, "****").toString();
            dataMap.put("clientPhoneNo", clientPhoneNo);

            messageService.sendTplEmail(emailTemplate, sendMailAddress,
                    user.getEmail(), copyMailAddress, "预约开户通知", dataMap);
        }
    }

}

