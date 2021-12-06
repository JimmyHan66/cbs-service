import request from '@/utils/request'

export default {
    queryAllContract: function () {
        return request({
            url: '/research/researchcontract/queryAllContract',
            method: 'get'
        })
    },
    getTableByContract: function (params) {
        return request({
            url: '/research/researchcontract/getTableByContract?contractCode=' + params,
            method: 'get'
        })
    },
    getFieldByTable: function (params) {
        return request({
            url: '/research/contractfield/getFieldByTable?tableNameEn=' + params,
            method: 'get'
        })
    },
}
