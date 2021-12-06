package com.ccfc.cbs.bean.entity.publicity;

import com.ccfc.cbs.bean.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.annotations.Table;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * @author shibl
 * @date 2021-01-27 9:24
 */
@EqualsAndHashCode(callSuper = true)
@Entity(name = "t_publicity_riskcalendar")
@Table(appliesTo = "t_publicity_riskcalendar", comment = "风控日历")
@Data
@EntityListeners(AuditingEntityListener.class)
public class RiskCalendar extends BaseEntity {
    @Column(name = "risk_date", columnDefinition = "DATE COMMENT '风险提示日期'")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @NotNull
    private Date riskDate;
    @Column(name = "month", columnDefinition = "INT COMMENT '月份'")
    private Integer month;
    @Column(name = "is_closed", columnDefinition = "TINYINT COMMENT '是否表示休假'")
    private Boolean isClosed;
    @Column(name = "is_no_night", columnDefinition = "TINYINT COMMENT '是否表示今日无夜盘'")
    private Boolean isNoNight;
    @Column(name = "is_content", columnDefinition = "TINYINT COMMENT '是否有风控提示内容'")
    private Boolean isContent;
    @Column(name = "risk_content", columnDefinition = "VARCHAR(2048) COMMENT '风险提示内容'")
    private String riskContent;
}
