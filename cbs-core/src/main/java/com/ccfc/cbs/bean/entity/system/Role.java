package com.ccfc.cbs.bean.entity.system;

import com.ccfc.cbs.bean.entity.BaseEntity;
import lombok.Data;
import org.hibernate.annotations.Table;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.validation.constraints.NotBlank;

/**
 * Created  on 2018/4/2 0002.
 *
 * @author enilu
 */
@Entity(name = "t_sys_role")
@Table(appliesTo = "t_sys_role", comment = "角色")
@Data
@EntityListeners(AuditingEntityListener.class)
public class Role extends BaseEntity {
    @Column
    private Integer num;
    @Column
    private Long pid;
    @Column(columnDefinition = "VARCHAR(64) COMMENT '角色名称'")
    @NotBlank(message = "角色名称不能为空")
    private String name;
    @Column(columnDefinition = "VARCHAR(64) COMMENT '角色编码'")
    private String tips;
    @Column
    private Long deptid;
    @Column
    private Integer version;

}
