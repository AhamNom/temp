import request from '@/utils/request'

// 查询学生管理列表
export function listStudents(query) {
  return request({
    url: '/students/students/list',
    method: 'get',
    params: query
  })
}

// 查询学生管理详细
export function getStudents(id) {
  return request({
    url: '/students/students/' + id,
    method: 'get'
  })
}

// 新增学生管理
export function addStudents(data) {
  return request({
    url: '/students/students',
    method: 'post',
    data: data
  })
}

// 修改学生管理
export function updateStudents(data) {
  return request({
    url: '/students/students',
    method: 'put',
    data: data
  })
}

// 删除学生管理
export function delStudents(id) {
  return request({
    url: '/students/students/' + id,
    method: 'delete'
  })
}
