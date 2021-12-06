import request from '@/utils/request'
export default {
    getList:function(params) {
        return request({
            url: '/research/hisbasis/list',
            method: 'get',
            params
        })
    },
    add:function(params) {
        return request({
            url: '/research/hisbasis',
            method: 'post',
            params
        })
    },
    update:function(params) {
        return request({
            url: '/research/hisbasis',
            method: 'PUT',
            params
        })
    },
    remove:function(id) {
        return request({
            url: '/research/hisbasis',
            method: 'delete',
            params: {
                id: id
            }
        })
    },
    getHisBasisChart: function (params) {
        return request({
            url: '/research/hisbasis/getHisBasisChart?contractCode=' + params,
            method: 'get'
        })
    },
}
