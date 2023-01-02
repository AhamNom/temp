import request from '@/utils/request'

// 查询其它扣分记录列表
export function listOthers_rec(query) {
  return request({
    url: '/others_rec/others_rec/list',
    method: 'get',
    params: query
  })
}

// 查询其它扣分记录详细
export function getOthers_rec(id) {
  return request({
    url: '/others_rec/others_rec/' + id,
    method: 'get'
  })
}

// 新增其它扣分记录
export function addOthers_rec(data) {
  return request({
    url: '/others_rec/others_rec',
    method: 'post',
    data: data
  })
}

// 修改其它扣分记录
export function updateOthers_rec(data) {
  return request({
    url: '/others_rec/others_rec',
    method: 'put',
    data: data
  })
}

// 删除其它扣分记录
export function delOthers_rec(id) {
  return request({
    url: '/others_rec/others_rec/' + id,
    method: 'delete'
  })
}
