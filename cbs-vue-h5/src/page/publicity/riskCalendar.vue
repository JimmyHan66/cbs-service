<template>
    <div class="box">
        <!-- <x-header title="风控日历"></x-header> -->
        <div class="titleImg">
            <h3 class="titleFont1">规避期货交易风险</h3>
            <h3 class="titleFont2">中原为您保驾护航</h3>
            <!-- <img src="static/images/title.png"> -->
        </div>
        <div class="calendarCon">
            <inline-calendar
                ref="calendar"
                v-model="riskDate"
                :start-date="startDate"
                :end-date="endDate"
                :replace-text-list="replaceTextList"
                :show-last-month="false"
                :show-next-month="false"
                :highlight-weekend="true"
                :return-six-rows="false"
                :hide-week-list="false"
                @on-change="onChange"
                @on-view-change="onViewChange"
                :render-function="renderFunction"
            >
            <!-- <div slot="each-day" :render-function="renderFunction">1</div> -->
            </inline-calendar>
        </div>
        <div>
             <div class="riskTipDiv">
                    <div class="riskTip">风险提示</div>
                    <div class="riskTipCon">关注风险,交易无忧</div>
            </div>
             <div class="riskTipDiv">
                    <div class="riskTip">{{currentDate}}</div>
                    <div class="riskTipCon">{{nongLi}}</div>
            </div>
            <group>
                <x-textarea placeholder="无"
                            v-model="content"
                            :show-counter="false"
                            :readonly="true"
                            :max=textMax
                            autosize>
                </x-textarea>
            </group>
        </div>
         <div>
            <group title="说明:以上保证金标准均为交易所标准。">
                <div class="explainDiv">
                    <div class="explainleft">
                   <div class="explainRest">
                    <img  class="explainImg" src="../../../static/images/xiu.png" alt="休息标志" style="width:20px;height:20px">
                    <p>:休假</p>
                   </div>
                    <div class="explainRest">
                    <img  class="explainImg" src="../../../static/images/ye.png" alt="夜标志" style="width:20px;height:20px">
                    <p>:无夜盘</p>
                   </div>
                   <div class="explainRest">
                    <img  class="explainImg" src="../../../static/images/dian.png" alt="点" style="width:20px;height:20px">
                    <p>:风险提示</p>
                   </div>
               </div>
               <!-- <div class="explainRight">
                   <p>郑：郑州商品交易所 </p>
                   <p>大：大连商品交易所</p>
                   <p>上：上海期货交易所 </p>
                   <p>能：上海国际能源交易中心</p>
                   <p>中：中国金融期货交易所</p>
               </div> -->
                </div>
               <div class="explainTip">如有疑问,欢迎致电结算风控部:0371-68599115</div>
            </group>
        </div>
        <br/><br/>
        <div>
            <img class="bottomVx" src="static/images/wxcode_ccfc.jpg">
            <img class="bottomLogo" src="static/images/logo_ccfc.jpg">

        </div>
    </div>
</template>
<script src="./riskCalendar.js">
</script>
<style >
.box{overflow: hidden;}
/* 横线提升修饰 */
/* .msgImg{position: absolute;left:40px;top:9px}
td {position: relative;}
.underline{border-bottom: solid 4px #dd2837;width: 10px;position: absolute;top:27px;left:25px} */

/* 圆点提示中img修饰 */
.msgImg{position: absolute;left:1.75rem;top:9px}
td {position: relative;}
.underDot{position: absolute;top:1.6rem;left:0.8rem}
/* 改变周末高亮颜色 */
td.is-week-6{color: red!important;}
td.is-week-0{color: red!important;}
/* 说明*/
/* .explainDiv{height: 130px;} */
.explainDiv{height:5rem;}
.explainImg{margin: 3px 0 0 15px;display: block;float: left;}
.explain p{float: left;margin-top: 5px;}
/* .explainRest{width: 150px;height: 30px;padding-top:25px; float: left;margin-left: 1rem;} */
/* .explainleft{float: left;} */
.explainleft{display: flex;justify-content: center;}
.explainRest{width: 150px;height: 30px;padding-top:25px; }
.explainRight{float: right;width: 200px;}
.explainTip{width: auto;height: 20px;color: #999;font-size:0.9rem;text-align: center;}
/* 标题背景图片 */
.titleImg{color: white;background: url("../../../static/images/title.png") no-repeat;width: 100%;height:150px;overflow: hidden;display: flex;flex-direction: column;justify-content: center;align-items: center;}
/* .titleFont1{width: auto;text-align: center;font-size: 1.8rem;margin-top: 1rem;}
.titleFont2{margin: 1rem 0 0 7.5rem;font-size: 1.8rem;} */
.titleFont1{font-size: 1.8rem;}
.titleFont2{margin-left:3rem;font-size: 1.8rem;}
/* 日历内容背景 */
.inline-calendar{background:url("../../../static/images/background.png") no-repeat;}
/* 风险提示 */
/* .riskTipDiv{height: 25px;}
.riskTip{margin-left: 1rem;float: left;}
.riskTipCon{float: left;width: 7.5rem;font-size: 14px;color: #999;margin-left: 4rem;} */
.riskTipDiv{height: 25px;display: flex;justify-content: space-between;}
.riskTip{margin-left: 1rem;}
.riskTipCon{font-size: 14px;color: #999;margin-right: 4rem;}
.weui-cells{margin-top: 0.33333em !important;}
/* 底部图标 */
.bottomVx{width: 20%;margin-left: 15px;}
.bottomLogo{width: 65%;}

/* 周末休字遮挡优化 */
th{text-align: left !important;padding-left:5px ;}
td{text-align: left !important;}
</style>
