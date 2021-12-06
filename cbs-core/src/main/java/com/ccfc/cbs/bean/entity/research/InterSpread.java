package com.ccfc.cbs.bean.entity.research;

import com.ccfc.cbs.bean.entity.BaseEntity;
import lombok.Data;
import org.hibernate.annotations.Table;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.validation.constraints.NotBlank;
import java.math.BigDecimal;

/**
 * @author shibl
 * @date 2021-11-24 11:12
 */

@Entity(name = "t_research_interspread")
@Table(appliesTo = "t_research_interspread", comment = "跨期价差表")
@Data
@EntityListeners(AuditingEntityListener.class)
public class InterSpread extends BaseEntity {
    @Column(name = "contract_code", columnDefinition = "VARCHAR(16) COMMENT '合约代码'")
    @NotBlank(message = "合约代码不能为空")
    private String contractCode;
    @Column(name = "contract_name", columnDefinition = "VARCHAR(16) COMMENT '合约名称'")
    @NotBlank(message = "合约名称不能为空")
    private String contractName;
    @Column(name = "business_date", columnDefinition = "VARCHAR(16) COMMENT '业务日期'")
    private String businessDate;
    @Column(name = "m_1701_1705", columnDefinition = "DECIMAL(10,2) COMMENT '1701-1705'")
    private BigDecimal m17011705;
    @Column(name = "m_1801_1805", columnDefinition = "DECIMAL(10,2) COMMENT '1801-1805'")
    private BigDecimal m18011805;
    @Column(name = "m_1901_1905", columnDefinition = "DECIMAL(10,2) COMMENT '1901-1905'")
    private BigDecimal m19011905;
    @Column(name = "m_2001_2005", columnDefinition = "DECIMAL(10,2) COMMENT '2001-2005'")
    private BigDecimal m20012005;
    @Column(name = "m_2101_2105", columnDefinition = "DECIMAL(10,2) COMMENT '2101-2105'")
    private BigDecimal m21012105;
    @Column(name = "m_2201_2205", columnDefinition = "DECIMAL(10,2) COMMENT '2201-2205'")
    private BigDecimal m22012205;
}
