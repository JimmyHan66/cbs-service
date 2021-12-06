import request from '@/utils/request'
export default {
    getList:function(params) {
        return request({
            url: '/publicity/margin/list',
            method: 'get',
            params
        })
    },
    add:function(params) {
        return request({
            url: '/publicity/margin',
            method: 'post',
            params
        })
    },
    update:function(params) {
        return request({
            url: '/publicity/margin',
            method: 'PUT',
            params
        })
    },
    remove:function(id) {
        return request({
            url: '/publicity/margin',
            method: 'delete',
            params: {
                id: id
            }
        })
    },
    exportXls: function (params) {
        return request({
            url: '/publicity/margin/export',
            method: 'get',
            params
        })
    },
    getCodeByMarket: function (params) {
        return request({
            url: '/publicity/margin/getCodeByMarket',
            method: 'get',
            params:{
                marketNo:params,
            }
        })
    },
    batchAdd:function(params) {
        return request({
            url: '/publicity/margin/batchAdd',
            method: 'post',
            params
        })
    },
    batchDelete:function(params) {
        return request({
            url: '/publicity/margin/batchDelete',
            method: 'post',
            params
        })
    },
}
