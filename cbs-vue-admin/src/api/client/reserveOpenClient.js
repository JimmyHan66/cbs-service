import request from '@/utils/request'

export function getList(params) {
    return request({
        url: '/client/reserveopenclient/list',
        method: 'post',
        params
    })
}


export function save(params) {
    return request({
        url: '/client/reserveopenclient',
        method: 'post',
        params
    })
}

export function remove(id) {
    return request({
        url: '/client/reserveopenclient',
        method: 'delete',
        params: {
            id: id
        }
    })
}

export function exportXls(params) {
    return request({
        url: '/client/reserveopenclient/export',
        method: 'post',
        params
    })
}
