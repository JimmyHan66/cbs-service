import request from '@/utils/request'
export default {
    getList:function(params) {
        return request({
            url: '/research/interspread/list',
            method: 'get',
            params
        })
    },
    add:function(params) {
        return request({
            url: '/research/interspread',
            method: 'post',
            params
        })
    },
    update:function(params) {
        return request({
            url: '/research/interspread',
            method: 'PUT',
            params
        })
    },
    remove:function(id) {
        return request({
            url: '/research/interspread',
            method: 'delete',
            params: {
                id: id
            }
        })
    },
    getInterSpreadChart: function (params) {
        return request({
            url: '/research/interspread/getInterSpreadChart?contractCode=' + params,
            method: 'get'
        })
    },
}
