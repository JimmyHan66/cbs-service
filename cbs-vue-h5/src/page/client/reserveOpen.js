import {XHeader, XInput, Group, XTextarea, XButton, AlertModule, PopupPicker, PopupRadio} from 'vux'
import footMenu from '../../components/footer/footMenu'
import api from '../../fetch/api'

export default {
    components: {
        XHeader, XInput, Group, XTextarea, XButton, footMenu, AlertModule, PopupPicker, PopupRadio
    },
    data() {
        return {
            form: {
                openType: undefined,
                openBranch: undefined,
                deptId: undefined,
                clientName: '',
                sex: '1',
                idNumber: '0',
                clientPhoneNo: ''
            },
            openTypeList: [[
                {name: '期货', value: '1'},
                {name: '期权', value: '2'}
            ]],
            openBranchList: [],
            sexList: [
                {key: '1', value: '先生'},
                {key: '2', value: '女士'}
            ],
            showTHS: true,
            zz_name: '',
            zz_id: ''
        }
    },
    created() {
        // 隐藏底部导航栏
        // this.$store.state.showBottomNav = false
        this.init()
    },
    methods: {
        init() {
            // 初始化部门列表选项
            this.getBranchlist()
            // 同花顺隐藏开户网点选项
            if (window.location.hash === '#/reserveOpenTHS') {
                this.showTHS = false
            }
        },
        getBranchlist() {
            api.getOpenBranch().then(res => {
                const arry = []
                const deptArray = res.data
                deptArray.forEach(item => {
                    const dept = {}
                    dept.value = item.id.toString()
                    dept.name = item.label
                    // 把郑州总部排在首位
                    if (dept.name === '郑州总部') {
                        arry.splice(0, 0, dept);
                        // 保存郑州总部的部门名称和ID
                        this.zz_name = dept.name
                        this.zz_id = dept.value
                    } else {
                        arry.push(dept)
                    }
                })
                this.openBranchList.push(arry)
            })
        },
        submit() {
            // console.log(this.idNumber);
            console.log(window.location.hash)
            if (this.valid()) {
                let channel = ''
                let openBranch = ''
                let deptId = ''
                if (window.location.hash === '#/reserveOpenTHS') {
                    channel = '同花顺'
                    openBranch = this.zz_name
                    deptId = this.zz_id
                } else {
                    channel = '微信公众号'
                    openBranch = this.$refs.branchPicker && this.$refs.branchPicker.getNameValues()
                    deptId = this.form.deptId[0]
                }
                // 由于form的双向绑定直接修改from的属性值会引起vue控制台报错，故用一个变量承接
                const subForm = {
                    openType: this.form.openType[0],
                    openBranch: openBranch,
                    deptId: deptId,
                    clientName: this.form.clientName,
                    sex: this.form.sex,
                    idNumber: this.idNumber,
                    clientPhoneNo: this.form.clientPhoneNo,
                    channel: channel,
                    // 其余为默认值，后续视情况考虑放开
                    clientType: '1',
                    clientAddress: '',
                    referrer: '',
                    remark: ''
                }
                console.log(subForm)
                api.saveReserveOpen(subForm).then(res => {
                    console.log(res)
                    if (res.success) {
                        AlertModule.show({content: '提交成功！'})
                    } else {
                        AlertModule.show({content: res.msg})
                    }
                })
            } else {
                AlertModule.show({content: '请填写完整或正确信息！'})
            }
        },
        valid() {
            if (this.form.clientName === '') {
                return false
            }

            // 注释掉身份证号码的控件和校验
            // if (this.form.idNumber === '' || !this.$refs.idcard.valid) {
            //     return false
            // }

            if (this.form.clientPhoneNo === '' || !this.$refs.mobile.valid) {
                return false
            }

            if (this.form.openType === undefined) {
                return false
            }
            // 仅当开户网点控件显示时校验
            if (this.form.deptId === undefined && this.showTHS) {
                return false
            }
            return true
        },
        changeHandel(){
            this.idNumber = '1'
            // console.log( this.idNumber);
        }
    }
}
