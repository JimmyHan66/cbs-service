package com.ccfc.cbs.api.controller.publicity;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.constant.factory.PageFactory;
import com.ccfc.cbs.bean.core.BussinessLog;
import com.ccfc.cbs.bean.entity.publicity.BatchSpecialMargin;
import com.ccfc.cbs.bean.entity.publicity.Margin;
import com.ccfc.cbs.bean.entity.publicity.SpecialMargin;
import com.ccfc.cbs.bean.entity.system.FileInfo;
import com.ccfc.cbs.bean.enumeration.BizExceptionEnum;
import com.ccfc.cbs.bean.exception.ApplicationException;
import com.ccfc.cbs.bean.vo.front.Rets;
import com.ccfc.cbs.bean.vo.offcialsite.MarginExportVo;
import com.ccfc.cbs.bean.vo.query.SearchFilter;
import com.ccfc.cbs.service.publicity.MarginService;
import com.ccfc.cbs.service.publicity.SpecialMarginService;
import com.ccfc.cbs.service.system.FileService;
import com.ccfc.cbs.service.system.impl.ConstantFactory;
import com.ccfc.cbs.utils.BeanUtil;
import com.ccfc.cbs.utils.Maps;
import com.ccfc.cbs.utils.factory.Page;
import com.ccfc.cbs.warpper.MarginWarpper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


