package com.ccfc.cbs.api.controller.cms;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.entity.cms.WxChannel;
import com.ccfc.cbs.service.cms.WxChannelService;

import com.ccfc.cbs.bean.core.BussinessLog;
import com.ccfc.cbs.bean.constant.factory.PageFactory;
import com.ccfc.cbs.bean.enumeration.BizExceptionEnum;
import com.ccfc.cbs.bean.exception.ApplicationException;
import com.ccfc.cbs.bean.vo.front.Rets;

import com.ccfc.cbs.utils.factory.Page;


import org.apache.shiro.authz.annotation.RequiresPermissions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/cms/wxchannel")
public class WxChannelController extends BaseController {
	private  Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	private WxChannelService wxChannelService;

	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public Object list(@RequestParam(required = false) Long id) {
		Page<WxChannel> page = new PageFactory<WxChannel>().defaultPage();
		page.addFilter("id",id);
		page = wxChannelService.queryPage(page);
		return Rets.success(page);
	}
	@RequestMapping(method = RequestMethod.POST)
	@BussinessLog(value = "新增微官网九宫格", key = "name")
	@RequiresPermissions(value = "/cms/wxchannel/add")
	public Object add(@ModelAttribute WxChannel wxChannel){
		wxChannelService.insert(wxChannel);
		return Rets.success();
	}
	@RequestMapping(method = RequestMethod.PUT)
	@BussinessLog(value = "更新微官网九宫格", key = "name")
	@RequiresPermissions(value = "/cms/wxchannel/update")
	public Object update(@ModelAttribute WxChannel wxChannel){
		wxChannelService.update(wxChannel);
		return Rets.success();
	}
	@RequestMapping(method = RequestMethod.DELETE)
	@BussinessLog(value = "删除微官网九宫格", key = "id")
	@RequiresPermissions(value = "/cms/wxchannel/delete")
	public Object remove(Long id){
		if (id == null) {
			throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
		}
		wxChannelService.delete(id);
		// TODO: 2021-08-31  增加图片删除逻辑
		return Rets.success();
	}
}