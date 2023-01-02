import request from '@/utils/request'

// 查询宿管管理列表
export function listDormitory_managers(query) {
  return request({
    url: '/dormitory_managers/dormitory_managers/list',
    method: 'get',
    params: query
  })
}

// 查询宿管管理详细
export function getDormitory_managers(id) {
  return request({
    url: '/dormitory_managers/dormitory_managers/' + id,
    method: 'get'
  })
}

// 新增宿管管理
export function addDormitory_managers(data) {
  return request({
    url: '/dormitory_managers/dormitory_managers',
    method: 'post',
    data: data
  })
}

// 修改宿管管理
export function updateDormitory_managers(data) {
  return request({
    url: '/dormitory_managers/dormitory_managers',
    method: 'put',
    data: data
  })
}

// 删除宿管管理
export function delDormitory_managers(id) {
  return request({
    url: '/dormitory_managers/dormitory_managers/' + id,
    method: 'delete'
  })
}
