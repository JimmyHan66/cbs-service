import request from '@/utils/request'
export default {
    getList:function(params) {
        return request({
            url: '/research/contractfield/list',
            method: 'get',
            params
        })
    },
    add:function(params) {
        return request({
            url: '/research/contractfield',
            method: 'post',
            params
        })
    },
    update:function(params) {
        return request({
            url: '/research/contractfield',
            method: 'PUT',
            params
        })
    },
    remove:function(id) {
        return request({
            url: '/research/contractfield',
            method: 'delete',
            params: {
                id: id
            }
        })
    }
}
