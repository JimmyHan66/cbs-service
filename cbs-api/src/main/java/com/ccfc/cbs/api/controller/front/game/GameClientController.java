package com.ccfc.cbs.api.controller.front.game;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.constant.factory.PageFactory;
import com.ccfc.cbs.bean.core.BussinessLog;
import com.ccfc.cbs.bean.entity.game.Contestant;
import com.ccfc.cbs.bean.entity.game.RankDay;
import com.ccfc.cbs.bean.vo.front.Rets;
import com.ccfc.cbs.bean.vo.query.SearchFilter;
import com.ccfc.cbs.service.game.ContestantService;
import com.ccfc.cbs.service.game.RankDayService;
import com.ccfc.cbs.utils.BeanUtil;
import com.ccfc.cbs.utils.factory.Page;
import com.ccfc.cbs.warpper.GameClientWarpper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * 实盘大赛前台服务端
 *
 * @author shibl
 * @date 2021-02-24 10:39
 */
@RestController
@RequestMapping("/offcialsite/gameClient")
public class GameClientController extends BaseController {
    @Autowired
    private ContestantService contestantService;
    @Autowired
    private RankDayService rankDayService;

    @RequestMapping(value = "/signUp", method = RequestMethod.POST)
    @BussinessLog(value = "实盘大赛报名", key = "name")
    public Object save(@ModelAttribute Contestant tContestant) {
        // 默认报名数据有效
        tContestant.setIsValid(true);
        // 根据资金账号查找是否已有报名信息，如果没有则插入，反之报错返回
        SearchFilter filter = new SearchFilter("fundAccount", SearchFilter.Operator.EQ,
                tContestant.getFundAccount());
        Contestant result = contestantService.get(filter);
        if (result == null) {
            contestantService.insert(tContestant);
        } else {
            return Rets.failure("您已报名成功，无需重复报名！");
        }
        return Rets.success();
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public Object list(@RequestParam() Integer groupType,
                       @RequestParam(required = false) String fundAccount,
                       @RequestParam(required = false) String contestantNickname) {

        // 取排行表中的最大日期
        Date maxDate = rankDayService.getMaxDate();
        Page<RankDay> page = new PageFactory<RankDay>().defaultPage();
        page.addFilter("date", maxDate);
        page.addFilter("groupType", groupType);
        page.addFilter("fundAccount", fundAccount);
        page.addFilter("contestantNickname", SearchFilter.Operator.LIKE, contestantNickname);
        page.setSort(Sort.by(Sort.Direction.ASC, "rankDay"));

        page = rankDayService.queryPage(page);
        // 包装类转义
        List list = (List) new GameClientWarpper(BeanUtil.objectsToMaps(page.getRecords())).warp();
        page.setRecords(list);

        return Rets.success(page);
    }

    @RequestMapping(value = "/getRankList", method = RequestMethod.GET)
    public Object getRankList(@Param("fundAccount") String fundAccount,
                              @Param("size") Integer size) {
        SearchFilter filter = new SearchFilter("fundAccount", SearchFilter.Operator.EQ, fundAccount);
        List<RankDay> rankDayList = rankDayService.queryAll(filter, Sort.by(Sort.Direction.DESC, "date"));
        if (size != null && rankDayList.size() > size) {
            // 截取最新的size条数据
            rankDayList = rankDayList.subList(0, size);
        }

        return Rets.success(rankDayList);
    }
}
