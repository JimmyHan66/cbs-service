package com.ccfc.cbs.service.game;

import com.ccfc.cbs.bean.entity.game.*;
import com.ccfc.cbs.bean.enumeration.ConfigKeyEnum;
import com.ccfc.cbs.bean.vo.query.SearchFilter;
import com.ccfc.cbs.cache.ConfigCache;
import com.ccfc.cbs.utils.DateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.List;

/**
 * @author shibl
 * @date 2021-06-01 9:10
 */
@Component
public class ImportCalDataService {
    private final Logger logger = LoggerFactory.getLogger(getClass());
    private static final String COMPANY_NO = "0199";

    @Autowired
    private ContestantService contestantService;
    @Autowired
    private ConfigCache configCache;
    @Autowired
    private CusfundService cusfundService;
    @Autowired
    private FundchgService fundchgService;
    @Autowired
    private TrddataService trddataService;
    @Autowired
    private RankDayService rankDayService;

    /**
     * 读取结算文件导入数据库
     *
     * @param date
     */
    public void importAllTxt(String date) {
        // 前台传入的日期格式为yyyy-MM-dd，需要转换为yyyyMMdd
        date = date.replace("-", "");
        // 仅查询有效的报名信息
        SearchFilter filter = new SearchFilter("isValid", SearchFilter.Operator.EQ, true);
        List<Contestant> contestantList = contestantService.queryAll(filter);

        String path = configCache.get(ConfigKeyEnum.SYSTEM_FILE_UPLOAD_PATH) + "game/" + date + "/" + COMPANY_NO + "/";
        // 例："/data/app/web-flash/runtime/upload/game/20210331/0199/890000004/"
        for (Contestant contestant : contestantList) {
            String fileDir = path + contestant.getFundAccount() + "/";
            File folder = new File(fileDir);
            if (!folder.exists() && !folder.isDirectory()) {
                logger.warn("不存在资金账号 " + contestant.getFundAccount() + " 的结算文件目录!");
            } else {
                // 读取客户期货期权账户基本资金文件 XXXXcusfund+日期.txt
                File cusfundFile = new File(fileDir + COMPANY_NO + "cusfund" + date + ".txt");
                this.importCusfund(cusfundFile, contestant.getFundAccount());

                // 读取客户出入金记录文件 XXXXfundchg+日期.txt
                File fundchgFile = new File(fileDir + COMPANY_NO + "fundchg" + date + ".txt");
                this.importFundchg(fundchgFile, contestant.getFundAccount());

                // 读取客户期货成交明细文件 XXXXtrddata+日期.txt
                File trddataFile = new File(fileDir + COMPANY_NO + "trddata" + date + ".txt");
                this.importTrddata(trddataFile, contestant.getFundAccount());
            }
        }

        logger.info("实盘大赛结算数据导入完成！");
    }

    /**
     * 读取客户期货期权账户基本资金文件导入数据库
     *
     * @param cusfundFile
     * @param fundAccount
     */
    public void importCusfund(File cusfundFile, String fundAccount) {
        if (cusfundFile.exists() && cusfundFile.isFile()) {
            try {
                BufferedReader input = new BufferedReader(new FileReader(cusfundFile));
                String line;
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                while ((line = input.readLine()) != null) {
                    String[] temp = line.split("@");
                    Cusfund cusfund = new Cusfund();
                    cusfund.setDate(sdf.parse(temp[0]));
                    cusfund.setFundAccount(temp[1]);
                    cusfund.setEquityTotal(new BigDecimal(temp[2]));
                    cusfund.setEnableBalance(new BigDecimal(temp[3]));
                    cusfund.setNeedMargin(new BigDecimal(temp[4]));
                    cusfund.setRiskRate(new BigDecimal(temp[5]));
                    cusfund.setLastdayBalanceZrds(new BigDecimal(temp[6]));
                    cusfund.setLastdayBalanceZbdc(new BigDecimal(temp[7]));
                    cusfund.setTodayBalanceZrds(new BigDecimal(temp[8]));
                    cusfund.setTodayBalanceZbdc(new BigDecimal(temp[9]));
                    cusfund.setTodayProfitZrds(new BigDecimal(temp[10]));
                    cusfund.setTodayProfitZbdc(new BigDecimal(temp[11]));
                    cusfund.setFloatProfitZbdc(new BigDecimal(temp[12]));
                    cusfund.setNonMonetaryOffset(new BigDecimal(temp[13]));
                    cusfund.setIsTradingMember(temp[14]);
                    cusfund.setCurrency(temp[15]);
                    cusfund.setActualMonetaryFunds(new BigDecimal(temp[16]));
                    cusfund.setOtherPledegBalance(new BigDecimal(temp[17]));
                    cusfund.setMonetaryPledgeMargin(new BigDecimal(temp[18]));
                    cusfund.setTodayRightBalance(new BigDecimal(temp[19]));
                    cusfund.setFrozenBalance(new BigDecimal(temp[20]));

                    cusfundService.insert(cusfund);
                }
            } catch (IOException | ParseException e) {
                e.printStackTrace();
                logger.warn("读取资金账号 " + fundAccount + " 的cusfund结算文件失败!");
            }
        } else {
            logger.warn("不存在资金账号 " + fundAccount + " 的cusfund结算文件!");
        }
    }

