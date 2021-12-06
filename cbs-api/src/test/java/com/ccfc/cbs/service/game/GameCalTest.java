package com.ccfc.cbs.service.game;

import com.ccfc.cbs.BaseApplicationStartTest;
import com.ccfc.cbs.bean.entity.game.Contestant;
import com.ccfc.cbs.bean.entity.game.Cusfund;
import com.ccfc.cbs.bean.entity.game.Fundchg;
import com.ccfc.cbs.bean.entity.game.RankDay;
import com.ccfc.cbs.bean.vo.query.SearchFilter;
import com.ccfc.cbs.utils.DateUtil;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.ParseException;
import java.util.Comparator;
import java.util.List;

/**
 * @author shibl
 * @date 2021-04-21 11:04
 */
public class GameCalTest extends BaseApplicationStartTest {

    private final Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private ContestantService contestantService;
    @Autowired
    private CusfundService cusfundService;
    @Autowired
    private FundchgService fundchgService;
    @Autowired
    private TrddataService trddataService;
    @Autowired
    private RankDayService rankDayService;

    @Test
    public void calRankDayTest() throws ParseException {

        String date = "2021-04-26";

        // 仅查询有效的报名信息
        SearchFilter filter = new SearchFilter("isValid", SearchFilter.Operator.EQ, true);
        List<Contestant> contestantList = contestantService.queryAll(filter);

        for (Contestant contestant : contestantList) {

            try {
                RankDay rankDay = new RankDay();
                rankDay.setDate(DateUtil.parseDate(date));
                rankDay.setFundAccount(contestant.getFundAccount());
                rankDay.setContestantNickname(contestant.getContestantNickname());
                // 计算近30日日均权益
                BigDecimal equityAvg = cusfundService.getAvgEquity(contestant.getFundAccount());
                if (equityAvg == null) {
                    // 还未有该客户的结算数据，跳过
                    continue;
                }
                rankDay.setEquityAvg(equityAvg);
                logger.info("资金账号" + contestant.getFundAccount() + "的日均权益：" + equityAvg.toString());
                // 近30日日均权益小于100W的，组别设置为轻量组，反之大于等于100W的，组别设置为重量组
                if (equityAvg.compareTo(BigDecimal.valueOf(1000000)) < 0) {
                    rankDay.setGroupType(1);
                } else {
                    rankDay.setGroupType(2);
                }
                logger.info("资金账号" + contestant.getFundAccount() + "的组别：" + rankDay.getGroupType());
                // 获取最新的客户期货期权账户基本资金记录
                Cusfund cusfund = cusfundService.getOneByDate(date, contestant.getFundAccount());
                rankDay.setEquityTotal(cusfund.getEquityTotal());
                logger.info("资金账号" + contestant.getFundAccount() + "的资金权益总额：" + rankDay.getEquityTotal());
                // 获取最大投入本金的计算基础值
                BigDecimal todayInoutBalance = BigDecimal.ZERO;
                BigDecimal maxPutBalance = BigDecimal.ZERO;
                BigDecimal todayCumulativeProfit = BigDecimal.ZERO;
                RankDay rankDayTemp = rankDayService.getOneByLastDate(date, contestant.getFundAccount());
                if (rankDayTemp == null) {
                    todayInoutBalance = cusfund.getLastdayBalanceZrds();
                    maxPutBalance = cusfund.getLastdayBalanceZrds();
                } else {
                    todayInoutBalance = rankDayTemp.getTodayInoutBalance();
                    maxPutBalance = rankDayTemp.getMaxPutBalance();
                    todayCumulativeProfit = rankDayTemp.getTodayCumulativeProfit();
                }
                // 获取最新的客户出入金记录
                List<Fundchg> fundchgList = fundchgService.queryAllByDate(date, contestant.getFundAccount());
                // 每次加减后的结果与之前的最大投入本金进行比较，如计算结果大，将新值作为新的最大投入本金，反之不更新
                if (fundchgList != null && !fundchgList.isEmpty()) {
                    for (Fundchg fundchg : fundchgList) {
                        todayInoutBalance = todayInoutBalance.add(fundchg.getInoutBalance());
                        if (todayInoutBalance.compareTo(maxPutBalance) > 0) {
                            maxPutBalance = todayInoutBalance;
                        }
                    }
                }
                rankDay.setTodayInoutBalance(todayInoutBalance);
                rankDay.setMaxPutBalance(maxPutBalance);
                logger.info("资金账号" + contestant.getFundAccount() + "的当日累计出入金：" + rankDay.getTodayInoutBalance());
                logger.info("资金账号" + contestant.getFundAccount() + "的最大投入本金：" + rankDay.getMaxPutBalance());

                // 获取当日资金账号的总盈亏和总手续费
                BigDecimal totalProfit = trddataService.getCumulativeProfit(date, contestant.getFundAccount());
                BigDecimal totalFee = trddataService.getTotalFee(date, contestant.getFundAccount());
                // 当日累计净利润=上一日的累计净利润+当日总盈亏-当日手续费总额
                todayCumulativeProfit = todayCumulativeProfit.add(totalProfit).subtract(totalFee);
                rankDay.setTodayCumulativeProfit(todayCumulativeProfit);
                rankDay.setTodayFeeTotal(totalFee);
                logger.info("资金账号" + contestant.getFundAccount() + "当日累计利润：" + rankDay.getTodayCumulativeProfit());
                logger.info("资金账号" + contestant.getFundAccount() + "当日手续费总额：" + rankDay.getTodayFeeTotal());
                // 计算最大本金收益率
                BigDecimal maxPrincipalRate = BigDecimal.ZERO;
                if (maxPutBalance.compareTo(BigDecimal.ZERO) > 0) {
                    maxPrincipalRate = todayCumulativeProfit.divide(maxPutBalance, 4, RoundingMode.HALF_UP)
                            .multiply(BigDecimal.valueOf(100));
                }
                rankDay.setMaxPrincipalRate(maxPrincipalRate);
                logger.info("资金账号" + contestant.getFundAccount() + "最大本金收益率：" + rankDay.getMaxPrincipalRate());

                // 初始化得分为0
                rankDay.setMaxPrincipalRateGrade(BigDecimal.ZERO);

                if (rankDayService.getOneByDate(date, contestant.getFundAccount()) == null) {
                    rankDayService.insert(rankDay);
                } else {
                    rankDayService.update(rankDay);
                }
            } catch (Exception e) {
                e.getStackTrace();
                logger.warn(e.getMessage());
            }
        }

        // 分别计算轻量组和重量组的得分和排名
        this.calGroupRank(date, 1);
        this.calGroupRank(date, 2);
    }

