package com.ccfc.cbs.api.controller.front.officialsite;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.core.BussinessLog;
import com.ccfc.cbs.bean.entity.client.ReserveOpenClient;
import com.ccfc.cbs.bean.vo.front.Rets;
import com.ccfc.cbs.bean.vo.query.SearchFilter;
import com.ccfc.cbs.service.client.ReserveOpenClientService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
@RequestMapping("/offcialsite/reserveOpen")
public class ReserveOpenController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private ReserveOpenClientService reserveOpenClientService;

    @RequestMapping(method = RequestMethod.POST)
    @BussinessLog(value = "新增预约开户客户信息", key = "name")
    public Object save(@ModelAttribute ReserveOpenClient tClientReserveopenclient) {
        // 设置默认值
        tClientReserveopenclient.setIsHistory(false);
        tClientReserveopenclient.setIsOpenInHere(false);
        tClientReserveopenclient.setIsOpenInOthers(false);
        tClientReserveopenclient.setIsOpenSuccess(false);
        Date now = new Date();
        String businessDateStr = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(now);
        tClientReserveopenclient.setBusinessDate(businessDateStr);
        String serialNoStr = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(now);
        tClientReserveopenclient.setSerialNo(Long.parseLong(serialNoStr));
        // 根据手机号码查找是否已有预约信息，如果没有则插入，反之报错返回
        SearchFilter filter = new SearchFilter("clientPhoneNo", SearchFilter.Operator.EQ,
                tClientReserveopenclient.getClientPhoneNo());
        ReserveOpenClient result = reserveOpenClientService.get(filter);
        if (result == null) {
            reserveOpenClientService.insert(tClientReserveopenclient);
            reserveOpenClientService.sendNoticeMail(tClientReserveopenclient);
        } else {
            return Rets.failure("您已预约成功，无需重复提交！");
        }

        return Rets.success();
    }
}