    /**
     * 读取客户出入金记录文件导入数据库
     *
     * @param fundchgFile
     * @param fundAccount
     */
    public void importFundchg(File fundchgFile, String fundAccount) {
        if (fundchgFile.exists() && fundchgFile.isFile()) {
            try {
                BufferedReader input = new BufferedReader(new FileReader(fundchgFile));
                String line;
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                while ((line = input.readLine()) != null) {
                    String[] temp = line.split("@");
                    Fundchg fundchg = new Fundchg();
                    fundchg.setDate(sdf.parse(temp[0]));
                    fundchg.setFundAccount(temp[1]);
                    fundchg.setInoutBalance(new BigDecimal(temp[2]));
                    fundchg.setSettleAccountFlag(temp[3]);
                    fundchg.setSettleAccount(temp[4]);
                    fundchg.setCompanyMarginAccountFlag(temp[5]);
                    fundchg.setCompanyMarginAccount(temp[6]);
                    fundchg.setRemark(temp[7]);
                    fundchg.setIsTradingMember(temp[8]);
                    fundchg.setCurrency(temp[9]);
                    fundchg.setInoutType(temp[10]);
                    fundchg.setInoutDate(sdf.parse(temp[11]));

                    fundchgService.insert(fundchg);
                }
            } catch (IOException | ParseException e) {
                e.printStackTrace();
                logger.warn("读取资金账号 " + fundAccount + " 的fundchg结算文件失败!");
            }
        } else {
            logger.warn("不存在资金账号 " + fundAccount + " 的fundchg结算文件!");
        }
    }

    /**
     * 读取客户期货成交明细文件导入数据库
     *
     * @param trddataFile
     * @param fundAccount
     */
    public void importTrddata(File trddataFile, String fundAccount) {
        if (trddataFile.exists() && trddataFile.isFile()) {
            try {
                BufferedReader input = new BufferedReader(new FileReader(trddataFile));
                String line;
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                while ((line = input.readLine()) != null) {
                    String[] temp = line.split("@");
                    Trddata trddata = new Trddata();
                    trddata.setDate(sdf.parse(temp[0]));
                    trddata.setFundAccount(temp[1]);
                    trddata.setDealNo(temp[2]);
                    trddata.setContract(temp[3]);
                    trddata.setTradeFlag(temp[4]);
                    trddata.setDealAmount(new BigDecimal(temp[5]));
                    trddata.setDealPrice(new BigDecimal(temp[6]));
                    trddata.setDealBalance(new BigDecimal(temp[7]));
                    trddata.setDealTime(temp[8]);
                    trddata.setPositionFlag(temp[9]);
                    trddata.setSpeculateFlag(temp[10]);
                    trddata.setLiquidProfitZrds(new BigDecimal(temp[11]));
                    trddata.setLiquidProfitZbdc(new BigDecimal(temp[12]));
                    trddata.setFee(new BigDecimal(temp[13]));
                    trddata.setTradeCode(temp[14]);
                    trddata.setMarketFlag(temp[15]);
                    trddata.setIsTradingMember(temp[16]);
                    trddata.setReportCode(temp[17]);
                    trddata.setSeatCode(temp[18]);
                    trddata.setCurrency(temp[19]);
                    trddata.setDealDate(sdf.parse(temp[20]));

                    trddataService.insert(trddata);
                }
            } catch (IOException | ParseException e) {
                e.printStackTrace();
                logger.warn("读取资金账号 " + fundAccount + " 的tradata结算文件失败!");
            }
        } else {
            logger.warn("不存在资金账号 " + fundAccount + " 的tradata结算文件!");
        }
    }

    public void calRankDay(String date) {
        // 仅查询有效的报名信息
        SearchFilter filter = new SearchFilter("isValid", SearchFilter.Operator.EQ, true);
        List<Contestant> contestantList = contestantService.queryAll(filter);

        for (Contestant contestant : contestantList) {

            try {
                RankDay rankDay = new RankDay();
                rankDay.setDate(DateUtil.parseDate(date));
                rankDay.setFundAccount(contestant.getFundAccount());
                rankDay.setContestantNickname(contestant.getContestantNickname() == null ? "" : contestant.getContestantNickname());
                rankDay.setTeacher(contestant.getTeacher() == null ? "" : contestant.getTeacher());
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

        logger.info("实盘大赛结算数据计算完成！");
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
                grade = rankDay.getMaxPrincipalRate().divide(maxRate, 4, RoundingMode.HALF_UP)
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
