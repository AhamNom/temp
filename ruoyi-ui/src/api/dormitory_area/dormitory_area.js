import request from '@/utils/request'

// 查询宿舍区域管理列表
export function listDormitory_area(query) {
  return request({
    url: '/dormitory_area/dormitory_area/list',
    method: 'get',
    params: query
  })
}

// 查询宿舍区域管理详细
export function getDormitory_area(id) {
  return request({
    url: '/dormitory_area/dormitory_area/' + id,
    method: 'get'
  })
}

// 新增宿舍区域管理
export function addDormitory_area(data) {
  return request({
    url: '/dormitory_area/dormitory_area',
    method: 'post',
    data: data
  })
}

// 修改宿舍区域管理
export function updateDormitory_area(data) {
  return request({
    url: '/dormitory_area/dormitory_area',
    method: 'put',
    data: data
  })
}

// 删除宿舍区域管理
export function delDormitory_area(id) {
  return request({
    url: '/dormitory_area/dormitory_area/' + id,
    method: 'delete'
  })
}
