import request from '@/utils/request'
export default {
    getList:function(params) {
        return request({
            url: '/cms/wxgoodvoice/list',
            method: 'get',
            params
        })
    },
    add:function(params) {
        return request({
            url: '/cms/wxgoodvoice',
            method: 'post',
            params
        })
    },
    update:function(params) {
        return request({
            url: '/cms/wxgoodvoice',
            method: 'PUT',
            params
        })
    },
    remove:function(id) {
        return request({
            url: '/cms/wxgoodvoice',
            method: 'delete',
            params: {
                id: id
            }
        })
    }
}
