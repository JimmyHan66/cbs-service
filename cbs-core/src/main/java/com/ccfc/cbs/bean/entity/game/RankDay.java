package com.ccfc.cbs.bean.entity.game;

import com.ccfc.cbs.bean.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.annotations.Table;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 实盘大赛排名日榜
 *
 * @author shibl
 * @date 2021-03-11 10:10
 */
@EqualsAndHashCode(callSuper = true)
@Entity(name = "t_game_rankday")
@Table(appliesTo = "t_game_rankday", comment = "实盘大赛排名日榜")
@Data
@EntityListeners(AuditingEntityListener.class)
public class RankDay extends BaseEntity {
    @Column(name = "date", columnDefinition = "DATE COMMENT '日期'")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;
    @Column(name = "fund_account", columnDefinition = "VARCHAR(32) COMMENT '资金账号'")
    private String fundAccount;
    @Column(name = "contestant_nickname", columnDefinition = "VARCHAR(32) COMMENT '昵称'")
    private String contestantNickname;
    @Column(name = "teacher", columnDefinition = "VARCHAR(32) COMMENT '指导老师'")
    private String teacher;
    @Column(name = "equity_total", columnDefinition = "DECIMAL(20,3) COMMENT '资金权益总额'")
    private BigDecimal equityTotal;
    @Column(name = "equity_avg", columnDefinition = "DECIMAL(20,3) COMMENT '日均权益'")
    private BigDecimal equityAvg;
    @Column(name = "group_type", columnDefinition = "INT COMMENT '组别'")
    private Integer groupType;
    @Column(name = "today_inout_balance", columnDefinition = "DECIMAL(20,3) COMMENT '当日累计出入金'")
    private BigDecimal todayInoutBalance;
    @Column(name = "max_put_balance", columnDefinition = "DECIMAL(20,3) COMMENT '最大投入本金'")
    private BigDecimal maxPutBalance;
    @Column(name = "today_cumulative_profit", columnDefinition = "DECIMAL(20,3) COMMENT '当日累计利润'")
    private BigDecimal todayCumulativeProfit;
    @Column(name = "today_fee_total", columnDefinition = "DECIMAL(20,3) COMMENT '当日手续费总额'")
    private BigDecimal todayFeeTotal;
    @Column(name = "max_principal_rate", columnDefinition = "DECIMAL(20,3) COMMENT '最大本金收益率'")
    private BigDecimal maxPrincipalRate;
    @Column(name = "max_principal_rate_grade", columnDefinition = "DECIMAL(20,3) COMMENT '最大本金收益率得分'")
    private BigDecimal maxPrincipalRateGrade;
    @Column(name = "rank_day", columnDefinition = "INT COMMENT '排名'")
    private Integer rankDay;
}
