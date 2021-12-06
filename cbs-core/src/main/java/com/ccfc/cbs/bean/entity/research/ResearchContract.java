package com.ccfc.cbs.bean.entity.research;

import com.ccfc.cbs.bean.entity.BaseEntity;
import lombok.Data;
import org.hibernate.annotations.Table;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.validation.constraints.NotBlank;

/**
 * @author shibl
 * @date 2021-11-22 15:02
 */

@Entity(name = "t_research_researchcontract")
@Table(appliesTo = "t_research_researchcontract", comment = "研究品种表")
@Data
@EntityListeners(AuditingEntityListener.class)
public class ResearchContract extends BaseEntity {
    @Column(name = "contract_code", columnDefinition = "VARCHAR(16) COMMENT '合约代码'")
    @NotBlank(message = "合约代码不能为空")
    private String contractCode;
    @Column(name = "contract_name", columnDefinition = "VARCHAR(16) COMMENT '合约名称'")
    @NotBlank(message = "合约名称不能为空")
    private String contractName;
    @Column(name = "market_no", columnDefinition = "INT COMMENT '交易所'")
    private Integer marketNo;
    @Column(name = "table_name_en", columnDefinition = "VARCHAR(64) COMMENT '表英文名'")
    private String tableNameEn;
    @Column(name = "table_name_ch", columnDefinition = "VARCHAR(64) COMMENT '表中文名'")
    private String tableNameCh;
    @Column(name = "is_show", columnDefinition = "TINYINT COMMENT '是否显示'")
    private Boolean isShow;
    @Column(name = "table_display", columnDefinition = "VARCHAR(64) COMMENT '图表化方式'")
    private String tableDisplay;
}
