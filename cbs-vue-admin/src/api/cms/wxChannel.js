import request from '@/utils/request'
export default {
    getList:function(params) {
        return request({
            url: '/cms/wxchannel/list',
            method: 'get',
            params
        })
    },
    add:function(params) {
        return request({
            url: '/cms/wxchannel',
            method: 'post',
            params
        })
    },
    update:function(params) {
        return request({
            url: '/cms/wxchannel',
            method: 'PUT',
            params
        })
    },
    remove:function(id) {
        return request({
            url: '/cms/wxchannel',
            method: 'delete',
            params: {
                id: id
            }
        })
    }
}
