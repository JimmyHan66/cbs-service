import marginApi from '@/api/publicity/margin'
import specialMarginApi from '@/api/publicity/specialMargin'
import permission from '@/directive/permission/index.js'
import {getApiUrl} from '@/utils/utils'

export default {
    directives: {permission},
    data() {
        return {
            formVisible: false,
            formTitle: '添加标准合约保证金信息',
            isAdd: true,
            batchAddTitle:'',
            batchAddVisible: false,
            form: {
                contractCode: '',
                contractName: '',
                marketNo: undefined,
                multiplier: '',
                multiplierUnit: '',
                lastPrice: '',
                priceUnit: '',
                minChangePrice: '',
                exchangeMargin: '',
                companyMargin: '',
                quoteChange: '',
                remark: '',
                id: ''
            },
            listQuery: {
                page: 1,
                limit: 20,
                contractCode: '',
                contractName: '',
                marketNo: null,
                startTime: '',
                endTime: ''
            },
            timeRange: null,
            specialListQuery: {
                page: 1,
                limit: 20,
                contractCode: ''
            },
            total: 0,
            list: null,
            specialMarginList: [],
            listLoading: true,
            selRow: {},
            marketList: [
                {label: '上海期货交易所', value: 1},
                {label: '大连商品交易所', value: 2},
                {label: '郑州商品交易所', value: 3},
                {label: '中国金融期货交易所', value: 4},
                {label: '上海国际能源交易中心', value: 5}
            ],
            // 标准合约默认备注选项
            options: [
                {label: '交割月前第一月的第一个交易日起', value: '交割月前第一月的第一个交易日起'},
                {label: '交割月的第一个交易日起', value: '交割月的第一个交易日起'},
                {label: '最后交易日前二个交易日起', value: '最后交易日前二个交易日起'},
                {label: '交割月前一个月第16个日历日起', value: '交割月前一个月第16个日历日起'},
                {label: '交割月前一个月第十五个交易日起', value: '交割月前一个月第十五个交易日起'},
                {label: '交割月之前两个交易日结算起', value: '交割月之前两个交易日结算起'},
                {label: '第一日涨停板扩幅', value: '第一日涨停板扩幅'},
                {label: '第一日跌停板扩幅', value: '第一日跌停板扩幅'},
                {label: '根据交易所通知调整', value: '根据交易所通知调整'}
            ],
            batchContractCode:[],
            batchForm: {
                marketNo: 1,
                exchangeMargin: '',
                companyMargin: '',
                quoteChange: '',
                remark:'',
                contractCodeList:[],
                contractMonth:''
            },
            batchFormVal:{},
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
            this.getCodeByMarket()
        },
        fetchData() {
            if (this.timeRange != null) {
                this.listQuery.startTime = this.dateFormat(this.timeRange[0])
                this.listQuery.endTime = this.dateFormat(this.timeRange[1])
            }
            // console.log(this.listQuery)
            this.listLoading = true
            marginApi.getList(this.listQuery).then(response => {
                this.list = response.data.records
                this.listLoading = false
                this.total = response.data.total
            })
        },
         //初始根据默认交易所获取合约代码
        getCodeByMarket(){
            marginApi.getCodeByMarket(1).then(res => {
                //    console.log(res,"1111");
                   res.data.forEach(ele => {
                       this.batchContractCode.push({label:ele.contractName,value:ele.contractCode})
                   });
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
            this.listQuery.contractCode = ''
            this.listQuery.contractName = ''
            this.listQuery.marketNo = null
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
                contractCode: '',
                contractName: '',
                marketNo: '',
                multiplier: '',
                multiplierUnit: '',
                lastPrice: '',
                priceUnit: '',
                minChangePrice: '',
                exchangeMargin: '',
                companyMargin: '',
                quoteChange: '',
                remark: '',
                id: ''
            }
            this.specialMarginList = []
        },
        add() {
            this.formTitle = '添加保证金公示信息'
            this.formVisible = true
            this.isAdd =true

            if (this.$refs['form'] !== undefined) {
                this.$refs['form'].resetFields()
            }
            //如果表单初始化有特殊处理需求,可以在resetForm中处理
            this.resetForm()
        },
        save() {
            this.$refs['form'].validate((valid) => {
                if (valid) {
                    const formData = {
                        id: this.form.id,
                        contractCode: this.form.contractCode,
                        contractName: this.form.contractName,
                        marketNo: parseInt(this.form.marketNo),
                        multiplier: this.form.multiplier,
                        multiplierUnit: this.form.multiplierUnit,
                        lastPrice: this.form.lastPrice,
                        priceUnit: this.form.priceUnit,
                        minChangePrice: this.form.minChangePrice,
                        exchangeMargin: this.form.exchangeMargin,
                        companyMargin: this.form.companyMargin,
                        quoteChange: this.form.quoteChange,
                        remark: this.form.remark,
                    }
                    if (formData.id) {
                        marginApi.update(formData).then(response => {
                            this.$message({
                                message: this.$t('common.optionSuccess'),
                                type: 'success'
                            })
                            this.fetchData()
                            this.formVisible = false
                        })
                    } else {
                        marginApi.add(formData).then(response => {
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
                this.formTitle = '编辑保证金公示信息'
                this.formVisible = true

                this.form.marketNo = this.form.marketNo.toString()

                if (this.$refs['form'] !== undefined) {
                    this.$refs['form'].resetFields()
                }
                //如果表单初始化有特殊处理需求,可以在resetForm中处理

                // 获取特殊合约保证金
                this.getSpecialMargin()
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
                    marginApi.remove(id).then(response => {
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
        changeExchange(val) {
            this.form.marketNo = val
        },
        getSpecialMargin() {
            console.log(this.form.contractCode)
            if (this.form.contractCode == null || this.form.contractCode == '') {
                return
            }
            this.specialMarginList = null
            this.specialListQuery.contractCode = this.form.contractCode
            specialMarginApi.getList(this.specialListQuery).then(response => {
                this.specialMarginList = response.data.records
            })
        },
        // 编辑
        startEdit(row) {
            row.edit = true;
            row.disabled = true;
        },
        // 保存
        confirmEdit(row) {
            if (row.contractCode == null) {
                this.getSpecialMargin()
                return
            }
            const specialData = {
                id: row.id,
                contractCode: this.form.contractCode,
                specialContractCode: row.specialContractCode,
                exchangeMargin: row.exchangeMargin,
                companyMargin: row.companyMargin,
                quoteChange: row.quoteChange,
                remark: row.remark
            }

            // 调用更新方法
            if (specialData.id) {
                specialMarginApi.update(specialData).then(response => {
                    this.$message({
                        message: this.$t('common.optionSuccess'),
                        type: 'success'
                    })
                    // 重新加载该页面
                    this.getSpecialMargin()
                }).catch(err => {
                    // 重新加载该页面
                    this.getSpecialMargin()
                })
            } else {
                specialMarginApi.add(specialData).then(response => {
                    this.$message({
                        message: this.$t('common.optionSuccess'),
                        type: 'success'
                    })
                    // 重新加载该页面
                    this.getSpecialMargin()
                }).catch(err => {
                    // 重新加载该页面
                    this.getSpecialMargin()
                })
            }

            row.edit = false
            row.disabled = false
        },
        // 取消
        cancelEdit(row) {
            row.edit = false;
            row.disabled = false;
            this.$message({
                message: '已取消修改!',
                type: 'warning'
            })
            // 重新加载该页面
            this.getSpecialMargin()

        },
        deleteRow(row) {
            var id = row.id
            this.$confirm(this.$t('common.deleteConfirm'), this.$t('common.tooltip'), {
                confirmButtonText: this.$t('button.submit'),
                cancelButtonText: this.$t('button.cancel'),
                type: 'warning'
            }).then(() => {
                specialMarginApi.remove(id).then(response => {
                    this.$message({
                        message: this.$t('common.optionSuccess'),
                        type: 'success'
                    })
                    // 重新加载该页面
                    this.getSpecialMargin()
                }).catch(err => {
                    this.$notify.error({
                        title: '错误',
                        message: err
                    })
                })
            }).catch(() => {
            })


        },
        // 增加行
        addRow() {
            if (this.form.contractCode == null || this.form.contractCode == '') {
                this.$message({
                    message: '合约代码不能为空!',
                    type: 'warning'
                })
                return
            }
            let newLine = {
                id: undefined,
                contractCode: this.form.contractCode,
                specialContractCode: this.form.contractCode,
                exchangeMargin: 0,
                companyMargin: 0,
                quoteChange: 0,
                edit: true, // 新增时处于可编辑状态，所以按钮是保存和取消
                disabled: true // 打开编辑状态
            };
            this.specialMarginList.unshift(newLine); // 移到第一行
        },
        // 导出Excel
        exportXls() {
            marginApi.exportXls(this.listQuery).then(response => {
                console.log(response)
                window.location.href = getApiUrl() + '/file/download?idFile=' + response.data.id
            })

        },
        batchAdd() {
            this.batchAddTitle = '批量增删保证金公示信息'
            this.batchAddVisible = true
        },
        batchSave() {
            if (this.batchForm.contractCodeList.length >  0 && this.batchForm.marketNo !='' && this.batchForm.contractMonth !=''){
            //     let  batchAdddate = this.batchForm
            //     this.batchAdddate.contractCodeList  = this.batchForm.contractCodeList.toString()
            //     marginApi.batchAdd(batchAdddate).then(response => {
            //         this.$message({
            //             message: this.$t('common.optionSuccess'),
            //             type: 'success'
            //         })
            //         this.batchAddVisible = false
            //         this.batchForm = {}
            //         this.fetchData()
            //     })
            // }else{
            //     alert('信息填写不完整,无法提交')
            // }
                this.batchForm.contractCodeList  = this.batchForm.contractCodeList.toString()
                marginApi.batchAdd(this.batchForm).then(response => {
                    // console.log(response);
                    this.$message({
                        message: this.$t('common.optionSuccess'),
                        type: 'success'
                    })
                    this.batchAddVisible = false
                    this.batchForm = {}
                    this.fetchData()
                    location.reload()                })
            }else{
                alert('信息填写不完整,无法提交')
            }
        },
        batchDel(){
            if (this.batchForm.contractCodeList.length >  0 && this.batchForm.marketNo !='' && this.batchForm.contractMonth !='') {
                this.batchForm.contractCodeList  = this.batchForm.contractCodeList.toString()
                console.log(this.batchForm,'处理后表单数据');
                marginApi.batchDelete(this.batchForm).then(response => {
                    // console.log(response);
                    this.$message({
                        message: this.$t('common.optionSuccess'),
                        type: 'success'
                    })
                    this.batchAddVisible = false
                    this.fetchData()
                    location.reload()
                })
            }else{
                alert('信息填写不完整,无法提交')
            }
        },
        batchChange(vla){
            this.batchContractCode = [];
            this.batchForm.contractCodeList = []
            marginApi.getCodeByMarket(vla).then(res => {
                //    console.log(res,"1111");
                   res.data.forEach(ele => {
                       this.batchContractCode.push({label:ele.contractName,value:ele.contractCode})
                   });
                })
        },
    }
}
