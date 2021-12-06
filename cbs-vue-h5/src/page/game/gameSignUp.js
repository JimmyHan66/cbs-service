import {
    XHeader, XInput, Group, XButton, XSwitch, XDialog, AlertModule, Toast,
    TransferDomDirective as TransferDom
} from 'vux'
import api from '../../fetch/api'

export default {
    directives: {
        TransferDom
    },
    components: {
        XHeader, XInput, Group, XButton, XSwitch, XDialog, AlertModule, Toast
    },
    data() {
        return {
            showDialog: false,
            showToast: false,
            toastType: 'cancel',
            toastText: '',
            form: {
                contestantName: '',
                fundAccount: '',
                contestantNickname: '',
                contestantPhoneNo: '',
                contestantAddress: '',
                teacher: '',
                isQuantify: false,
                isHedgeArbitrage: false,
                isAgency: false,
                agencyNo: ''
            }
        }
    },
    created() {
    },
    methods: {
        submit() {
            console.log(this.form)
            if (this.valid()) {
                // 由于form的双向绑定直接修改from的属性值会引起vue控制台报错，故用一个变量承接
                let contestantNickname = this.form.contestantNickname
                // 没有填写昵称的，取姓名第一个字+老师作为昵称
                if (contestantNickname === '') {
                    contestantNickname = this.form.contestantName.substr(0, 1) + "老师"
                }
                const subForm = {
                    contestantName: this.form.contestantName,
                    fundAccount: this.form.fundAccount,
                    contestantNickname: contestantNickname,
                    contestantPhoneNo: this.form.contestantPhoneNo,
                    contestantAddress: this.form.contestantAddress,
                    teacher: this.form.teacher,
                    isQuantify: this.form.isQuantify,
                    isHedgeArbitrage: this.form.isHedgeArbitrage,
                    isAgency: this.form.isAgency,
                    agencyNo: this.form.agencyNo
                }
                console.log(subForm)
                api.gameSignUp(subForm).then(res => {
                    console.log(res)
                    if (res.success) {
                        this.toastType = 'success'
                        this.toastText = '提交成功！'
                    } else {
                        this.toastType = 'warn'
                        this.toastText = res.msg
                    }
                    this.showToast = true
                })
            } else {
                this.toastType = 'cancel'
                this.showToast = true
            }
        },
        valid() {
            if (this.form.contestantName === '') {
                this.toastText = '真实姓名不能为空!'
                return false
            }

            if (this.form.fundAccount === '' || this.form.fundAccount.length !== 9) {
                this.toastText = '请填写正确完整的资金账号!'
                return false
            }

            if (this.form.contestantPhoneNo === '' || !this.$refs.mobile.valid) {
                this.toastText = '请填写正确完整的手机号码!'
                return false
            }

            if (this.form.isAgency && this.form.agencyNo === '') {
                this.toastText = '请填写机构产品备案号!'
                return false
            }
            return true
        }
    }
}