@RestController
@RequestMapping("/publicity/margin")
public class MarginController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private MarginService marginService;
    @Autowired
    private SpecialMarginService specialMarginService;
    @Autowired
    private FileService fileService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public Object list(@RequestParam(required = false) String contractCode,
                       @RequestParam(required = false) String contractName,
                       @RequestParam(required = false) Integer marketNo,
                       @RequestParam(required = false) String startTime,
                       @RequestParam(required = false) String endTime) {
        Page<Margin> page = new PageFactory<Margin>().defaultPage();
        page.addFilter("contractCode", contractCode);
        page.addFilter("contractName", contractName);
        if (marketNo != null) {
            page.addFilter("marketNo", marketNo);
        }
        // 过滤修改时间条件
        if (startTime != null && !startTime.isEmpty() && endTime != null && !endTime.isEmpty()) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
                Date startDateTime = sdf.parse(startTime);
                Date endDateTime = sdf.parse(endTime);
                page.addFilter("modifyTime", SearchFilter.Operator.GTE, startDateTime);
                page.addFilter("modifyTime", SearchFilter.Operator.LTE, endDateTime);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        page = marginService.queryPage(page);
        // 包装类转义
        List list = (List) new MarginWarpper(BeanUtil.objectsToMaps(page.getRecords())).warp();
        page.setRecords(list);
        return Rets.success(page);
    }

    @RequestMapping(method = RequestMethod.POST)
    @BussinessLog(value = "新增保证金公示信息", key = "name")
    @RequiresPermissions(value = "/publicity/margin/add")
    public Object add(@ModelAttribute Margin margin) {
        SearchFilter filter = new SearchFilter("contractCode", SearchFilter.Operator.EQ,
                margin.getContractCode());
        Margin result = marginService.get(filter);
        if (result == null) {
            marginService.insert(margin);
        } else {
            return Rets.failure("已存在相同合约代码的品种！");
        }

        return Rets.success();
    }

    @RequestMapping(method = RequestMethod.PUT)
    @BussinessLog(value = "更新保证金公示信息", key = "name")
    @RequiresPermissions(value = "/publicity/margin/update")
    public Object update(@ModelAttribute Margin margin) {
        marginService.update(margin);
        return Rets.success();
    }

    @RequestMapping(method = RequestMethod.DELETE)
    @BussinessLog(value = "删除保证金公示信息", key = "id")
    @RequiresPermissions(value = "/publicity/margin/delete")
    public Object remove(Long id) {
        if (id == null) {
            throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
        }
        marginService.delete(id);
        return Rets.success();
    }

    /**
     * 导出保证金列表
     */
    @RequestMapping(value = "/export", method = RequestMethod.GET)
    @RequiresPermissions(value = "/publicity/margin/export")
    public Object export() {
        List<Margin> marginList = marginService.queryAll();
        // 根据市场排序，避免某个市场的新增品种排到最后，以实现同交易所的品种分为一组的效果
        marginList.sort(Margin.Comparators.MARKETNO);
        // 查询标准合约下的特殊合约
        List<MarginExportVo> marginExportVoList = new ArrayList<>();
        for (Margin margin : marginList) {
            MarginExportVo marginExportVo = new MarginExportVo();
            // 翻译市场名称
            marginExportVo.setMarketName(ConstantFactory.me().getDictsByName("期货交易所编号",
                    String.valueOf(margin.getMarketNo())));
            marginExportVo.setContractCode(margin.getContractCode());
            marginExportVo.setContractName(margin.getContractName());
            marginExportVo.setMultiplier(String.valueOf(margin.getMultiplier().intValue()));
            marginExportVo.setExchangeMargin(convertNumToStr(margin.getExchangeMargin()));
            marginExportVo.setCompanyMargin(convertNumToStr(margin.getCompanyMargin()));
            marginExportVo.setQuoteChange("±" + convertNumToStr(margin.getQuoteChange()));
            // 查询出对应的特殊品种合约
            List<SpecialMargin> specialMarginList = new ArrayList<>();
            SearchFilter filter = new SearchFilter("contractCode", SearchFilter.Operator.EQ,
                    margin.getContractCode());
            try {
                specialMarginList = specialMarginService.queryAll(filter);
                if (specialMarginList != null && !specialMarginList.isEmpty()) {
                    // 重新组装
                    for (SpecialMargin specialMargin : specialMarginList) {
                        MarginExportVo marginExportTemp = new MarginExportVo();
                        BeanUtils.copyProperties(marginExportVo, marginExportTemp);
                        marginExportTemp.setSpecialContractCode(specialMargin.getSpecialContractCode());
                        marginExportTemp.setSpecialExchangeMargin(convertNumToStr(specialMargin.getExchangeMargin()));
                        marginExportTemp.setSpecialCompanyMargin(convertNumToStr(specialMargin.getCompanyMargin()));
                        marginExportTemp.setSpecialQuoteChange("±" + convertNumToStr(specialMargin.getQuoteChange()));
                        marginExportTemp.setSpecialRemark(specialMargin.getRemark());

                        marginExportVoList.add(marginExportTemp);
                    }
                } else {
                    marginExportVo.setSpecialContractCode("---");
                    marginExportVo.setSpecialExchangeMargin("---");
                    marginExportVo.setSpecialCompanyMargin("---");
                    marginExportVo.setSpecialQuoteChange("---");
                    marginExportVo.setSpecialRemark("---");
                    marginExportVoList.add(marginExportVo);
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        // 赋予日期
        String date = new SimpleDateFormat("yyyy年MM月dd日").format(Calendar.getInstance().getTime());
        Map<String, Object> map = Maps.newHashMap("list", marginExportVoList);
        map.put("date", date);
        FileInfo fileInfo = fileService.createExcel("templates/margin.xlsx", date + "各期货品种日常及特殊合约保证金收取标准.xlsx",
                map);

        return Rets.success(fileInfo);
    }

    /**
     * 保证金标准数值格式转换
     */
    private String convertNumToStr(BigDecimal num) {
        String str = "---";
        if (num != null) {
            if (new BigDecimal(num.intValue()).compareTo(num) == 0) {
                // 纯整数
                str = num.intValue() + "%";
            } else {
                // 小数
                str = num.setScale(1, BigDecimal.ROUND_DOWN).toString() + "%";
            }
        }
        return str;
    }

    @RequestMapping(value = "/getCodeByMarket", method = RequestMethod.GET)
    public Object getCodeByMarket(@Param("marketNo") Integer marketNo) {
        SearchFilter filter = new SearchFilter("marketNo", SearchFilter.Operator.EQ, marketNo);

        List<Margin> marginList = marginService.queryAll(filter);

        return Rets.success(marginList);
    }

    @RequestMapping(value = "/batchAdd", method = RequestMethod.POST)
    @BussinessLog(value = "批量新增特殊合约信息", key = "name")
    @RequiresPermissions(value = "/publicity/margin/batch")
    public Object batchAddSpecialMargin(@ModelAttribute BatchSpecialMargin batchSpecialMargin) {
        String[] strings = batchSpecialMargin.getContractCodeList().split(",");
        for (String contractCode : strings) {
            SpecialMargin specialMargin = new SpecialMargin();
            specialMargin.setContractCode(contractCode);
            specialMargin.setSpecialContractCode(contractCode + batchSpecialMargin.getContractMonth());
            specialMargin.setExchangeMargin(batchSpecialMargin.getExchangeMargin());
            specialMargin.setCompanyMargin(batchSpecialMargin.getCompanyMargin());
            specialMargin.setQuoteChange(batchSpecialMargin.getQuoteChange());
            specialMargin.setRemark(batchSpecialMargin.getRemark());

            SearchFilter filter = new SearchFilter("specialContractCode", SearchFilter.Operator.EQ,
                    specialMargin.getSpecialContractCode());
            // 判断对应特殊合约是否已存在，存在更新，不存在插入
            if (specialMarginService.get(filter) != null) {
                specialMarginService.update(specialMargin);
            } else {
                specialMarginService.insert(specialMargin);
            }
            // 特殊合约有增改，更新对应标准合约的修改时间
            SearchFilter marginFilter = new SearchFilter("contractCode", SearchFilter.Operator.EQ,
                    specialMargin.getContractCode());
            Margin margin = marginService.get(marginFilter);
            margin.setModifyTime(new Date());
            marginService.update(margin);
        }

        return Rets.success();
    }

    @RequestMapping(value = "/batchDelete", method = RequestMethod.POST)
    @BussinessLog(value = "批量删除特殊合约信息", key = "name")
    @RequiresPermissions(value = "/publicity/margin/batch")
    public Object batchDeleteSpecialMargin(@ModelAttribute BatchSpecialMargin batchSpecialMargin) {
        String[] strings = batchSpecialMargin.getContractCodeList().split(",");
        for (String contractCode : strings) {
            SearchFilter filter = new SearchFilter("specialContractCode", SearchFilter.Operator.EQ,
                    contractCode + batchSpecialMargin.getContractMonth());
            // 判断对应特殊合约是否已存在，存在删除，不存在跳过
            if (specialMarginService.get(filter) != null) {
                specialMarginService.delete(specialMarginService.get(filter).getId());
            } else {
                continue;
            }
            // 特殊合约有增改，更新对应标准合约的修改时间
            SearchFilter marginFilter = new SearchFilter("contractCode", SearchFilter.Operator.EQ,
                    contractCode);
            Margin margin = marginService.get(marginFilter);
            margin.setModifyTime(new Date());
            marginService.update(margin);
        }

        return Rets.success();
    }
}