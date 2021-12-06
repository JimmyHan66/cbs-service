<template>
    <div>
        <div class="formImg">
            <!-- <x-button mini type="primary" class="signButton" @click.native="showDialog=true">立即报名</x-button> -->
        <button class="btn btn--stripe btn--radius" @click="showDialog=true">立即报名</button>
        </div>

        <div v-transfer-dom>
            <x-dialog v-model="showDialog" class="dialog">
                <div class="img-box">
                    <img src="static/images/logo_ccfc.jpg" style="max-width:100%">
                    <group>
                        <x-input title="姓名" v-model="form.contestantName"
                                 :show-clear="false"
                                 text-align="right"
                                 placeholder="真实姓名(必填)"
                                 :required="true"
                                 is-type="china-name">
                        </x-input>
                        <x-input title="资金账号" v-model="form.fundAccount"
                                 :show-clear="false"
                                 text-align="right"
                                 placeholder="9位资金账号(必填)"
                                 keyboard="number"
                                 :required="true">
                        </x-input>
                        <x-input title="参赛昵称" v-model="form.contestantNickname"
                                 :show-clear="false"
                                 text-align="right"
                                 placeholder="昵称(选填)">
                        </x-input>
                        <x-input title="手机号码" v-model="form.contestantPhoneNo"
                                 ref="mobile"
                                 :show-clear="false"
                                 text-align="right"
                                 placeholder="手机号码(必填)"
                                 keyboard="number"
                                 :required="true"
                                 is-type="china-mobile">
                        </x-input>
                        <x-input title="所在地" v-model="form.contestantAddress"
                                 :show-clear="false"
                                 text-align="right"
                                 placeholder="城市(选填)">
                        </x-input>
                        <x-input title="指导老师" v-model="form.teacher"
                                 :show-clear="false"
                                 text-align="right"
                                 placeholder="指导老师(选填)">
                        </x-input>
                        <x-switch title="是否量化" v-model="form.isQuantify"></x-switch>
                        <x-switch title="是否对冲套利" v-model="form.isHedgeArbitrage"></x-switch>
                        <x-switch title="是否机构" v-model="form.isAgency"></x-switch>
                        <x-input title="机构产品备案号" v-model="form.agencyNo"
                                 :show-clear="false"
                                 text-align="right"
                                 placeholder="若是机构,必填">
                        </x-input>
                    </group>

                    <br>
                    <x-button @click.native="submit" type="primary" style="width:70%;">提交</x-button>
                    <toast v-model="showToast" :type=toastType :text=toastText position="middle"></toast>
                </div>
                <div @click="showDialog=false">
                    <span class="vux-close"></span>
                </div>
            </x-dialog>
        </div>

        <div>
            <img src="static/images/wxcode_ccfc.png">
        </div>
    </div>
</template>
<script src="./gameSignUp.js">
</script>
<style lang="less" scoped>
    @import '~vux/src/styles/close';

    .formImg {
        background: url("../../../static/images/gameSign1.jpg") no-repeat;
        width: 100%;
        height: 750px;
        background-size: 100% 100%;
        overflow: hidden;
    }

    .signButton {
        margin: 30rem 0 0 45%;
    }

    .dialog {
        .img-box {
            height: 39rem;
            overflow: hidden;
        }

        .vux-close {
            margin-top: 8px;
            margin-bottom: 8px;
        }
    }
    @-webkit-keyframes stripe-slide {
  0% {
    background-position: 0% 0;
  }
  100% {
    background-position: 100% 0;
  }
}
@keyframes stripe-slide {
  0% {
    background-position: 0% 0;
  }
  100% {
    background-position: 100% 0;
  }
}
// body {
//   width: 100%;
//   height: 100vh;
//   display: flex;
//   justify-content: center;
//   align-items: center;
//   flex-direction: column;
//   font-family: sans-serif;
// }

.btn {
  overflow: visible;
  margin: 0;
  padding: 0;
  border: 0;
  background: transparent;
  font: inherit;
  line-height: normal;
  cursor: pointer;
  -moz-user-select: text;
  display: block;
  text-decoration: none;
  text-transform: uppercase;
  padding: 6px 30px 10px;
  background-color: #c7cfb7;
  color:#1e212d;
  border: 2px solid #666;
  border-radius: 6px;
  margin-bottom: 16px;
  transition: all 0.5s ease;
   margin: 30rem 0 0 34%;
   font-size: 21px;
}
.btn:-moz-focus-inner {
  padding: 0;
  border: 0;
}
.btn--stripe {
  overflow: hidden;
  position: relative;
}
.btn--stripe:after {
  content: "";
  display: block;
  height: 7px;
  width: 100%;
  background-image: repeating-linear-gradient(45deg, #666, #666 1px, transparent 2px, transparent 5px);
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  border-top: 1px solid #666;
  position: absolute;
  left: 0;
  bottom: 0;
  background-size: 7px 7px;
}
// .btn--stripe:hover {
//   background-color: #666;
//   color: #fff;
//   border-color: #000;
// }
.btn--stripe:hover:after {
  background-image: repeating-linear-gradient(45deg, #fff, #fff 1px, transparent 2px, transparent 5px);
  border-top: 1px solid #000;
  -webkit-animation: stripe-slide 12s infinite linear forwards;
          animation: stripe-slide 12s infinite linear forwards;
}
.btn--large {
  width: 50%;
}
.btn--radius {
  border-radius: 36px;
}
</style>
