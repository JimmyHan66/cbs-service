import { TransferDom, Panel, Swiper, SwiperItem, GroupTitle } from 'vux'
import footMenu from '../../components/footer/footMenu'
import menuGroup from '../../components/menu/menuGroup'
import productList from '../../components/product/productList'
import voice from '../../components/voice/Voice.vue'
import api from '../../fetch/api'
import { getApiUrl } from '../../util/tool'
import headLines from "../../components/headLines/headLine.vue"
export default {
    components: {
        TransferDom, footMenu, Panel, Swiper, SwiperItem, menuGroup, productList, GroupTitle, voice, headLines
    },
    data() {
        return {
            productList: [],
            solutionList: [],
            newsList: [],
            banner: [],
            bannerArr: [],
            bannerIndex: 0
        }
    },
    created() {
        this.init()
    },

    methods: {
        init() {
            // //图片加ip
            const imgBase = getApiUrl() + '/file/getImgStream?idFile='
            api.getCmsBanner().then(res => {
                console.log(res);
                this.bannerArr = res
                this.bannerArr.forEach(element => {
                    if (element.type == "true") {
                        this.banner.push({ url: element.url, img: imgBase + element.idFile, title: element.title })
                    }
                });
                console.log(this.banner);
            })
        },
        bannerChange(index) {
            this.bannerIndex = index
        },
        handelClick(data){
            if(data.url == '#'){

            }else{
                location.href = data.url
            }
        }
    }
}
