package com.ccfc.cbs.bean.entity.game;

import com.ccfc.cbs.bean.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.annotations.Table;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.validation.constraints.NotBlank;

/**
 * 结算数据导入信息类
 *
 * @author shibl
 * @date 2021-03-10 10:38
 */
@EqualsAndHashCode(callSuper = true)
@Entity(name = "t_game_importinfo")
@Table(appliesTo = "t_game_importinfo", comment = "结算数据导入信息表")
@Data
@EntityListeners(AuditingEntityListener.class)
public class ImportInfo extends BaseEntity {
    @Column(name = "file_name", columnDefinition = "VARCHAR(64) COMMENT '文件名'")
    @NotBlank(message = "文件名不能为空")
    private String fileName;
    @Column(name = "real_file_name", columnDefinition = "VARCHAR(128) COMMENT '真实文件名'")
    @NotBlank(message = "真实文件名不能为空")
    private String realFileName;
    @Column(name = "file_status", columnDefinition = "VARCHAR(16) COMMENT '文件状态'")
    private String fileStatus;
}
