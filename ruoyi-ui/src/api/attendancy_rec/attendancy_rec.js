import request from '@/utils/request'

// 查询考勤扣分记录列表
export function listAttendancy_rec(query) {
  return request({
    url: '/attendancy_rec/attendancy_rec/list',
    method: 'get',
    params: query
  })
}

// 查询考勤扣分记录详细
export function getAttendancy_rec(id) {
  return request({
    url: '/attendancy_rec/attendancy_rec/' + id,
    method: 'get'
  })
}

// 新增考勤扣分记录
export function addAttendancy_rec(data) {
  return request({
    url: '/attendancy_rec/attendancy_rec',
    method: 'post',
    data: data
  })
}

// 修改考勤扣分记录
export function updateAttendancy_rec(data) {
  return request({
    url: '/attendancy_rec/attendancy_rec',
    method: 'put',
    data: data
  })
}

// 删除考勤扣分记录
export function delAttendancy_rec(id) {
  return request({
    url: '/attendancy_rec/attendancy_rec/' + id,
    method: 'delete'
  })
}
