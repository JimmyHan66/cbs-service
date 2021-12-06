package com.ccfc.cbs.api.controller.game;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.entity.game.Trddata;
import com.ccfc.cbs.service.game.TrddataService;

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
@RequestMapping("/game/trddata")
public class TrddataController extends BaseController {
	private  Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	private TrddataService trddataService;

	@RequestMapping(value = "/list",method = RequestMethod.GET)
	@RequiresPermissions(value = "/game/trddata")
	public Object list(@RequestParam(required = false) Long id) {
		Page<Trddata> page = new PageFactory<Trddata>().defaultPage();
		page.addFilter("id",id);
		page = trddataService.queryPage(page);
		return Rets.success(page);
	}
	@RequestMapping(method = RequestMethod.POST)
	@BussinessLog(value = "新增期货成交明细表", key = "name")
	@RequiresPermissions(value = "/game/trddata/add")
	public Object add(@ModelAttribute Trddata trddata){
		trddataService.insert(trddata);
		return Rets.success();
	}
	@RequestMapping(method = RequestMethod.PUT)
	@BussinessLog(value = "更新期货成交明细表", key = "name")
	@RequiresPermissions(value = "/game/trddata/update")
	public Object update(@ModelAttribute Trddata trddata){
		trddataService.update(trddata);
		return Rets.success();
	}
	@RequestMapping(method = RequestMethod.DELETE)
	@BussinessLog(value = "删除期货成交明细表", key = "id")
	@RequiresPermissions(value = "/game/trddata/delete")
	public Object remove(Long id){
		if (id == null) {
			throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
		}
		trddataService.delete(id);
		return Rets.success();
	}
}