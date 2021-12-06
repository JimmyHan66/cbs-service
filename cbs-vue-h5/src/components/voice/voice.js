import {Group, Cell } from 'vux'
import api from "../../fetch/api";
import { getApiUrl } from "../../util/tool";

export default {
    components: {
        Group, Cell
    },
    data () {
      return {
        voiceData:[]
      }
    },
    created() {
        this.init();
    },

    methods: {
        init() {
            const imgBase = getApiUrl() + "/file/getImgStream?idFile=";
            api.getCmsGoodVoice().then(res => {
                console.log(res);
                res.forEach(element => {
                    if (element.isDisplay) {
                        this.voiceData.push({ url: element.url, img: imgBase + element.idFile, title: element.title })
                    }
                });
            });
        },
        voiceClick(data){
            if(data.url == '#'){

            }else{
                location.href = data.url
            }
        }
    }
  }
