<template>
    <div class="box">
        <div class="title">
            <img src="../../../static/images/article.png" alt=" ">
            今日<span>头条</span>
            <a href="https://mp.weixin.qq.com/mp/homepage?__biz=MzA3NDE5NDMxNg==&hid=16&sn=ff618a4b9eb1a4b23ac4513f99fbe11e">
                <img class="mImg" src="../../../static/images/more.png" alt="更多">
            </a>
        </div>
        <ul>
            <li v-for="(item,i) in articleData" :key="i">
                <a :href="item.url">
                    <div class="article-title">{{item.title}}</div>
                    <div class="article-img">
                        <img :src="item.img" alt=" ">
                    </div>
                </a>
                <p class="time">{{item.time}}</p>
            </li>
        </ul>
    </div>
</template>

<script>
import api from "../../fetch/api";
import { getApiUrl } from "../../util/tool";
export default {
    data () {
      return {
        articleData:[]
      }
    },
    created() {
        this.init();
    },
    methods: {
        init() {
            const imgBase = getApiUrl() + "/file/getImgStream?idFile=";
            api.getCmsArticle().then(res => {
                console.log(res);
                res.forEach(element => {
                    if (element.isDisplay) {
                        this.articleData.push({ url: element.url, img: imgBase + element.idFile, title: element.title,time:element.modifyTime })
                    }
                });
            });
            console.log(this.articleData);
        },
    }
}
</script>

<style>
.box{overflow: hidden;}
/* 今日头条--标题修饰 */
.title {padding-top:10px;font-size: 20px;font-weight:bold;line-height:inherit;}
.title img{
    width: 20px;
    padding-left: 15px;
}
.title > span{color: tomato;}
.mImg{float: right;padding-right: 15px;padding-top: 5px;}
/* 今日头条--文章修饰 */
.box >ul{padding-left: 15px;}
.box >ul li{height: 97px;width: auto;padding-top: 12px;border-top: 1px solid #e2e2e2;list-style-type: none;}
li>a{display: inline-block;width: 100%}
.article-title{
    float: left;
    color: #000;
    max-width:230px ;
    max-height: 74px;
    display: -webkit-box;
                    -webkit-box-orient: vertical;
                    -webkit-line-clamp: 4;
    overflow: hidden;
    font-size: 17px;
    line-height: 24px;
}
.article-img{
    float: right;
    width: 90px;
    height: 74px;
    padding-right: 20px;
}
.article-img>img{
    width: 90px;
    height: 74px;
}
.time{height:12px;position: relative;top:-5px;font-size: 10px;color:#757575 ;}
</style>
