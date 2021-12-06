package com.ccfc.cbs.api.controller.research;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.constant.factory.PageFactory;
import com.ccfc.cbs.bean.core.BussinessLog;
import com.ccfc.cbs.bean.entity.research.ResearchContract;
import com.ccfc.cbs.bean.enumeration.BizExceptionEnum;
import com.ccfc.cbs.bean.exception.ApplicationException;
import com.ccfc.cbs.bean.vo.front.Rets;
import com.ccfc.cbs.service.research.ResearchContractService;
import com.ccfc.cbs.utils.factory.Page;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/research/researchcontract")
public class ResearchContractController extends BaseController {
	private  Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	private ResearchContractService researchContractService;

	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public Object list(@RequestParam(required = false) Long id) {
		Page<ResearchContract> page = new PageFactory<ResearchContract>().defaultPage();
		page.addFilter("id",id);
		page = researchContractService.queryPage(page);
		return Rets.success(page);
	}
	@RequestMapping(method = RequestMethod.POST)
	@BussinessLog(value = "新增研究品种表", key = "name")
	@RequiresPermissions(value = "/research/researchcontract/add")
	public Object add(@ModelAttribute ResearchContract researchContract){
		researchContractService.insert(researchContract);
		return Rets.success();
	}
	@RequestMapping(method = RequestMethod.PUT)
	@BussinessLog(value = "更新研究品种表", key = "name")
	@RequiresPermissions(value = "/research/researchcontract/update")
	public Object update(@ModelAttribute ResearchContract researchContract){
		researchContractService.update(researchContract);
		return Rets.success();
	}
	@RequestMapping(method = RequestMethod.DELETE)
	@BussinessLog(value = "删除研究品种表", key = "id")
	@RequiresPermissions(value = "/research/researchcontract/delete")
	public Object remove(Long id){
		if (id == null) {
			throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
		}
		researchContractService.delete(id);
		return Rets.success();
	}

	/**
	 * 去重获取表中有的品种
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/queryAllContract",method = RequestMethod.GET)
	public Object queryAllContract() {
		List<Map> result = researchContractService.queryAllContract();
		return Rets.success(result);
	}
	/**
	 * 根据品种查品种下的表
	 * @param contractCode
	 * @return
	 */
	@RequestMapping(value = "/getTableByContract",method = RequestMethod.GET)
	public Object getTableByContract(@Param("contractCode") String contractCode) {
		List<ResearchContract> result = researchContractService.queryAllByContract(contractCode);
		return Rets.success(result);
	}
}