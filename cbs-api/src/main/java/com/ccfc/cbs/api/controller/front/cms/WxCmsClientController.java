package com.ccfc.cbs.api.controller.front.cms;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.service.cms.BannerService;
import com.ccfc.cbs.service.cms.WxArticleService;
import com.ccfc.cbs.service.cms.WxChannelService;
import com.ccfc.cbs.service.cms.WxGoodVoiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * 微官网前端服务
 *
 * @author shibl
 * @date 2021-10-12 9:00
 */
@RestController
@RequestMapping("/offcialsite/wxCmsClient")
public class WxCmsClientController extends BaseController {
    @Autowired
    private WxArticleService wxArticleService;
    @Autowired
    private BannerService bannerService;
    @Autowired
    private WxChannelService wxChannelService;
    @Autowired
    private WxGoodVoiceService wxGoodVoiceService;

    @RequestMapping(value = "/queryArticle", method = RequestMethod.GET)
    public Object queryArticle() {
        return wxArticleService.queryAll();
    }

    @RequestMapping(value = "/queryBanner", method = RequestMethod.GET)
    public Object queryBanner() {
        return bannerService.queryAll();
    }

    @RequestMapping(value = "/queryChannel", method = RequestMethod.GET)
    public Object queryChannel() {
        return wxChannelService.queryAll();
    }

    @RequestMapping(value = "/queryGoodVoice", method = RequestMethod.GET)
    public Object queryGoodVoice() {
        return wxGoodVoiceService.queryAll();
    }
}
