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
 * @date 2021-11-24 10:17
 */

@Entity(name = "t_research_hisbasis")
@Table(appliesTo = "t_research_hisbasis", comment = "历史基差表")
@Data
@EntityListeners(AuditingEntityListener.class)
public class HisBasis extends BaseEntity {
    @Column(name = "contract_code", columnDefinition = "VARCHAR(16) COMMENT '合约代码'")
    @NotBlank(message = "合约代码不能为空")
    private String contractCode;
    @Column(name = "contract_name", columnDefinition = "VARCHAR(16) COMMENT '合约名称'")
    @NotBlank(message = "合约名称不能为空")
    private String contractName;
    @Column(name = "business_date", columnDefinition = "VARCHAR(16) COMMENT '业务日期'")
    private String businessDate;
    @Column(name = "y_2016", columnDefinition = "DECIMAL(10,2) COMMENT '2016年'")
    private BigDecimal y2016;
    @Column(name = "y_2017", columnDefinition = "DECIMAL(10,2) COMMENT '2017年'")
    private BigDecimal y2017;
    @Column(name = "y_2018", columnDefinition = "DECIMAL(10,2) COMMENT '2018年'")
    private BigDecimal y2018;
    @Column(name = "y_2019", columnDefinition = "DECIMAL(10,2) COMMENT '2019年'")
    private BigDecimal y2019;
    @Column(name = "y_2020", columnDefinition = "DECIMAL(10,2) COMMENT '2020年'")
    private BigDecimal y2020;
    @Column(name = "y_2021", columnDefinition = "DECIMAL(10,2) COMMENT '2021年'")
    private BigDecimal y2021;
}
