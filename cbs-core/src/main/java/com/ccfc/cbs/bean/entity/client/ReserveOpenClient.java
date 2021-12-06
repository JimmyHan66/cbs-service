package com.ccfc.cbs.bean.entity.client;

import com.ccfc.cbs.bean.entity.BaseEntity;
import lombok.Data;
import org.hibernate.annotations.Table;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 预约开户客户信息
 *
 * @author shibl
 */
@Entity(name = "t_client_reserveopenclient")
@Table(appliesTo = "t_client_reserveopenclient", comment = "预约开户客户信息")
@Data
@EntityListeners(AuditingEntityListener.class)
public class ReserveOpenClient extends BaseEntity {
    @Column(name = "serial_no", columnDefinition = "LONG COMMENT '流水号'")
    private Long serialNo;
    @Column(name = "business_date", columnDefinition = "DATETIME COMMENT '业务日期'")
    private String businessDate;
    @Column(name = "client_name", columnDefinition = "VARCHAR(32) COMMENT '客户姓名'")
    @NotBlank(message = "客户姓名不能为空")
    private String clientName;
    @Column(name = "sex", columnDefinition = "INT COMMENT '性别'")
    private Integer sex;
    @Column(name = "id_number", columnDefinition = "VARCHAR(32) COMMENT '身份证号码'")
    private String idNumber;
    @Column(name = "client_phone_no", columnDefinition = "VARCHAR(32) COMMENT '客户电话号码'")
    @NotBlank(message = "客户电话号码不能为空")
    private String clientPhoneNo;
    @Column(name = "client_address", columnDefinition = "VARCHAR(128) COMMENT '客户地址'")
    private String clientAddress;
    @Column(name = "open_type", columnDefinition = "INT COMMENT '开户类型'")
    private Integer openType;
    @Column(name = "open_branch", columnDefinition = "VARCHAR(128) COMMENT '开户网点'")
    private String openBranch;
    @Column(name = "dept_id", columnDefinition = "INT COMMENT '部门序号'")
    @NotNull(message = "部门序号不能为空")
    private Integer deptId;
    @Column(name = "client_type", columnDefinition = "INT COMMENT '客户类型'")
    private Integer clientType;
    @Column(name = "is_open_in_others", columnDefinition = "TINYINT COMMENT '是否在其它期货公司开户'")
    private Boolean isOpenInOthers;
    @Column(name = "is_open_in_here", columnDefinition = "TINYINT COMMENT '是否在本公司开户'")
    private Boolean isOpenInHere;
    @Column(name = "is_open_success", columnDefinition = "TINYINT COMMENT '是否开户成功'")
    private Boolean isOpenSuccess;
    @Column(name = "channel", columnDefinition = "VARCHAR(32) COMMENT '来源渠道'")
    private String channel;
    @Column(name = "open_date", columnDefinition = "DATE COMMENT '开户日期'")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date openDate;
    @Column(name = "fund_account", columnDefinition = "VARCHAR(32) COMMENT '资金账号'")
    private String fundAccount;
    @Column(name = "referrer", columnDefinition = "VARCHAR(32) COMMENT '推荐人'")
    private String referrer;
    @Column(name = "remark", columnDefinition = "VARCHAR(1024) COMMENT '备注'")
    private String remark;
    @Column(name = "is_history", columnDefinition = "TINYINT COMMENT '是否归历史'")
    private Boolean isHistory;

}
