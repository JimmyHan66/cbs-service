import request from '@/utils/request'
export default {
    getList:function(params) {
        return request({
            url: '/research/researchcontract/list',
            method: 'get',
            params
        })
    },
    add:function(params) {
        return request({
            url: '/research/researchcontract',
            method: 'post',
            params
        })
    },
    update:function(params) {
        return request({
            url: '/research/researchcontract',
            method: 'PUT',
            params
        })
    },
    remove:function(id) {
        return request({
            url: '/research/researchcontract',
            method: 'delete',
            params: {
                id: id
            }
        })
    }
}
