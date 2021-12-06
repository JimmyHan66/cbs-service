package com.ccfc.cbs.bean.entity.publicity;

import com.ccfc.cbs.bean.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.annotations.Table;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.validation.constraints.NotBlank;
import java.math.BigDecimal;
import java.util.Comparator;

/**
 * 保证金公示信息
 *
 * @author shibl
 * @date 2020/11/9 14:39
 */
@EqualsAndHashCode(callSuper = true)
@Entity(name = "t_publicity_margin")
@Table(appliesTo = "t_publicity_margin", comment = "保证金公示信息")
@Data
@EntityListeners(AuditingEntityListener.class)
public class Margin extends BaseEntity {
    @Column(name = "contract_code", columnDefinition = "VARCHAR(16) COMMENT '合约代码'")
    @NotBlank(message = "合约代码不能为空")
    private String contractCode;
    @Column(name = "contract_name", columnDefinition = "VARCHAR(16) COMMENT '合约名称'")
    @NotBlank(message = "合约名称不能为空")
    private String contractName;
    @Column(name = "market_no", columnDefinition = "INT COMMENT '交易所'")
    private Integer marketNo;
    @Column(name = "multiplier", columnDefinition = "DECIMAL(10,4) COMMENT '合约乘数'")
    private BigDecimal multiplier;
    @Column(name = "multiplier_unit", columnDefinition = "VARCHAR(16) COMMENT '合约乘数单位'")
    private String multiplierUnit;
    @Column(name = "last_price", columnDefinition = "DECIMAL(10,4) COMMENT '最新价'")
    private BigDecimal lastPrice;
    @Column(name = "price_unit", columnDefinition = "VARCHAR(16) COMMENT '价格单位'")
    private String priceUnit;
    @Column(name = "min_change_price", columnDefinition = "DECIMAL(10,4) COMMENT '最小变动价位'")
    private BigDecimal minChangePrice;
    @Column(name = "exchange_margin", columnDefinition = "DECIMAL(10,4) COMMENT '交易所保证金比例'")
    private BigDecimal exchangeMargin;
    @Column(name = "company_margin", columnDefinition = "DECIMAL(10,4) COMMENT '公司保证金比例'")
    private BigDecimal companyMargin;
    @Column(name = "quote_change", columnDefinition = "DECIMAL(10,4) COMMENT '涨跌幅比例'")
    private BigDecimal quoteChange;
    @Column(name = "remark", columnDefinition = "VARCHAR(1024) COMMENT '备注'")
    private String remark;

    // 排序规则
    public static class Comparators {
        // 根据市场进行排序
        public static Comparator<Margin> MARKETNO = new Comparator<Margin>() {
            @Override
            public int compare(Margin m1, Margin m2) {
                return m1.marketNo.compareTo(m2.marketNo);
            }
        };
    }
}