    /**
     * 根据日期和组别分组计算最大本金收益率得分和组内排名
     *
     * @param date
     * @param groupType
     */
    private void calGroupRank(String date, Integer groupType) {
        /* 取今日最大的本金收益率
           计算最大本金收益率得分，账户最大本金收益率/该组所有账户中最高的最大本金收益率*100
           净利润小于等于0，最大本金收益率得分为0
         */
        BigDecimal maxRate = rankDayService.getMaxPrincipalRate(date, groupType);
        List<RankDay> rankDayList = rankDayService.queryByDateGroup(date, groupType);
        for (RankDay rankDay : rankDayList) {
            BigDecimal grade = BigDecimal.ZERO;
            if (rankDay.getMaxPrincipalRate().compareTo(BigDecimal.ZERO) > 0) {
                grade = rankDay.getMaxPrincipalRate().divide(maxRate,4,RoundingMode.HALF_UP)
                        .multiply(BigDecimal.valueOf(100));
            }
            rankDay.setMaxPrincipalRateGrade(grade);
        }
        // 根据RankDay对象的maxPrincipalRateGrade字段降序排序
        int i = 0;
        Integer rank = 0;
        rankDayList.sort(Comparator.comparing(RankDay::getMaxPrincipalRateGrade).reversed());
        /* 计算更新排名，同分同排名，下一位跳过
           如：两个第二名，下一个人即为第四名
         */
        BigDecimal lastGrade = BigDecimal.ZERO;
        for (RankDay rankDay : rankDayList) {
            if (lastGrade.compareTo(rankDay.getMaxPrincipalRateGrade()) == 0) {
                i++;
                rankDay.setRankDay(rank);
            } else {
                i++;
                rank = i;
                rankDay.setRankDay(rank);
            }
            lastGrade = rankDay.getMaxPrincipalRateGrade();

            rankDayService.update(rankDay);
        }
    }
}
