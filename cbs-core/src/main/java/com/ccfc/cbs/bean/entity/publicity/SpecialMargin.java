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

/**
 * 特殊保证金公示信息
 *
 * @author shibl
 * @date 2020/11/24 14:39
 */
@EqualsAndHashCode(callSuper = true)
@Entity(name = "t_publicity_specialmargin")
@Table(appliesTo = "t_publicity_specialmargin", comment = "特殊保证金公示信息")
@Data
@EntityListeners(AuditingEntityListener.class)
public class SpecialMargin extends BaseEntity {
    @Column(name = "contract_code", columnDefinition = "VARCHAR(16) COMMENT '标准合约代码'")
    @NotBlank(message = "标准合约代码不能为空")
    private String contractCode;
    @Column(name = "special_contract_code", columnDefinition = "VARCHAR(256) COMMENT '特殊合约代码'")
    private String specialContractCode;
    @Column(name = "exchange_margin", columnDefinition = "DECIMAL(10,4) COMMENT '特殊合约交易所保证金比例'")
    private BigDecimal exchangeMargin;
    @Column(name = "company_margin", columnDefinition = "DECIMAL(10,4) COMMENT '特殊合约公司保证金比例'")
    private BigDecimal companyMargin;
    @Column(name = "quote_change", columnDefinition = "DECIMAL(10,4) COMMENT '特殊合约涨跌幅比例'")
    private BigDecimal quoteChange;
    @Column(name = "remark", columnDefinition = "VARCHAR(1024) COMMENT '特殊合约备注'")
    private String remark;
}
