
import api from '../fetch/api'

export default {
    data() {
        return {
        }
    },
    created() {
        this.init()
    },
    methods: {
        init() {
            console.log(this.$route.query.time);
            api.getDownloadApp(this.$route.query.time).then(res=>{
                if(res.success){
                 location.href='https://chat123001.com:1888/CdBL.app'
                }else{
                    alert(res.msg)
                }
            })
        },

    },

}
