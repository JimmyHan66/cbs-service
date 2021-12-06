import request from '@/utils/request'
export default {
    getList:function(params) {
        return request({
            url: '/game/importinfo/list',
            method: 'get',
            params
        })
    },
    add:function(params) {
        return request({
            url: '/game/importinfo',
            method: 'post',
            params
        })
    },
    update:function(params) {
        return request({
            url: '/game/importinfo',
            method: 'PUT',
            params
        })
    },
    remove:function(id) {
        return request({
            url: '/game/importinfo',
            method: 'delete',
            params: {
                id: id
            }
        })
    },
    calData:function (calDate) {
        return request({
            url: '/game/importinfo/calData',
            method: 'get',
            params: {
                calDate: calDate
            }
        })
    }
}
