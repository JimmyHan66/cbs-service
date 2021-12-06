package com.ccfc.cbs.api.controller.game;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.entity.game.Cusfund;
import com.ccfc.cbs.service.game.CusfundService;

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
@RequestMapping("/game/cusfund")
public class CusfundController extends BaseController {
	private  Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	private CusfundService cusfundService;

	@RequestMapping(value = "/list",method = RequestMethod.GET)
	@RequiresPermissions(value = "/game/cusfund")
	public Object list(@RequestParam(required = false) Long id) {
		Page<Cusfund> page = new PageFactory<Cusfund>().defaultPage();
		page.addFilter("id",id);
		page = cusfundService.queryPage(page);
		return Rets.success(page);
	}
	@RequestMapping(method = RequestMethod.POST)
	@BussinessLog(value = "新增客户期货期权账户基本资金表", key = "name")
	@RequiresPermissions(value = "/game/cusfund/add")
	public Object add(@ModelAttribute Cusfund cusfund){
		cusfundService.insert(cusfund);
		return Rets.success();
	}
	@RequestMapping(method = RequestMethod.PUT)
	@BussinessLog(value = "更新客户期货期权账户基本资金表", key = "name")
	@RequiresPermissions(value = "/game/cusfund/update")
	public Object update(@ModelAttribute Cusfund cusfund){
		cusfundService.update(cusfund);
		return Rets.success();
	}
	@RequestMapping(method = RequestMethod.DELETE)
	@BussinessLog(value = "删除客户期货期权账户基本资金表", key = "id")
	@RequiresPermissions(value = "/game/cusfund/delete")
	public Object remove(Long id){
		if (id == null) {
			throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
		}
		cusfundService.delete(id);
		return Rets.success();
	}
}