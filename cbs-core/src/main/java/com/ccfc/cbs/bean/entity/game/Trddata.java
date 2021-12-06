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
 * @author shibl
 * @date 2021-04-26 8:50
 */
@EqualsAndHashCode(callSuper = true)
@Entity(name = "t_game_trddata")
@Table(appliesTo = "t_game_trddata", comment = "期货成交明细表")
@Data
@EntityListeners(AuditingEntityListener.class)
public class Trddata extends BaseEntity {
    @Column(name = "date", columnDefinition = "DATE COMMENT '日期'")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;
    @Column(name = "fund_account", columnDefinition = "VARCHAR(32) COMMENT '资金账号'")
    private String fundAccount;
    @Column(name = "deal_no", columnDefinition = "VARCHAR(16) COMMENT '成交流水号'")
    private String dealNo;
    @Column(name = "contract", columnDefinition = "VARCHAR(30) COMMENT '品种合约'")
    private String contract;
    @Column(name = "trade_flag", columnDefinition = "CHAR COMMENT '买卖标志'")
    private String tradeFlag;
    @Column(name = "deal_amount", columnDefinition = "DECIMAL(10,0) COMMENT '成交量'")
    private BigDecimal dealAmount;
    @Column(name = "deal_price", columnDefinition = "DECIMAL(20,3) COMMENT '成交价'")
    private BigDecimal dealPrice;
    @Column(name = "deal_balance", columnDefinition = "DECIMAL(20,3) COMMENT '成交额'")
    private BigDecimal dealBalance;
    @Column(name = "deal_time", columnDefinition = "VARCHAR(30) COMMENT '成交时间'")
    private String dealTime;
    @Column(name = "position_flag", columnDefinition = "CHAR COMMENT '开平仓标志'")
    private String positionFlag;
    @Column(name = "speculate_flag", columnDefinition = "CHAR COMMENT '投机套保标志'")
    private String speculateFlag;
    @Column(name = "liquid_profit_zrds", columnDefinition = "DECIMAL(20,3) COMMENT '平仓盈亏(逐日盯市)'")
    private BigDecimal liquidProfitZrds;
    @Column(name = "liquid_profit_zbdc", columnDefinition = "DECIMAL(20,3) COMMENT '平仓盈亏(逐笔对冲)'")
    private BigDecimal liquidProfitZbdc;
    @Column(name = "fee", columnDefinition = "DECIMAL(20,3) COMMENT '手续费'")
    private BigDecimal fee;
    @Column(name = "trade_code", columnDefinition = "VARCHAR(13) COMMENT '交易编码'")
    private String tradeCode;
    @Column(name = "market_flag", columnDefinition = "CHAR COMMENT '交易所统一标识'")
    private String marketFlag;
    @Column(name = "is_trading_member", columnDefinition = "CHAR COMMENT '是否为交易会员'")
    private String isTradingMember;
    @Column(name = "report_code", columnDefinition = "VARCHAR(12) COMMENT '报单号'")
    private String reportCode;
    @Column(name = "seat_code", columnDefinition = "VARCHAR(15) COMMENT '席位号'")
    private String seatCode;
    @Column(name = "currency", columnDefinition = "VARCHAR(3) COMMENT '币种'")
    private String currency;
    @Column(name = "deal_date", columnDefinition = "DATE COMMENT '成交日期'")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dealDate;
}
