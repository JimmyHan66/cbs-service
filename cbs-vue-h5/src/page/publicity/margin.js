import {
    XHeader, XInput, Group, XButton, Cell,
    CellFormPreview, CellBox, PopupPicker, Popup, Flexbox,
    FlexboxItem, Loading, Divider, XTable
} from 'vux'
import footMenu from '../../components/footer/footMenu'
import api from '../../fetch/api'

export default {
    components: {
        XHeader, XInput, Group, XButton, footMenu, Cell,
        CellFormPreview, CellBox, PopupPicker, Popup, Flexbox,
        FlexboxItem, Loading, Divider, XTable
    },
    data() {
        return {
            marketNo: undefined,
            contractCode: undefined,
            exchangeList: [[
                {name: '全部', value: '0'},
                {name: '上海期货交易所', value: '1'},
                {name: '大连商品交易所', value: '2'},
                {name: '郑州商品交易所', value: '3'},
                {name: '中国金融期货交易所', value: '4'},
                {name: '上海国际能源交易中心', value: '5'}
            ]],
            varietyList: [],
            arr0: [{name: '全部', value: '0'}],
            showContent: false,
            marginList: [],
            dataList: [],
            show: false,
            marginTitle: '全部保证金标准',

            multiplierUnit: '',
            priceUnit: '',
            multiplier: 0,
            lastPrice: 0,
            marginRatio: 0,
            amount: 1,
            needMargin: 0
        }
    },
    watch: {
        marketNo: function (val) {
            this.exchangeList[0].forEach(item => {
                if (item.value == val) {
                    if (val == '0') {
                        this.marginTitle = '全部保证金标准'
                    } else {
                        this.marginTitle = item.name
                    }
                }
            })
        }
    },
    created() {
        // 隐藏底部导航栏
        // this.$store.state.showBottomNav = false
        this.init()
    },
    methods: {
        init() {
            this.queryMarginList()
            this.marginList = this.dataList
        },
        queryMarginList() {
            api.getMarginList().then(res => {
                res.data.forEach(item => {
                    const margin = {
                        contractName: item.contractName,
                        contractCode: item.contractCode,
                        marketNo: item.marketNo.toString(),
                        multiplier: item.multiplier,
                        multiplierUnit: item.multiplierUnit,
                        priceUnit: item.priceUnit,
                        exchangeMargin: item.exchangeMargin,
                        companyMargin: item.companyMargin,
                        quoteChange: item.quoteChange,
                        showContent: false,
                        remark: item.remark,
                        specialMarginList: item.specialMarginList
                    }
                    this.dataList.push(margin)
                })
            })
        },
        exchangeChange(value) {
            // 交易所改变后，重置品种列表，按交易所过滤
            this.varietyList.length = 0
            if (value == '0') {
                this.varietyList.push(this.arr0)
            } else {
                var array = []
                array.push(this.arr0[0])
                this.dataList.forEach(item => {
                    if (item.marketNo == value) {
                        const variety = {
                            name: item.contractName,
                            value: item.contractCode
                        }
                        array.push(variety)
                    }
                })
                this.varietyList.push(array)
            }
            // 默认选择全部
            this.contractCode = '0'
            this.loadMarginData(value, this.contractCode)
        },
        varietyChange(value) {
            this.loadMarginData(this.marketNo, value)
        },
        loadMarginData(marketNo, contractCode) {
            // 交易所为全部时取全部数据
            if (marketNo == '0') {
                this.marginList = this.dataList
            } else {
                // 否则根据市场和品种进行过滤显示
                var array = []
                this.dataList.forEach(item => {
                    if (item.marketNo == marketNo && (contractCode == '0' || item.contractCode == contractCode)) {
                        array.push(item)
                    }
                })
                this.marginList = array
            }
        },
        callcal(item) {
            this.show = true
            this.lastPrice = 0
            this.needMargin = 0
            this.multiplierUnit = item.multiplierUnit
            this.priceUnit = item.priceUnit
            this.multiplier = item.multiplier
            // 默认为公司标准保证金比例
            this.marginRatio = item.companyMargin

            // 调用新浪行情接口获取最新价
            api.getFuturesHq(item.contractCode, item.marketNo).then(res => {
                console.log(res.data)
                if (item.marketNo == '4') {
                    // 股指期货数组下表[3]为最新价
                    this.lastPrice = res.data[3]
                } else {
                    // 普通期货数组下表[8]为最新价
                    this.lastPrice = res.data[8]
                }
                console.log(this.lastPrice)

            })
        },
        calMargin() {
            // 计算保留两位小数
            this.needMargin = (this.multiplier * this.lastPrice * this.marginRatio * this.amount / 100).toFixed(2)
        }
    }
}
