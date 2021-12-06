package com.ccfc.cbs.bean.entity.game;

import com.ccfc.cbs.bean.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.annotations.Table;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 客户期货期权账户基本资金类
 *
 * @author shibl
 * @date 2021-03-10 11:03
 */
@EqualsAndHashCode(callSuper = true)
@Entity(name = "t_game_cusfund")
@Table(appliesTo = "t_game_cusfund", comment = "客户期货期权账户基本资金表")
@Data
@EntityListeners(AuditingEntityListener.class)
public class Cusfund extends BaseEntity {
    @Column(name = "date", columnDefinition = "DATE COMMENT '日期'")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;
    @Column(name = "fund_account", columnDefinition = "VARCHAR(32) COMMENT '资金账号'")
    private String fundAccount;
    @Column(name = "equity_total", columnDefinition = "DECIMAL(20,3) COMMENT '资金权益总额'")
    private BigDecimal equityTotal;
    @Column(name = "enable_balance", columnDefinition = "DECIMAL(20,3) COMMENT '可用资金'")
    private BigDecimal enableBalance;
    @Column(name = "need_margin", columnDefinition = "DECIMAL(20,3) COMMENT '需追加保证金'")
    private BigDecimal needMargin;
    @Column(name = "risk_rate", columnDefinition = "DECIMAL(20,3) COMMENT '风险度'")
    private BigDecimal riskRate;
    @Column(name = "lastday_balance_zrds", columnDefinition = "DECIMAL(20,3) COMMENT '上日结存(逐日盯市)'")
    private BigDecimal lastdayBalanceZrds;
    @Column(name = "lastday_balance_zbdc", columnDefinition = "DECIMAL(20,3) COMMENT '上日结存(逐笔对冲)'")
    private BigDecimal lastdayBalanceZbdc;
    @Column(name = "today_balance_zrds", columnDefinition = "DECIMAL(20,3) COMMENT '当日结存(逐日盯市)'")
    private BigDecimal todayBalanceZrds;
    @Column(name = "today_balance_zbdc", columnDefinition = "DECIMAL(20,3) COMMENT '当日结存(逐笔对冲)'")
    private BigDecimal todayBalanceZbdc;
    @Column(name = "today_profit_zrds", columnDefinition = "DECIMAL(20,3) COMMENT '当日总盈亏(逐日盯市)'")
    private BigDecimal todayProfitZrds;
    @Column(name = "today_profit_zbdc", columnDefinition = "DECIMAL(20,3) COMMENT '当日总盈亏(逐笔对冲)'")
    private BigDecimal todayProfitZbdc;
    @Column(name = "float_profit_zbdc", columnDefinition = "DECIMAL(20,3) COMMENT '浮动盈亏(逐笔对冲)'")
    private BigDecimal floatProfitZbdc;
    @Column(name = "non_monetary_offset", columnDefinition = "DECIMAL(20,3) COMMENT '非货币充抵金额'")
    private BigDecimal nonMonetaryOffset;
    @Column(name = "is_trading_member", columnDefinition = "CHAR COMMENT '是否为交易会员'")
    private String isTradingMember;
    @Column(name = "currency", columnDefinition = "VARCHAR(3) COMMENT '币种'")
    private String currency;
    @Column(name = "actual_monetary_funds", columnDefinition = "DECIMAL(20,3) COMMENT '实有货币资金'")
    private BigDecimal actualMonetaryFunds;
    @Column(name = "other_pledeg_balance", columnDefinition = "DECIMAL(20,3) COMMENT '其它货币质出金额'")
    private BigDecimal otherPledegBalance;
    @Column(name = "monetary_pledge_margin", columnDefinition = "DECIMAL(20,3) COMMENT '货币质押保证金占用'")
    private BigDecimal monetaryPledgeMargin;
    @Column(name = "today_right_balance", columnDefinition = "DECIMAL(20,3) COMMENT '当日总权利金'")
    private BigDecimal todayRightBalance;
    @Column(name = "frozen_balance", columnDefinition = "DECIMAL(20,3) COMMENT '冻结金额'")
    private BigDecimal frozenBalance;
}
