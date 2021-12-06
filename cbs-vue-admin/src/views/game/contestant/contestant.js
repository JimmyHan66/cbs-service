import contestantApi from '@/api/game/contestant'
import permission from '@/directive/permission/index.js'
import {getApiUrl} from '@/utils/utils'

export default {
    directives: {permission},
    data() {
        return {
            formVisible: false,
            formTitle: '添加实盘大赛参赛者信息',
            isAdd: true,
            whetherList: [
                {label: '是', value: true},
                {label: '否', value: false}
            ],
            form: {
                contestantName: '',
                fundAccount: '',
                contestantNickname: '',
                contestantPhoneNo: '',
                contestantAddress: '',
                teacher: '',
                isQuantify: '',
                isHedgeArbitrage: '',
                isAgency: '',
                agencyNo: '',
                isValid: '',
                channel: '',
                remark: '',
                id: ''
            },
            listQuery: {
                page: 1,
                limit: 20,
                contestantName: '',
                fundAccount: '',
                contestantPhoneNo: '',
                isValid: undefined
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
            contestantApi.getList(this.listQuery).then(response => {
                this.list = response.data.records
                this.listLoading = false
                this.total = response.data.total
            })
        },
        search() {
            this.fetchData()
        },
        reset() {
            this.listQuery.contestantName = ''
            this.listQuery.fundAccount = ''
            this.listQuery.contestantPhoneNo = ''
            this.listQuery.isValid = undefined
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
                contestantName: '',
                fundAccount: '',
                contestantNickname: '',
                contestantPhoneNo: '',
                contestantAddress: '',
                teacher: '',
                isQuantify: '',
                isHedgeArbitrage: '',
                isAgency: '',
                agencyNo: '',
                isValid: '',
                channel: '',
                remark: '',
                id: ''
            }
        },
        add() {
            this.formTitle = '添加实盘大赛参赛者信息',
                this.formVisible = true
            this.isAdd = true

            if (this.$refs['form'] !== undefined) {
                this.$refs['form'].resetFields()
            }
            //如果表单初始化有特殊处理需求,可以在resetForm中处理
        },
        save() {
            this.$refs['form'].validate((valid) => {
                if (valid) {
                    const formData = {
                        id: this.form.id,
                        contestantName: this.form.contestantName,
                        fundAccount: this.form.fundAccount,
                        contestantNickname: this.form.contestantNickname,
                        contestantPhoneNo: this.form.contestantPhoneNo,
                        contestantAddress: this.form.contestantAddress,
                        teacher: this.form.teacher,
                        isQuantify: this.form.isQuantify,
                        isHedgeArbitrage: this.form.isHedgeArbitrage,
                        isAgency: this.form.isAgency,
                        agencyNo: this.form.agencyNo,
                        isValid: this.form.isValid,
                        channel: this.form.channel,
                        remark: this.form.remark,
                    }
                    if (formData.id) {
                        contestantApi.update(formData).then(response => {
                            this.$message({
                                message: this.$t('common.optionSuccess'),
                                type: 'success'
                            })
                            this.fetchData()
                            this.formVisible = false
                        })
                    } else {
                        contestantApi.add(formData).then(response => {
                            this.$message({
                                message: this.$t('common.optionSuccess'),
                                type: 'success'
                            })
                            this.fetchData()
                            this.formVisible = false
                        })
                    }
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
                this.formTitle = '编辑实盘大赛参赛者信息'
                this.formVisible = true

                if (this.$refs['form'] !== undefined) {
                    this.$refs['form'].resetFields()
                }
                //如果表单初始化有特殊处理需求,可以在resetForm中处理
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
                    contestantApi.remove(id).then(response => {
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
        // 导出Excel
        exportXls() {
            contestantApi.exportXls(this.listQuery).then(response => {
                console.log(response)
                window.location.href = getApiUrl() + '/file/download?idFile=' + response.data.id
            })

        }
    }
}
