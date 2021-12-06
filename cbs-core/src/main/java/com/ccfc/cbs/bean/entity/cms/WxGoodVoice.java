package com.ccfc.cbs.bean.entity.cms;

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
 * @date 2021-08-31 16:02
 */
@Entity(name = "t_cms_wxgoodvoice")
@Table(appliesTo = "t_cms_wxgoodvoice", comment = "微官网中原好声音")
@Data
@EntityListeners(AuditingEntityListener.class)
public class WxGoodVoice extends BaseEntity {
    @Column(columnDefinition = "VARCHAR(128) COMMENT '标题'")
    @NotBlank(message = "标题不能为空")
    private String title;

    @Column(columnDefinition = "VARCHAR(512) COMMENT '点击图标跳转到url'")
    private String url;

    @Column(columnDefinition = "BIGINT COMMENT '好声音图id'")
    private Long idFile;

    @Column(name = "is_display", columnDefinition = "TINYINT COMMENT '是否显示'")
    private Boolean isDisplay;
}
