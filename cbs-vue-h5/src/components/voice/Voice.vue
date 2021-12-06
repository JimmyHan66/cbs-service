<template>
    <div class="box">
        <group>
            <cell
                is-link
                title="中原好声音"
                link="https://mp.weixin.qq.com/mp/homepage?__biz=MzA3NDE5NDMxNg==&hid=23&sn=96f3cdb1ca4f5fe0cd01ceeb6888f2d9"
            ></cell>
        </group>
        <template>
            <el-carousel
                type="card"
                height="150px"
                arrow="never"
                :autoplay="false"
            >
                <el-carousel-item v-for="(item, i) in voiceData" :key="i">
                    <div class="voice-item">
                        <!-- <img class="voice-item-background" src="https://img2.baidu.com/it/u=3617244256,3830439281&fm=26&fmt=auto&gp=0.jpg" alt="风景"> -->
                        <div
                            class="voice-item-background"
                            @click="voiceClick(item)"
                            :style="{
                                background: 'url(' + item.img + ')',
                                backgroundRepeat: 'no-repeat',
                                backgroundSize: 'cover'
                            }"
                        >
                            <!-- <h5 class="medium">{{ item.title }}</h5> -->
                        </div>
                    </div>
                </el-carousel-item>
            </el-carousel>
        </template>
        <div class="bottomLine"></div>
    </div>
</template>
<style>
/* .el-carousel__item .voice-item-background{
    height: 80px;

} */
.el-carousel__item .voice-item-background {
    height: 150px;
    /* background: url("https://img2.baidu.com/it/u=3617244256,3830439281&fm=26&fmt=auto&gp=0.jpg") no-repeat; */
    /* background-repeat: no-repeat; */
}
.el-carousel__item .medium {
    vertical-align: bottom;
    line-height: 20px;
    text-align: center;
    color: #000;
    opacity: 0.75;
    position: absolute;
    bottom: 5px;
    font-weight: unset;
}

/* .el-carousel__item:nth-child(2n) {
    background-color: #999;
  }

  .el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  } */
.el-carousel__indicators {
    display: none;
}
/* 中原好声音 标题修饰 */
.vux-label {
    font-size: 19px !important ;
    font-weight: bolder;
}
.bottomLine {
    height: 5px;
    background: #f0f2f9;
    margin-top: 10px;
}
</style>
<script src="./voice.js"></script>
