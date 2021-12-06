import request from '@/utils/request'
export default {
    getList:function(params) {
        return request({
            url: '/publicity/specialmargin/list',
            method: 'get',
            params
        })
    },
    add:function(params) {
        return request({
            url: '/publicity/specialmargin',
            method: 'post',
            params
        })
    },
    update:function(params) {
        return request({
            url: '/publicity/specialmargin',
            method: 'PUT',
            params
        })
    },
    remove:function(id) {
        return request({
            url: '/publicity/specialmargin',
            method: 'delete',
            params: {
                id: id
            }
        })
    }
}
