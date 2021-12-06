package com.ccfc.cbs.api.controller.research;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.entity.research.ReContractField;
import com.ccfc.cbs.bean.vo.offcialsite.research.HisBasisChartVo;
import com.ccfc.cbs.service.research.ReContractFieldService;

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
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


@RestController
@RequestMapping("/research/contractfield")
public class ReContractFieldController extends BaseController {
	private  Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	private ReContractFieldService reContractFieldService;

	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public Object list(@RequestParam(required = false) Long id) {
		Page<ReContractField> page = new PageFactory<ReContractField>().defaultPage();
		page.addFilter("id",id);
		page = reContractFieldService.queryPage(page);
		return Rets.success(page);
	}
	@RequestMapping(method = RequestMethod.POST)
	@BussinessLog(value = "新增研究品种列表", key = "name")
	@RequiresPermissions(value = "/research/contractfield/add")
	public Object add(@ModelAttribute ReContractField reContractField){
		reContractFieldService.insert(reContractField);
		return Rets.success();
	}
	@RequestMapping(method = RequestMethod.PUT)
	@BussinessLog(value = "更新研究品种列表", key = "name")
	@RequiresPermissions(value = "/research/contractfield/update")
	public Object update(@ModelAttribute ReContractField reContractField){
		reContractFieldService.update(reContractField);
		return Rets.success();
	}
	@RequestMapping(method = RequestMethod.DELETE)
	@BussinessLog(value = "删除研究品种列表", key = "id")
	@RequiresPermissions(value = "/research/contractfield/delete")
	public Object remove(Long id){
		if (id == null) {
			throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
		}
		reContractFieldService.delete(id);
		return Rets.success();
	}

	/**
	 * 根据表明查相关的业务列
	 * @param tableNameEn
	 * @return
	 */
	@RequestMapping(value = "/getFieldByTable",method = RequestMethod.GET)
	public Object getFieldByTable(@Param("tableNameEn") String tableNameEn) {
		List<ReContractField> result = reContractFieldService.queryAllByTableName(tableNameEn);
		return Rets.success(result);
	}
}