import {remove, getList, save, exportXls} from '@/api/client/reserveOpenClient'
// 权限判断指令
import permission from '@/directive/permission/index.js'
// 用户信息全局变量
import state from '@/store/modules/user'
import {getApiUrl} from '@/utils/utils'

export default {
    directives: {permission},
    data() {
        return {
            formVisible: false,
            formTitle: '添加预约开户客户信息',
            isAdd: true,
            whetherList: [
                {label: '是', value: true},
                {label: '否', value: false}
            ],
            channelList: [
                {label: '同花顺', value: '同花顺'},
                {label: '微信公众号', value: '微信公众号'}
            ],
            timeRange: null,
            form: {
                serialNo: '',
                createTime: '',
                clientName: '',
                sex: '',
                idNumber: '',
                clientPhoneNo: '',
                clientAddress: '',
                openType: '',
                openBranch: '',
                deptId: '',
                clientType: '',
                isOpenInOthers: '',
                isOpenInHere: '',
                isOpenSuccess: '',
                channel: '',
                referrer: '',
                openDate: '',
                fundAccount: '',
                remark: '',
                isHistory: '',
                id: ''
            },
            listQuery: {
                page: 1,
                limit: 20,
                clientName: undefined,
                fundAccount: undefined,
                clientPhoneNo: undefined,
                isOpenSuccess: undefined,
                isHistory: undefined,
                deptId: undefined,
                roleId: '',
                channel: '',
                startTime: '',
                endTime: ''
            },
            total: 0,
            list: null,
            listLoading: true,
            selRow: {}
        }
    },
    filters: {
        statusFilter(status) {
            const statusMap = {
                published: 'success',
                draft: 'gray',
                deleted: 'danger'
            }
            return statusMap[status]
        }
    },
    computed: {

        //表单验证
        rules() {
            return {
                // cfgName: [
                //   { required: true, message: this.$t('config.name') + this.$t('common.isRequired'), trigger: 'blur' },
                //   { min: 3, max: 2000, message: this.$t('config.name') + this.$t('config.lengthValidation'), trigger: 'blur' }
                // ]
            }
        }
    },
    created() {
        this.init()
    },
    methods: {
        init() {
            this.fetchData()
        },
        fetchData() {
            this.listLoading = true
            this.listQuery.deptId = state.state.profile.deptid
            this.listQuery.roleId = state.state.profile.roleid

            if (this.timeRange != null) {
                this.listQuery.startTime = this.dateFormat(this.timeRange[0])
                this.listQuery.endTime = this.dateFormat(this.timeRange[1])
            }
            getList(this.listQuery).then(response => {
                console.log(response.data)
                this.list = response.data.records
                this.listLoading = false
                this.total = response.data.total

            })
        },
        dateFormat(dateData) {
            const date = new Date(dateData)
            const y = date.getFullYear()
            let m = date.getMonth() + 1
            m = m < 10 ? ('0' + m) : m
            let d = date.getDate()
            d = d < 10 ? ('0' + d) : d
            let hh = date.getHours()
            hh = hh < 10 ? ('0' + hh) : hh
            let mm = date.getMinutes()
            mm = mm < 10 ? ('0' + mm) : mm
            let ss = date.getSeconds()
            ss = ss < 10 ? ('0' + ss) : ss

            return y + '-' + m + '-' + d + ' ' + hh + ':' + mm + ':' + ss
        },
        search() {
            this.fetchData()
        },
        reset() {
            this.listQuery.clientName = ''
            this.listQuery.fundAccount = ''
            this.listQuery.clientPhoneNo = ''
            this.listQuery.isOpenSuccess = null
            this.listQuery.isHistory = null
            this.listQuery.channel = ''
            this.timeRange = null
            this.listQuery.startTime = ''
            this.listQuery.endTime = ''
            this.fetchData()
        },
        handleFilter() {
            this.listQuery.page = 1
            this.getList()
        },
        handleClose() {

        },
        fetchNext() {
            this.listQuery.page = this.listQuery.page + 1
            this.fetchData()
        },
        fetchPrev() {
            this.listQuery.page = this.listQuery.page - 1
            this.fetchData()
        },
        fetchPage(page) {
            this.listQuery.page = page
            this.fetchData()
        },
        changeSize(limit) {
            this.listQuery.limit = limit
            this.fetchData()
        },
        handleCurrentChange(currentRow, oldCurrentRow) {
            this.selRow = currentRow
        },
        resetForm() {
            this.form = {
                serialNo: '',
                createTime: '',
                clientName: '',
                sex: '',
                idNumber: '',
                clientPhoneNo: '',
                clientAddress: '',
                openType: '',
                openBranch: '',
                deptId: '',
                clientType: '',
                isOpenInOthers: '',
                isOpenInHere: '',
                isOpenSuccess: '',
                referrer: '',
                openDate: '',
                fundAccount: '',
                remark: '',
                isHistory: '',
                id: ''
            }
        },
        add() {
            this.resetForm()
            this.formTitle = '添加预约开户客户信息'
                this.formVisible = true
            this.isAdd = true
        },
        save() {
            this.$refs['form'].validate((valid) => {
                if (valid) {
                    save({
                        serialNo: this.form.serialNo,
                        businessDate: this.form.createTime,
                        clientName: this.form.clientName,
                        sex: this.form.sex,
                        idNumber: this.form.idNumber,
                        clientPhoneNo: this.form.clientPhoneNo,
                        clientAddress: this.form.clientAddress,
                        openType: this.form.openType,
                        openBranch: this.form.openBranch,
                        deptId: this.form.deptId,
                        clientType: this.form.clientType,
                        isOpenInOthers: this.form.isOpenInOthers,
                        isOpenInHere: this.form.isOpenInHere,
                        isOpenSuccess: this.form.isOpenSuccess,
                        channel: this.form.channel,
                        openDate: this.form.openDate,
                        fundAccount: this.form.fundAccount,
                        referrer: this.form.referrer,
                        remark: this.form.remark,
                        isHistory: this.form.isHistory,
                        id: this.form.id
                    }).then(response => {
                        this.$message({
                            message: this.$t('common.optionSuccess'),
                            type: 'success'
                        })
                        this.fetchData()
                        this.formVisible = false
                    })
                } else {
                    return false
                }
            })
        },
        checkSel() {
            if (this.selRow && this.selRow.id) {
                return true
            }
            this.$message({
                message: this.$t('common.mustSelectOne'),
                type: 'warning'
            })
            return false
        },
        editItem(record) {
            this.selRow = record
            this.edit()
        },
        edit() {
            if (this.checkSel()) {
                this.isAdd = false
                this.form = this.selRow
                this.form.sex = this.form.sex.toString()
                this.form.clientType = this.form.clientType.toString()
                this.form.openType = this.form.openType.toString()
                this.formTitle = '编辑预约开户客户信息'
                this.formVisible = true
            }
        },
        removeItem(record) {
            this.selRow = record
            this.remove()
        },
        remove() {
            if (this.checkSel()) {
                var id = this.selRow.id
                this.$confirm(this.$t('common.deleteConfirm'), this.$t('common.tooltip'), {
                    confirmButtonText: this.$t('button.submit'),
                    cancelButtonText: this.$t('button.cancel'),
                    type: 'warning'
                }).then(() => {
                    remove(id).then(response => {
                        this.$message({
                            message: this.$t('common.optionSuccess'),
                            type: 'success'
                        })
                        this.fetchData()
                    }).catch(err => {
                        this.$notify.error({
                            title: '错误',
                            message: err
                        })
                    })
                }).catch(() => {
                })
            }
        },
        changeClientType(val) {
            this.form.clientType = val
        },
        changeOpenType(val) {
            this.form.openType = val
        },
        changeSex(val) {
            this.form.sex = val
        },
        // 导出Excel
        exportToXls() {
            exportXls(this.listQuery).then(response => {
                console.log(response)
                window.location.href = getApiUrl() + '/file/download?idFile=' + response.data.id
            })

        }
    }
}
