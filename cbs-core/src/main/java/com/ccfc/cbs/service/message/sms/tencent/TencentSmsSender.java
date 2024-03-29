package com.ccfc.cbs.service.message.sms.tencent;

import com.ccfc.cbs.bean.enumeration.ConfigKeyEnum;
import com.ccfc.cbs.cache.ConfigCache;
import com.ccfc.cbs.service.message.sms.SmsSender;
import com.ccfc.cbs.utils.StringUtil;
import com.github.qcloudsms.SmsSingleSender;
import com.github.qcloudsms.SmsSingleSenderResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TencentSmsSender implements SmsSender {
    private Logger logger = LoggerFactory.getLogger(TencentSmsSender.class);
    @Autowired
    private ConfigCache configCache;

    @Override
    public boolean sendSms(String tplCode, String receiver, String[] args, String content) {
        Integer appid = Integer.valueOf((String) configCache.get(ConfigKeyEnum.API_TENCENT_SMS_APPID.getValue()));
        String appkey = (String) configCache.get(ConfigKeyEnum.API_TENCENT_SMS_APPKEY.getValue());
        String smsSign = (String) configCache.get(ConfigKeyEnum.API_TENCENT_SMS_SIGN.getValue());
        SmsSingleSender ssender = new SmsSingleSender(appid, appkey);
        SmsSingleSenderResult result = null;
        try {
            if (StringUtil.isNotEmpty(tplCode)) {
                //根据指定模板id发送短信
                // 签名参数未提供或者为空时，会使用默认签名发送短信
                result = ssender.sendWithParam("86", receiver,
                        Integer.valueOf(tplCode), args, smsSign, "", "");
            } else {
                //发送固定内容短信
                result = ssender.send(0, "86", receiver,
                        content, "", "");

            }
            logger.info(result.errMsg);
            return result.result == 0;
        } catch (Exception e) {
            logger.error("发送短信异常", e);
        }

        return false;
    }
}
