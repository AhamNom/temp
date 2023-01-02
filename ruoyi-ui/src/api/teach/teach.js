import request from '@/utils/request'

// 查询授课考勤列表
export function listTeach(query) {
  return request({
    url: '/teach/teach/list',
    method: 'get',
    params: query
  })
}

// 查询授课考勤详细
export function getTeach(id) {
  return request({
    url: '/teach/teach/' + id,
    method: 'get'
  })
}

// 新增授课考勤
export function addTeach(data) {
  return request({
    url: '/teach/teach',
    method: 'post',
    data: data
  })
}

// 修改授课考勤
export function updateTeach(data) {
  return request({
    url: '/teach/teach',
    method: 'put',
    data: data
  })
}

// 删除授课考勤
export function delTeach(id) {
  return request({
    url: '/teach/teach/' + id,
    method: 'delete'
  })
}
