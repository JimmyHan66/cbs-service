package com.ccfc.cbs.api.controller.front.officialsite;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.api.utils.HttpUrlConnectionUtil;
import com.ccfc.cbs.bean.enumeration.ConfigKeyEnum;
import com.ccfc.cbs.bean.vo.front.Rets;
import com.ccfc.cbs.bean.vo.node.DeptNode;
import com.ccfc.cbs.cache.ConfigCache;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author shibl
 * @date 2020/7/30 10:30
 */
@RestController
@RequestMapping("/offcialsite/hq")
public class HqController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(getClass());

    private final static String MARKET_ZJS = "4";

    @Autowired
    private ConfigCache configCache;

    @RequestMapping(value = "/getFuturesHq", method = RequestMethod.GET)
    public Object getFuturesHq(@Param("contractCode") String contractCode,
                               @Param("marketNo") String marketNo) {

        Map<String, String> map = new HashMap<String, String>(1);
        // 采用新浪行情接口最新的赋值规范，获取对应品种连续行情
        map.put("list", "nf_" + contractCode + "0");

        try {
            String url = configCache.get(ConfigKeyEnum.API_SINA_HQ);
            String hqResult = HttpUrlConnectionUtil.httpRequestToString(url, "GET", map);

            String[] hqArray = hqResult.split(",");
            //数组下表[8]为最新价
            return Rets.success(hqArray);

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return Rets.failure("行情信息获取异常，请稍后再试！");
        }
    }

    @RequestMapping(value = "/getDownload", method = RequestMethod.GET)
    public Object getDownload(@Param("time") String time) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = sdf.parse(time);
        Date now = new Date();

        int keepTime = (int) ((now.getTime() - date.getTime()) / 1000 / 60 / 60 / 24);

        if (keepTime > 1) {
            return Rets.failure("二维码已失效");
        } else {
            return Rets.success();
        }
    }
}
