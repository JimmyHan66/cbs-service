package com.ccfc.cbs.bean.entity.research;

import com.ccfc.cbs.bean.entity.BaseEntity;
import lombok.Data;
import org.hibernate.annotations.Table;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;

/**
 * @author shibl
 * @date 2021-11-22 15:15
 */

@Entity(name = "t_research_contractfield")
@Table(appliesTo = "t_research_contractfield", comment = "研究品种列表")
@Data
@EntityListeners(AuditingEntityListener.class)
public class ReContractField extends BaseEntity {
    @Column(name = "table_name_en", columnDefinition = "VARCHAR(64) COMMENT '表英文名'")
    private String tableNameEn;
    @Column(name = "table_field", columnDefinition = "VARCHAR(64) COMMENT '列英文名'")
    private String tableField;
    @Column(name = "table_field_db", columnDefinition = "VARCHAR(64) COMMENT '列数据库名'")
    private String tableFieldDb;
    @Column(name = "table_field_name", columnDefinition = "VARCHAR(64) COMMENT '列中文名'")
    private String tableFieldName;
    @Column(name = "field_order", columnDefinition = "INT COMMENT '列顺序'")
    private Integer fieldOrder;
    @Column(name = "is_show", columnDefinition = "TINYINT COMMENT '是否显示'")
    private Boolean isShow;
}
