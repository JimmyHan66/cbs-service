package com.ccfc.cbs.api.controller.game;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.entity.game.RankDay;
import com.ccfc.cbs.service.game.RankDayService;

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
@RequestMapping("/game/rankday")
public class RankDayController extends BaseController {
	private  Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	private RankDayService rankDayService;

	@RequestMapping(value = "/list",method = RequestMethod.GET)
	@RequiresPermissions(value = "/game/rankday")
	public Object list(@RequestParam(required = false) Long id) {
		Page<RankDay> page = new PageFactory<RankDay>().defaultPage();
		page.addFilter("id",id);
		page = rankDayService.queryPage(page);
		return Rets.success(page);
	}
	@RequestMapping(method = RequestMethod.POST)
	@BussinessLog(value = "新增实盘大赛排名日榜", key = "name")
	@RequiresPermissions(value = "/game/rankday/add")
	public Object add(@ModelAttribute RankDay rankDay){
		rankDayService.insert(rankDay);
		return Rets.success();
	}
	@RequestMapping(method = RequestMethod.PUT)
	@BussinessLog(value = "更新实盘大赛排名日榜", key = "name")
	@RequiresPermissions(value = "/game/rankday/update")
	public Object update(@ModelAttribute RankDay rankDay){
		rankDayService.update(rankDay);
		return Rets.success();
	}
	@RequestMapping(method = RequestMethod.DELETE)
	@BussinessLog(value = "删除实盘大赛排名日榜", key = "id")
	@RequiresPermissions(value = "/game/rankday/delete")
	public Object remove(Long id){
		if (id == null) {
			throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
		}
		rankDayService.delete(id);
		return Rets.success();
	}
}