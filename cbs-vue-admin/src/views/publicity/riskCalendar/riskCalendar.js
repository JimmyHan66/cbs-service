import riskCalendarApi from '@/api/publicity/riskCalendar'
import permission from '@/directive/permission/index.js'

export default {
    directives: {permission},
    data() {
        return {
            formVisible: false,
            formTitle: '添加风控日历',
            isAdd: true,
            whetherList: [
                {label: '是', value: true},
                {label: '否', value: false}
            ],
            form: {
                riskDate: '',
                month: undefined,
                isClosed: false,
                isNoNight: false,
                isContent: false,
                riskContent: ''
            },
            listQuery: {
                page: 1,
                limit: 20,
                riskDate: ''
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
                riskDate: [
                    {required: true, message: '请选择日期', trigger: 'blur'}
                ]
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
            riskCalendarApi.getList(this.listQuery).then(response => {
                this.list = response.data.records
                this.listLoading = false
                this.total = response.data.total
            })
        },
        search() {
            this.fetchData()
        },
        reset() {
            this.listQuery.riskDate = ''
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
                riskDate: '',
                month: undefined,
                isClosed: false,
                isNoNight: false,
                isContent: false,
                riskContent: ''
            }
        },
        add() {
            this.formTitle = '添加风控日历'
            this.formVisible = true
            this.isAdd = true

            if (this.$refs['form'] !== undefined) {
                this.$refs['form'].resetFields()
            }
            this.form.id = null
            //如果表单初始化有特殊处理需求,可以在resetForm中处理
        },
        save() {
            this.$refs['form'].validate((valid) => {
                if (valid) {
                    this.form.isContent = this.form.riskContent !== '';
                    const formData = {
                        id: this.form.id,
                        riskDate: this.form.riskDate,
                        month: this.form.month,
                        isClosed: this.form.isClosed,
                        isNoNight: this.form.isNoNight,
                        isContent: this.form.isContent,
                        riskContent: this.form.riskContent,
                    }
                    if (formData.id) {
                        riskCalendarApi.update(formData).then(response => {
                            this.$message({
                                message: this.$t('common.optionSuccess'),
                                type: 'success'
                            })
                            this.fetchData()
                            this.formVisible = false
                        })
                    } else {
                        riskCalendarApi.add(formData).then(response => {
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
                this.formTitle = '编辑风控日历'
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
                    riskCalendarApi.remove(id).then(response => {
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
        riskDateChange(value) {
            if (value !== '') {
                this.form.month = parseInt(value.substr(0, 4) + value.substr(5, 2))
            }
        }
    }
}
