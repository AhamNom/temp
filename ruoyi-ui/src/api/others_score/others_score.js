import request from '@/utils/request'

// 查询其它扣分项管理列表
export function listOthers_score(query) {
  return request({
    url: '/others_score/others_score/list',
    method: 'get',
    params: query
  })
}

// 查询其它扣分项管理详细
export function getOthers_score(id) {
  return request({
    url: '/others_score/others_score/' + id,
    method: 'get'
  })
}

// 新增其它扣分项管理
export function addOthers_score(data) {
  return request({
    url: '/others_score/others_score',
    method: 'post',
    data: data
  })
}

// 修改其它扣分项管理
export function updateOthers_score(data) {
  return request({
    url: '/others_score/others_score',
    method: 'put',
    data: data
  })
}

// 删除其它扣分项管理
export function delOthers_score(id) {
  return request({
    url: '/others_score/others_score/' + id,
    method: 'delete'
  })
}
