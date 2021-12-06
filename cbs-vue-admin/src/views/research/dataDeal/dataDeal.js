import dataDealApi from '@/api/research/dataDeal'
import hisBasisApi from '@/api/research/hisBasis'
import interSpreadApi from '@/api/research/interSpread'
import permission from '@/directive/permission/index.js'
import ECharts from 'vue-echarts/components/ECharts'
import 'echarts/lib/chart/bar'
import 'echarts/lib/chart/line'
import 'echarts/lib/chart/pie'
import 'echarts/lib/chart/map'
import 'echarts/lib/chart/radar'
import 'echarts/lib/chart/scatter'
import 'echarts/lib/chart/effectScatter'
import 'echarts/lib/component/tooltip'
import 'echarts/lib/component/polar'
import 'echarts/lib/component/geo'
import 'echarts/lib/component/legend'
import 'echarts/lib/component/title'
import 'echarts/lib/component/visualMap'
import 'echarts/lib/component/dataset'
import 'echarts/map/js/world'
import elementResizeDetectorMaker from "element-resize-detector";

export default {
    components: {
        chart: ECharts
    },
    directives: {permission},
    data() {
        return {
            activeName: null,
            chartShow: false,
            formVisible: false,
            formTitle: '品种数据维护',
            isAdd: true,
            form: {},
            listQuery: {
                page: 1,
                limit: 20,
                contractCode: ''
            },
            total: 0,
            list: null,
            listLoading: false,
            selRow: {},
            contractName: '',
            tableNameEn: '',
            contractList: [],
            tableList: [],
            fieldList: [],
            option: {
                title: {
                    text: '图表'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: []
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                toolbox: {
                    feature: {
                        saveAsImage: {}
                    }
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: []
                },
                yAxis: {
                    type: 'value'
                },
                series: []
            }
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
    mounted() {
        //绑定echart图表跟随窗口大小自动缩放
        let that = this
        let erd = elementResizeDetectorMaker()
        erd.listenTo(document.getElementById("dataDeal"), (element) => {
            that.$nextTick(() => {
                that.$refs.lineChart.resize()

            })
        })
    },
    methods: {
        init() {
            this.activeName = "dataEdit"
            dataDealApi.queryAllContract().then(response => {
                console.log(response.data)
                this.contractList = response.data
            })
        },
        search() {
            this.fetchData()
        },
        reset() {
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
            }
        },
        add() {
            this.formVisible = true
            this.isAdd = true

            if (this.$refs['form'] !== undefined) {
                this.$refs['form'].resetFields()
            }
            //如果表单初始化有特殊处理需求,可以在resetForm中处理
        },
        save() {
            console.log('提交的form')
            console.log(this.form)
            this.$refs['form'].validate((valid) => {
                if (valid) {
                    if (this.form.id) {
                        this.updateGroup(this.form)
                    } else {
                        this.addGroup(this.form)
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
                    dataDealApi.remove(id).then(response => {
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
        changeContract() {
            dataDealApi.getTableByContract(this.listQuery.contractCode).then(response => {
                console.log('查询出的品种表结果')
                console.log(response.data)
                this.tableList = response.data
            })
        },
        changeTable() {
            // console.log(this.$refs['tableSel'].name)
            dataDealApi.getFieldByTable(this.tableNameEn).then(response => {
                console.log('查询出的列结果')
                console.log(response.data)
                this.fieldList = response.data
                this.fetchData()
            })
            if (this.activeName === 'dataChart' && this.tableNameEn !== ''
                && this.listQuery.contractCode !== '') {
                this.chartLoad()
            }
        },
        handleClick(tab, event) {
            this.activeName = tab.name
            console.log(this.activeName);
            if (this.activeName === 'dataChart' && this.tableNameEn !== ''
                && this.listQuery.contractCode !== '') {
                this.chartLoad()
            }
        },
        fetchData() {
            this.listLoading = true
            if (this.tableNameEn === 't_research_hisbasis') {
                hisBasisApi.getList(this.listQuery).then(response => {
                    console.log(response.data)
                    this.list = response.data.records
                    this.listLoading = false
                    this.total = response.data.total
                })
            } else if (this.tableNameEn === 't_research_interspread') {
                interSpreadApi.getList(this.listQuery).then(response => {
                    this.list = response.data.records
                    this.listLoading = false
                    this.total = response.data.total
                })
            }
        },
        updateGroup(formData) {
            if (this.tableNameEn === 't_research_hisbasis') {
                hisBasisApi.update(formData).then(response => {
                    this.$message({
                        message: this.$t('common.optionSuccess'),
                        type: 'success'
                    })
                    this.fetchData()
                    this.formVisible = false
                })
            } else if (this.tableNameEn === 't_research_interspread') {
                interSpreadApi.update(formData).then(response => {
                    this.$message({
                        message: this.$t('common.optionSuccess'),
                        type: 'success'
                    })
                    this.fetchData()
                    this.formVisible = false
                })
            }
        },
        addGroup(formData) {
            if (this.tableNameEn === 't_research_hisbasis') {
                hisBasisApi.add(formData).then(response => {
                    this.$message({
                        message: this.$t('common.optionSuccess'),
                        type: 'success'
                    })
                    this.fetchData()
                    this.formVisible = false
                })
            } else if (this.tableNameEn === 't_research_interspread') {
                interSpreadApi.add(formData).then(response => {
                    this.$message({
                        message: this.$t('common.optionSuccess'),
                        type: 'success'
                    })
                    this.fetchData()
                    this.formVisible = false
                })
            }
        },
        chartLoad() {
            this.chartShow = false
            // 准备条目
            this.fieldList.forEach(item => {
                this.option.legend.data.push(item.tableFieldName)
            })
            if (this.tableNameEn === 't_research_hisbasis') {

                // 准备数据
                hisBasisApi.getHisBasisChart(this.listQuery.contractCode).then(response => {
                    console.log(response.data)
                    // 横坐标
                    this.option.xAxis.data = response.data[0].dateList
                    // 删除第一个元素，第一个元素用来存横坐标的
                    response.data.shift()
                    this.option.series = response.data
                    this.chartShow = true
                })
            } else if (this.tableNameEn === 't_research_interspread') {
                // 准备数据
                interSpreadApi.getInterSpreadChart(this.listQuery.contractCode).then(response => {
                    console.log(response.data)
                    // 横坐标
                    this.option.xAxis.data = response.data[0].dateList
                    // 删除第一个元素，第一个元素用来存横坐标的
                    response.data.shift()
                    this.option.series = response.data
                    this.chartShow = true
                })
            }
        },


    }
}
