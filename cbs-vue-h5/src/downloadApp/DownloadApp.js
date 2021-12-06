
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
                    // this.$router.push({path: '/DownloadAppChildt?time='+this.dateFormat(new Date())})
                    this.$router.push({path: '/DownloadAppChild',query:{ time:this.dateFormat(new Date())}})
        },
        dateFormat(dateData) {
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
            return y  + m + d + hh +mm +ss

        },
    },

}
