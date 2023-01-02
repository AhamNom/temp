import request from '@/utils/request'

// 查询教师管理列表
export function listTeachers(query) {
  return request({
    url: '/teachers/teachers/list',
    method: 'get',
    params: query
  })
}

// 查询教师管理详细
export function getTeachers(id) {
  return request({
    url: '/teachers/teachers/' + id,
    method: 'get'
  })
}

// 新增教师管理
export function addTeachers(data) {
  return request({
    url: '/teachers/teachers',
    method: 'post',
    data: data
  })
}

// 修改教师管理
export function updateTeachers(data) {
  return request({
    url: '/teachers/teachers',
    method: 'put',
    data: data
  })
}

// 删除教师管理
export function delTeachers(id) {
  return request({
    url: '/teachers/teachers/' + id,
    method: 'delete'
  })
}
