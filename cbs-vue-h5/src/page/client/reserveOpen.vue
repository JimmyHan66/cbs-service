<template>
    <div>
<!--        <x-header title="预约开户"></x-header>-->
        <div>
            <img src="static/images/logo_ccfc.jpg">
        </div>
        <group>
            <popup-picker title="开户类型" v-model="form.openType"
                          :data="openTypeList"
                          :show-name="true"
                          :placeholder="'请选择开户类型'"></popup-picker>
            <popup-picker title="开户网点" v-model="form.deptId"
                          ref="branchPicker"
                          v-show="showTHS"
                          :data="openBranchList"
                          :show-name="true"
                          :placeholder="'请选择开户网点'"></popup-picker>
            <x-input title="姓名" v-model="form.clientName"
                     :show-clear="false"
                     text-align="right"
                     placeholder="姓名"
                     :required="true"
                     is-type="china-name"
                     @input="changeHandel()"></x-input>
            <popup-radio title="性别" v-model="form.sex"
                         :options="sexList"
                         :popup-header="'性别'"></popup-radio>
            <!--            <x-input title="身份证号码" v-model="form.idNumber"-->
            <!--                     ref="idcard"-->
            <!--                     :show-clear="false"-->
            <!--                     text-align="right"-->
            <!--                     placeholder="身份证号码"-->
            <!--                     :required="true"-->
            <!--                     is-type="china-id"></x-input>-->
            <x-input title="手机号码" v-model="form.clientPhoneNo"
                     ref="mobile"
                     :show-clear="false"
                     text-align="right"
                     placeholder="手机号码"
                     keyboard="number"
                     :required="true"
                     is-type="china-mobile"></x-input>
            <br/>
            <div style="color:#999999">
                <p>温馨提示：</p>
                <p>请保持手机畅通，以便客服人员及时与您联系！</p>
                <p v-show="showTHS">在线开户请查阅微信公众号【业务指南】-【开户指南】</p>
            </div>
            <br/>
            <x-button type="primary" @click.native="submit" style="width:80%;">提交</x-button>
        </group>
        <br/><br/>
        <div>
            <img src="static/images/wxcode_ccfc.png">
        </div>
    </div>
</template>
<script src="./reserveOpen.js">
</script>
