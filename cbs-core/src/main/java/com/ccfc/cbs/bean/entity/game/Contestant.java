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
 * 参赛者信息类
 * 
 * @author shibl
 * @date 2021-02-22 10:13
 */
@EqualsAndHashCode(callSuper = true)
@Entity(name = "t_game_contestant")
@Table(appliesTo = "t_game_contestant", comment = "实盘大赛参赛者信息")
@Data
@EntityListeners(AuditingEntityListener.class)
public class Contestant extends BaseEntity {
    @Column(name = "contestant_name", columnDefinition = "VARCHAR(32) COMMENT '真实姓名'")
    @NotBlank(message = "参赛者姓名不能为空")
    private String contestantName;
    @Column(name = "fund_account", columnDefinition = "VARCHAR(32) COMMENT '资金账号'")
    @NotBlank(message = "资金账号不能为空")
    private String fundAccount;
    @Column(name = "contestant_nickname", columnDefinition = "VARCHAR(32) COMMENT '昵称'")
    private String contestantNickname;
    @Column(name = "contestant_phone_no", columnDefinition = "VARCHAR(32) COMMENT '电话号码'")
    @NotBlank(message = "电话号码不能为空")
    private String contestantPhoneNo;
    @Column(name = "contestant_address", columnDefinition = "VARCHAR(128) COMMENT '地址'")
    private String contestantAddress;
    @Column(name = "teacher", columnDefinition = "VARCHAR(32) COMMENT '指导老师'")
    private String teacher;
    @Column(name = "is_quantify", columnDefinition = "TINYINT COMMENT '是否量化'")
    private Boolean isQuantify;
    @Column(name = "is_hedge_arbitrage", columnDefinition = "TINYINT COMMENT '是否对冲套利'")
    private Boolean isHedgeArbitrage;
    @Column(name = "is_agency", columnDefinition = "TINYINT COMMENT '是否机构'")
    private Boolean isAgency;
    @Column(name = "agency_no", columnDefinition = "VARCHAR(32) COMMENT '机构产品备案号'")
    private String agencyNo;
    @Column(name = "is_valid", columnDefinition = "TINYINT COMMENT '是否有效'")
    private Boolean isValid;
    @Column(name = "channel", columnDefinition = "VARCHAR(32) COMMENT '来源渠道'")
    private String channel;
    @Column(name = "remark", columnDefinition = "VARCHAR(1024) COMMENT '备注'")
    private String remark;

}
