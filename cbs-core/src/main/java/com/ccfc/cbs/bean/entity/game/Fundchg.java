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
 * 客户出入金类
 *
 * @author shibl
 * @date 2021-03-12 15:26
 */
@EqualsAndHashCode(callSuper = true)
@Entity(name = "t_game_fundchg")
@Table(appliesTo = "t_game_fundchg", comment = "客户出入金记录表")
@Data
@EntityListeners(AuditingEntityListener.class)
public class Fundchg extends BaseEntity {
    @Column(name = "date", columnDefinition = "DATE COMMENT '日期'")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;
    @Column(name = "fund_account", columnDefinition = "VARCHAR(32) COMMENT '资金账号'")
    private String fundAccount;
    @Column(name = "inout_balance", columnDefinition = "DECIMAL(20,3) COMMENT '出入金额'")
    private BigDecimal inoutBalance;
    @Column(name = "settle_account_flag", columnDefinition = "VARCHAR(2) COMMENT '客户结算账户标识'")
    private String settleAccountFlag;
    @Column(name = "settle_account", columnDefinition = "VARCHAR(32) COMMENT '客户结算账户'")
    private String settleAccount;
    @Column(name = "company_margin_account_flag", columnDefinition = "VARCHAR(2) COMMENT '公司保证金专用账户标识'")
    private String companyMarginAccountFlag;
    @Column(name = "company_margin_account", columnDefinition = "VARCHAR(32) COMMENT '公司保证金专用账户'")
    private String companyMarginAccount;
    @Column(name = "remark", columnDefinition = "VARCHAR(258) COMMENT '备注'")
    private String remark;
    @Column(name = "is_trading_member", columnDefinition = "CHAR COMMENT '是否为交易会员'")
    private String isTradingMember;
    @Column(name = "currency", columnDefinition = "VARCHAR(3) COMMENT '币种'")
    private String currency;
    @Column(name = "inout_type", columnDefinition = "CHAR COMMENT '出入金类型'")
    private String inoutType;
    @Column(name = "inout_date", columnDefinition = "DATE COMMENT '出入金发生日期'")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date inoutDate;
}
