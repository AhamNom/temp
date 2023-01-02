import request from '@/utils/request'

// 查询宿舍扣分项管理列表
export function listDormitory_score(query) {
  return request({
    url: '/dormitory_score/dormitory_score/list',
    method: 'get',
    params: query
  })
}

// 查询宿舍扣分项管理详细
export function getDormitory_score(id) {
  return request({
    url: '/dormitory_score/dormitory_score/' + id,
    method: 'get'
  })
}

// 新增宿舍扣分项管理
export function addDormitory_score(data) {
  return request({
    url: '/dormitory_score/dormitory_score',
    method: 'post',
    data: data
  })
}

// 修改宿舍扣分项管理
export function updateDormitory_score(data) {
  return request({
    url: '/dormitory_score/dormitory_score',
    method: 'put',
    data: data
  })
}

// 删除宿舍扣分项管理
export function delDormitory_score(id) {
  return request({
    url: '/dormitory_score/dormitory_score/' + id,
    method: 'delete'
  })
}
