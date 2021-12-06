package com.ccfc.cbs.api.controller.game;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.entity.game.Fundchg;
import com.ccfc.cbs.service.game.FundchgService;

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
@RequestMapping("/game/fundchg")
public class FundchgController extends BaseController {
	private  Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	private FundchgService fundchgService;

	@RequestMapping(value = "/list",method = RequestMethod.GET)
	@RequiresPermissions(value = "/game/fundchg")
	public Object list(@RequestParam(required = false) Long id) {
		Page<Fundchg> page = new PageFactory<Fundchg>().defaultPage();
		page.addFilter("id",id);
		page = fundchgService.queryPage(page);
		return Rets.success(page);
	}
	@RequestMapping(method = RequestMethod.POST)
	@BussinessLog(value = "新增客户出入金记录表", key = "name")
	@RequiresPermissions(value = "/game/fundchg/add")
	public Object add(@ModelAttribute Fundchg fundchg){
		fundchgService.insert(fundchg);
		return Rets.success();
	}
	@RequestMapping(method = RequestMethod.PUT)
	@BussinessLog(value = "更新客户出入金记录表", key = "name")
	@RequiresPermissions(value = "/game/fundchg/update")
	public Object update(@ModelAttribute Fundchg fundchg){
		fundchgService.update(fundchg);
		return Rets.success();
	}
	@RequestMapping(method = RequestMethod.DELETE)
	@BussinessLog(value = "删除客户出入金记录表", key = "id")
	@RequiresPermissions(value = "/game/fundchg/delete")
	public Object remove(Long id){
		if (id == null) {
			throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
		}
		fundchgService.delete(id);
		return Rets.success();
	}
}