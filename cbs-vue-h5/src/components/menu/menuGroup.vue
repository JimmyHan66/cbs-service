<template>
    <div class="menuDiv">
        <flexbox :gutter="0" wrap="wrap">
            <flexbox-item
                v-for="(item,i) in menuData"
                :key="i"
                :span="1 / 4"
            >
                <div @click="flexClick(item)">
                    <!-- 调接口获取图标 -->
                    <img :src="item.img" alt="九宫格1" />
                    <p>{{ item.title }}</p>
                </div>
            </flexbox-item>
        </flexbox>
    </div>
</template>
<style scoped>
.menuDiv{padding-top:20px;}
.vux-flexbox-item img {
    width: 2rem;
}
.vux-flexbox-item > div {
    text-align: center;
    padding-top: 0.5rem;
}
.vux-flexbox-item > div > p {
    color: black;
    font-size: 0.8rem;
}
</style>
<script>
import { Flexbox, FlexboxItem } from "vux";
import api from "../../fetch/api";
import { getApiUrl } from "../../util/tool";
//import * as types from "../../store/types";

export default {
    components: {
        Flexbox,
        FlexboxItem
    },
    data() {
        return {
            //menuData: this.getMenuData()
            menuData: []
        };
    },
    created() {
        this.init();
    },
    methods: {
        init() {
            const imgBase = getApiUrl() + "/file/getImgStream?idFile=";
            api.getCmsChannel().then(res => {
                console.log(res);
                let arr = []
                res.forEach(element => {
                    if (element.isDisplay) {
                        arr.push({ url: element.url, img: imgBase + element.idFile, title: element.title })
                    }
                });
                if(arr.length > 7){
                    this.menuData = arr.slice(0,8)
                }else{
                    this.menuData = arr
                }
            });
            console.log(this.menuData);
        },
        flexClick(data) {
            if(data.url == '#'){

            }else{
                location.href = data.url
            }
        }
    }
};
</script>
