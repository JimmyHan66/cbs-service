package com.ccfc.cbs.api.controller.cms;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.entity.cms.WxGoodVoice;
import com.ccfc.cbs.service.cms.WxGoodVoiceService;

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
@RequestMapping("/cms/wxgoodvoice")
public class WxGoodVoiceController extends BaseController {
	private  Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	private WxGoodVoiceService wxGoodVoiceService;

	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public Object list(@RequestParam(required = false) Long id) {
		Page<WxGoodVoice> page = new PageFactory<WxGoodVoice>().defaultPage();
		page.addFilter("id",id);
		page = wxGoodVoiceService.queryPage(page);
		return Rets.success(page);
	}
	@RequestMapping(method = RequestMethod.POST)
	@BussinessLog(value = "新增微官网中原好声音", key = "name")
	@RequiresPermissions(value = "/cms/wxgoodvoice/add")
	public Object add(@ModelAttribute WxGoodVoice wxGoodVoice){
		wxGoodVoiceService.insert(wxGoodVoice);
		return Rets.success();
	}
	@RequestMapping(method = RequestMethod.PUT)
	@BussinessLog(value = "更新微官网中原好声音", key = "name")
	@RequiresPermissions(value = "/cms/wxgoodvoice/update")
	public Object update(@ModelAttribute WxGoodVoice wxGoodVoice){
		wxGoodVoiceService.update(wxGoodVoice);
		return Rets.success();
	}
	@RequestMapping(method = RequestMethod.DELETE)
	@BussinessLog(value = "删除微官网中原好声音", key = "id")
	@RequiresPermissions(value = "/cms/wxgoodvoice/delete")
	public Object remove(Long id){
		if (id == null) {
			throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
		}
		wxGoodVoiceService.delete(id);
		return Rets.success();
	}
}