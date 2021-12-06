package com.ccfc.cbs.bean.enumeration;

public enum ConfigKeyEnum {
    /**
     * 新浪行情接口前缀
     */
    API_SINA_HQ("api.sina.hq"),
    /**
     * 开户岗角色ID
     */
    SYSTEM_ROLE_OPENPOST("system.role.openpost"),
    /**
     * 开户岗管理角色ID
     */
    SYSTEM_ROLE_OPENADMIN("system.role.openadmin"),
    /**
     * 分支机构父菜单ID
     */
    SYSTEM_DEPT_BRANCH("system.dept.branch"),
    /**
     * 系统默认上传路径
     */
    SYSTEM_FILE_UPLOAD_PATH("system.file.upload.path"),
    /**
     * 系统名称
     */
    SYSTEM_APP_NAME("system.app.name"),
    /**
     * 腾讯sms接口appid
     */
    API_TENCENT_SMS_APPID("api.tencent.sms.appid"),
    /**
     * 腾讯sms接口appkey
     */
    API_TENCENT_SMS_APPKEY("api.tencent.sms.appkey"),
    /**
     * 腾讯sms接口签名参数
     */
    API_TENCENT_SMS_SIGN("api.tencent.sms.sign");

    private String value;

    ConfigKeyEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
