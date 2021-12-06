package com.ccfc.cbs.api.controller.cms;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.entity.cms.WxArticle;
import com.ccfc.cbs.service.cms.WxArticleService;

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
@RequestMapping("/cms/wxarticle")
public class WxArticleController extends BaseController {
	private  Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	private WxArticleService wxArticleService;

	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public Object list(@RequestParam(required = false) Long id) {
		Page<WxArticle> page = new PageFactory<WxArticle>().defaultPage();
		page.addFilter("id",id);
		page = wxArticleService.queryPage(page);
		return Rets.success(page);
	}
	@RequestMapping(method = RequestMethod.POST)
	@BussinessLog(value = "新增微官网文章", key = "name")
	@RequiresPermissions(value = "/cms/wxarticle/add")
	public Object add(@ModelAttribute WxArticle wxArticle){
		wxArticleService.insert(wxArticle);
		return Rets.success();
	}
	@RequestMapping(method = RequestMethod.PUT)
	@BussinessLog(value = "更新微官网文章", key = "name")
	@RequiresPermissions(value = "/cms/wxarticle/update")
	public Object update(@ModelAttribute WxArticle wxArticle){
		wxArticleService.update(wxArticle);
		return Rets.success();
	}
	@RequestMapping(method = RequestMethod.DELETE)
	@BussinessLog(value = "删除微官网文章", key = "id")
	@RequiresPermissions(value = "/cms/wxarticle/delete")
	public Object remove(Long id){
		if (id == null) {
			throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
		}
		wxArticleService.delete(id);
		return Rets.success();
	}
}