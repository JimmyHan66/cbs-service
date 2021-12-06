import {XHeader, XInput, Group, XTextarea, XButton, InlineCalendar, Icon} from 'vux'
import calendarTransform from '../../util/calendarTransform'
import api from '../../fetch/api'

export default {
    components: {
        XHeader, XInput, Group, XTextarea, XButton, InlineCalendar, Icon
    },
    data() {
        return {
            riskDate: '',
            startDate: '2021-03-01',
            endDate: '2021-12-31',
            replaceTextList: {'TODAY': '今'},
            content: '',
            mockArr: [],
            imgExplain: `图标示例：</br> 文字示例`,
            textExplain: '文字示例',
            gongLi: '',
            textMax: 10,
            currentDate:''
        }
    },
    created() {
        this.init()
    },
    methods: {
        init() {
            // 初始化当月每日风控标志信息
            let time = new Date()
            let month = this.dateFormat(time, 'month')
            api.getCalendarByMonth(month).then(res => {
                // console.log('打印 getCalendarByMonth 接口返回')
                // console.log(res)
                if (res.success) {
                    this.mockArr = res.data
                } else {
                    this.mockArr = []
                }
            })
            // 选中当前日期，获取当前系统日期风控提示信息
            this.riskDate = this.dateFormat(time, 'day')
            //  显示当日农历信息
            let nong = calendarTransform.solar2lunar(time.getFullYear(),time.getMonth(),time.getDate())
            if(nong.festival){
                this.nongLi = nong.IMonthCn + nong.IDayCn +'('  + nong.festival + ')'
            }else if(nong.lunarFestival){
                this.nongLi = nong.IMonthCn + nong.IDayCn +'('  + nong.lunarFestival + ')'
            }else if(nong.Term){
                this.nongLi = nong.IMonthCn + nong.IDayCn +'(' + nong.Term + ')'
            }else{
                this.nongLi = nong.IMonthCn + nong.IDayCn
            }
        },
        dateFormat(dateData, type) {
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

            if (type === 'month') {
                return y + '-' + m
            } else if (type === 'day') {
                return y + '-' + m + '-' + d
            } else {
                return y + '-' + m + '-' + d + ' ' + hh + ':' + mm + ':' + ss
            }
        },
        onChange(date) {
        // 农历处理
            this.currentDate = date;
            let currenArr = date.split('-');
            let currentYear = currenArr[0];
            let currentMonth = '';
            let currentDate = '';
            if (currenArr[1] < 10) {
                currentMonth = currenArr[1].substr(1, 1)
            } else {
                currentMonth = currenArr[1]
            }
            if (currenArr[2] < 10) {
                currentDate = currenArr[2].substr(1, 1)
            } else {
                currentDate = currenArr[2]
            }
            let nong = calendarTransform.solar2lunar(currentYear,currentMonth,currentDate)
            // console.log(nong);
            if(nong.festival){
                this.nongLi = nong.IMonthCn + nong.IDayCn +'('  + nong.festival + ')'
            }else if(nong.lunarFestival){
                this.nongLi = nong.IMonthCn + nong.IDayCn +'('  + nong.lunarFestival + ')'
            }else if(nong.Term){
                this.nongLi = nong.IMonthCn + nong.IDayCn +'(' + nong.Term + ')'
            }else{
                this.nongLi = nong.IMonthCn + nong.IDayCn
            }
            // console.log(this.nongLi);

            // 请求每日信息
            api.getRiskInfoByDate(date).then(res => {
                // console.log('打印 getRiskInfoByDate 接口返回')
                // console.log(res)
                if (res.success) {
                    this.content = res.data.riskContent
                    this.content = this.content + '          '
                    this.textMax = this.content.length
                } else {
                    this.content = '无'
                }
            })
        },
        onViewChange(value) {
            let month = ''
            if (value.month < 10) {
                month = value.year + '-0' + value.month
            } else {
                month = value.year + '-' + value.month
            }
            // console.log(month)
            api.getCalendarByMonth(month).then(res => {
                // console.log('打印 getCalendarByMonth 接口返回')
                // console.log(res)
                if (res.success) {
                    this.mockArr = res.data
                } else {
                    this.mockArr = []
                }
            })
        },
        renderFunction(row, list, a) {
            // console.log(a);
            for (let index = 0; index < this.mockArr.length; index++) {
                const ele = this.mockArr[index];
                // 下划线
                // if (a.formatedDate === ele.riskDate && ele.isClosed && !ele.isContent) {//休息标志
                //     return '<div class="msgDiv"><img class="msgImg" src="../../../static/images/xiu.png" style="width:20px;height:20px;position: absolute;left:40px;top:9px"/></div>'
                // } else if (a.formatedDate === ele.riskDate && ele.isNoNight && !ele.isContent) {//夜盘标志
                //     return '<img class="msgImg" src="../../../static/images/ye.png" style="width:20px;height:20px;position: absolute;left:40px;top:9px"/>'
                // } else if (a.formatedDate === ele.riskDate && ele.isContent && !ele.isClosed && !ele.isNoNight) {//下划线
                //     return '<div class="underline"></div>'
                // } else if (a.formatedDate === ele.riskDate && ele.isContent && ele.isNoNight) {//下划线和夜盘标志
                //     return '<div class="underline/><img class="msgImg" src="../../../static/images/ye.png" style="width:20px;height:20px;position:absolute;top:-22px;left:40px"/>'
                // } else if (a.formatedDate === ele.riskDate && ele.isContent && ele.isClosed) { //下划线和休息标志
                //     return '<div class="underline/> <img class="msgImg" src="../../../static/images/xiu.png" style="width:20px;height:20px;position:absolute;top:-22px;left:40px"/>'
                // }

                //红点
                //  if (a.formatedDate === ele.riskDate && ele.isClosed && !ele.isContent) {//休息标志
                //     return '<div class="msgDiv"><img class="msgImg" src="../../../static/images/xiu.png" style="width:20px;height:20px;"/></div>'
                // } else if (a.formatedDate === ele.riskDate && ele.isNoNight && !ele.isContent) {//夜盘标志
                //     return '<div class="msgDiv"><img class="msgImg" src="../../../static/images/ye.png" style="width:20px;height:20px;"/></div>'
                // } else if (a.formatedDate === ele.riskDate && ele.isContent && !ele.isClosed && !ele.isNoNight) {//下划线
                //     return '<div class="underDot" style=" width:5px;height:5px;background-color:#dd2837;border-radius:50%;"/>'
                // } else if (a.formatedDate === ele.riskDate && ele.isContent && ele.isNoNight) {//下划线和夜盘标志
                //     return '<div class="underDot" style=" width:5px;height:5px;background-color:#dd2837;border-radius:50%;"/><img class="msgImg" src="../../../static/images/ye.png" style="width:20px;height:20px;position: absolute;top:-18px;left:13px"/>'
                // } else if (a.formatedDate === ele.riskDate && ele.isContent && ele.isClosed) { //下划线和休息标志
                //     return '<div class="underDot" style=" width:5px;height:5px;background-color:#dd2837;border-radius:50%;"/><img class="msgImg" src="../../../static/images/xiu.png" style="width:20px;height:20px;position: absolute;top:-18px;left:13px"/>'
                // }

                // icon图片
                if (a.formatedDate === ele.riskDate && ele.isClosed && !ele.isContent) {//休息标志
                    return '<div class="msgDiv"><img class="msgImg" src="../../../static/images/xiu.png" style="width:20px;height:20px;"/></div>'
                } else if (a.formatedDate === ele.riskDate && ele.isNoNight && !ele.isContent) {//夜盘标志
                    return '<div class="msgDiv"><img class="msgImg" src="../../../static/images/ye.png" style="width:20px;height:20px;"/></div>'
                } else if (a.formatedDate === ele.riskDate && ele.isContent && !ele.isClosed && !ele.isNoNight) {//下划线
                    return '<div class="underDot" style=" width:5px;height:5px;background-color:#dd2837;border-radius:50%;"/>'
                } else if (a.formatedDate === ele.riskDate && ele.isContent && ele.isNoNight) {//下划线和夜盘标志
                    return '<div class="underDot" style=" width:5px;height:5px;background-color:#dd2837;border-radius:50%;"/><img class="msgImg" src="../../../static/images/ye.png" style="width:20px;height:20px;position: absolute;top:-18px;left:13px"/>'
                } else if (a.formatedDate === ele.riskDate && ele.isContent && ele.isClosed) { //下划线和休息标志
                    return '<div class="underDot" style=" width:5px;height:5px;background-color:#dd2837;border-radius:50%;"/><img class="msgImg" src="../../../static/images/xiu.png" style="width:20px;height:20px;position: absolute;top:-18px;left:13px"/>'
                }
            }
        },
    },

}
