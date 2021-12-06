import request from '@/utils/request'
export default {
    getList:function(params) {
        return request({
            url: '/game/contestant/list',
            method: 'get',
            params
        })
    },
    add:function(params) {
        return request({
            url: '/game/contestant',
            method: 'post',
            params
        })
    },
    update:function(params) {
        return request({
            url: '/game/contestant',
            method: 'PUT',
            params
        })
    },
    remove:function(id) {
        return request({
            url: '/game/contestant',
            method: 'delete',
            params: {
                id: id
            }
        })
    },
    exportXls: function (params) {
        return request({
            url: '/game/contestant/export',
            method: 'post',
            params
        })
    },
}
