import request from '@/utils/request'
export default {
    getList:function(params) {
        return request({
            url: '/publicity/riskcalendar/list',
            method: 'get',
            params
        })
    },
    add:function(params) {
        return request({
            url: '/publicity/riskcalendar',
            method: 'post',
            params
        })
    },
    update:function(params) {
        return request({
            url: '/publicity/riskcalendar',
            method: 'PUT',
            params
        })
    },
    remove:function(id) {
        return request({
            url: '/publicity/riskcalendar',
            method: 'delete',
            params: {
                id: id
            }
        })
    }
}
