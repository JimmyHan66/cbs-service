import request from '@/utils/request'
export default {
    getList:function(params) {
        return request({
            url: '/cms/wxarticle/list',
            method: 'get',
            params
        })
    },
    add:function(params) {
        return request({
            url: '/cms/wxarticle',
            method: 'post',
            params
        })
    },
    update:function(params) {
        return request({
            url: '/cms/wxarticle',
            method: 'PUT',
            params
        })
    },
    remove:function(id) {
        return request({
            url: '/cms/wxarticle',
            method: 'delete',
            params: {
                id: id
            }
        })
    }
}
