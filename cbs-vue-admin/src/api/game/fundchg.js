import request from '@/utils/request'
export default {
    getList:function(params) {
        return request({
            url: '/game/fundchg/list',
            method: 'get',
            params
        })
    },
    add:function(params) {
        return request({
            url: '/game/fundchg',
            method: 'post',
            params
        })
    },
    update:function(params) {
        return request({
            url: '/game/fundchg',
            method: 'PUT',
            params
        })
    },
    remove:function(id) {
        return request({
            url: '/game/fundchg',
            method: 'delete',
            params: {
                id: id
            }
        })
    }
}
