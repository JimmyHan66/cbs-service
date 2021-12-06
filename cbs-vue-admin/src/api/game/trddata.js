import request from '@/utils/request'
export default {
    getList:function(params) {
        return request({
            url: '/game/trddata/list',
            method: 'get',
            params
        })
    },
    add:function(params) {
        return request({
            url: '/game/trddata',
            method: 'post',
            params
        })
    },
    update:function(params) {
        return request({
            url: '/game/trddata',
            method: 'PUT',
            params
        })
    },
    remove:function(id) {
        return request({
            url: '/game/trddata',
            method: 'delete',
            params: {
                id: id
            }
        })
    }
}
