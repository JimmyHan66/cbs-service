import request from '@/utils/request'
export default {
    getList:function(params) {
        return request({
            url: '/game/rankday/list',
            method: 'get',
            params
        })
    },
    add:function(params) {
        return request({
            url: '/game/rankday',
            method: 'post',
            params
        })
    },
    update:function(params) {
        return request({
            url: '/game/rankday',
            method: 'PUT',
            params
        })
    },
    remove:function(id) {
        return request({
            url: '/game/rankday',
            method: 'delete',
            params: {
                id: id
            }
        })
    }
}
