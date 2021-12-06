import request from '@/utils/request'
export default {
    getList:function(params) {
        return request({
            url: '/game/cusfund/list',
            method: 'get',
            params
        })
    },
    add:function(params) {
        return request({
            url: '/game/cusfund',
            method: 'post',
            params
        })
    },
    update:function(params) {
        return request({
            url: '/game/cusfund',
            method: 'PUT',
            params
        })
    },
    remove:function(id) {
        return request({
            url: '/game/cusfund',
            method: 'delete',
            params: {
                id: id
            }
        })
    }
}
