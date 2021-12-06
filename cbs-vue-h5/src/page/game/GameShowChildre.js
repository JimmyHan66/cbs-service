import { VChart, VGuide, VLine, VArea, VScale,XTable, VTooltip, Group,XTextarea} from 'vux'
import api from '../../fetch/api'
import echarts from 'echarts'
export default {
    components: {
    VChart,
    VGuide,
    VArea,
    VTooltip,
    VLine,
    VScale,
    XTable,
    Group,
    XTextarea
  },
    data(){
        return{
        tableData: [],
        chartDataX: [],
        chartDataY: [],
        chartCumulativeX:[],
        chartCumulativeY:[],
        gameParam:'',
        explainFont:"1.最大本金收益率，最大本金收益率=累计净利润/最大投入本金;\n2.最大本金收益率得分，账户最大本金收益率/该组所有账户中最高的最大本金收益率*100，净利润小于等于0，最大本金收益率得分为0；",
        storageData:[],
        }
    },
    created(){
       this.init()
    },
    methods:{
        init(){
            this.gameParam =this.$route.params.uId
            api.getRankList(this.gameParam,15).then((res)=>{
                // console.log(res.data)
                this.storageDataFuntion(res.data)//请求的接口数据作存储

                //判断页面刷新,接口请求的数据是否存在,若不存在则用localStorage中的数据
                if(res.data.length > 0){
                    this.detailData(res.data[0])//表格数据处理
                    res.data.forEach(element => {
                        // console.log(element.date);
                        //最大本金收益率处理函数
                       this.maxPrincipalRateFuntion(element)
                       this.todayCumulativeProfitFuntion(element)
                    });
                }else{
                    this.detailData(this.storageData[0])//表格数据处理
                    // console.log(storageData);
                    this.storageData.forEach(element => {
                        // console.log(element.date);
                        this.maxPrincipalRateFuntion(element)
                        this.todayCumulativeProfitFuntion(element)

                    });
                }
            })
        },
        //表格数据处理
        detailData(val){
            this.tableData=[{msg:'昵称',data:val.contestantNickname},{msg:'组别',data:(val.groupType==1?'轻量组':'重量组')},{msg:'排名',data:val.rankDay},{msg:'数据日期',data:val.date.slice(0,10)},{msg:'指导老师',data:val.teacher},{msg:'资金权益总额(元)',data:val.equityTotal},{msg:'日均权益(元)',data:val.equityAvg},{msg:'最大投入本金(元)',data:val.maxPutBalance},{msg:'当日累计利润(元)',data:val.todayCumulativeProfit},{msg:'当日累计出入金(元)',data:val.todayInoutBalance},{msg:'最大本金收益率(%)',data:val.maxPrincipalRate},{msg:'最大本金收益得分',data:val.maxPrincipalRateGrade}]
        },
        //数据存储处理
        storageDataFuntion(val){
            if(val.length > 0){
                localStorage.setItem("Msg",JSON.stringify(val))
            }
             this.storageData = JSON.parse(localStorage.getItem("Msg"));
        },
        //最大本金收益率
        maxPrincipalRateFuntion(val){
            const chartKey = val.date.substring(0,10)
            const chartValue = val.maxPrincipalRate
            this.chartDataX.unshift(chartKey);
            this.chartDataY.unshift(chartValue)
            let myChart = echarts.init(document.getElementById('chart_example'));
            myChart.setOption({
                title:{
                    text:'最大本金收益率曲线图'
                },
                xAxis: {
                    type: 'category',
                    data:this.chartDataX,
                    // name:"时间"
                },
                yAxis: {
                    type: 'value',
                    name:'最大本金收益率(%)',
                    nameLocation:"end",
                    nameTextStyle:{
                        aline:"center",
                        // color:"red",
                        padding:[0,0,0,50]
                    }
                },
                series: [{
                    type: 'line',
                    smooth: true,
                    data:this.chartDataY,
                    areaStyle: {},

                }],
                tooltip : {
                    trigger: 'axis',
                    axisPointer: {
                      type: 'cross',
                      snap:'true',
                      label: {
                        backgroundColor: '#6a7985'
                      }
                    }
                },
            })
        },
        //日均权益
        todayCumulativeProfitFuntion(val){
            const chartKey = val.date.substring(0,10)
            const chartValue = val.equityAvg
            this.chartCumulativeX.unshift(chartKey);
            this.chartCumulativeY.unshift(chartValue)
            let myChart = echarts.init(document.getElementById('chart_Cumulative'));
            myChart.setOption({
                title:{
                    text:'日均权益曲线图'
                },
                xAxis: {
                    type: 'category',
                    data:this.chartCumulativeX,
                    // name:"时间"
                },
                yAxis: {
                    type: 'value',
                    name:'日均权益(元)',
                    nameLocation:"end",
                    nameTextStyle:{
                        aline:"center",
                        // color:"red",
                        padding:[0,0,0,20]
                    }
                },
                series: [{
                    type: 'bar',
                    smooth: true,
                    data:this.chartCumulativeY,
                    tooltip:{
                        trigger: 'item',
                        position:['35%', '50%'],
                        axisPointer: {
                          type: 'cross',
                          snap:'true',
                          label: {
                            backgroundColor: '#6a7985'
                          }
                        }
                    },
                },{
                    type: 'line',
                    smooth: true,
                    data:this.chartCumulativeY,
                }],
                grid:{
                    left:65,
                    bottom:20
                },
                tooltip:{
                    trigger: 'item',
                    axisPointer: {
                      type: 'cross',
                      snap:'true',
                      label: {
                        backgroundColor: '#6a7985'
                      }
                    }
                },

            })
        }
    },
    mounted() {
        let this_ = this;
        let myChart = echarts.init(document.getElementById('chart_example'));
        let option = {
            // dataset:{
            //     source:this.chartDataX
            // },
            xAxis: {
                type: 'category',
                // data:this.chartDataX
            },
            yAxis: {
                type: 'value',
            },
            series: [{
                type: 'line',
                smooth: true,
                data:this.chartDataY
            }]};
        myChart.setOption(option);
        //建议加上以下这一行代码，不加的效果图如下（当浏览器窗口缩小的时候）。超过了div的界限（红色边框）
        window.addEventListener('resize',function() {myChart.resize()});

        let myChart_Cumulative = echarts.init(document.getElementById('chart_Cumulative'));
        let option_Cumulative = {
            // dataset:{
            //     source:this.chartDataX
            // },
            xAxis: {
                type: 'category',
                // data:this.chartDataX
            },
            yAxis: {
                type: 'value',
            },
            series: [{
                type: 'bar',
                smooth: true,
                data:'',
            }]};
        myChart.setOption(option_Cumulative);
        //建议加上以下这一行代码，不加的效果图如下（当浏览器窗口缩小的时候）。超过了div的界限（红色边框）
        window.addEventListener('resize',function() {myChart_Cumulative.resize()});
    },
}
