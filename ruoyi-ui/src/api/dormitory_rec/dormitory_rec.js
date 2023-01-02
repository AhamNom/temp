import request from '@/utils/request'

// 查询宿舍扣分记录列表
export function listDormitory_rec(query) {
  return request({
    url: '/dormitory_rec/dormitory_rec/list',
    method: 'get',
    params: query
  })
}

// 查询宿舍扣分记录详细
export function getDormitory_rec(id) {
  return request({
    url: '/dormitory_rec/dormitory_rec/' + id,
    method: 'get'
  })
}

// 新增宿舍扣分记录
export function addDormitory_rec(data) {
  return request({
    url: '/dormitory_rec/dormitory_rec',
    method: 'post',
    data: data
  })
}

// 修改宿舍扣分记录
export function updateDormitory_rec(data) {
  return request({
    url: '/dormitory_rec/dormitory_rec',
    method: 'put',
    data: data
  })
}

// 删除宿舍扣分记录
export function delDormitory_rec(id) {
  return request({
    url: '/dormitory_rec/dormitory_rec/' + id,
    method: 'delete'
  })
}
