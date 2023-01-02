import request from '@/utils/request'

// 查询考勤扣分项管理列表
export function listAttendancy_score(query) {
  return request({
    url: '/attendancy_score/attendancy_score/list',
    method: 'get',
    params: query
  })
}

// 查询考勤扣分项管理详细
export function getAttendancy_score(id) {
  return request({
    url: '/attendancy_score/attendancy_score/' + id,
    method: 'get'
  })
}

// 新增考勤扣分项管理
export function addAttendancy_score(data) {
  return request({
    url: '/attendancy_score/attendancy_score',
    method: 'post',
    data: data
  })
}

// 修改考勤扣分项管理
export function updateAttendancy_score(data) {
  return request({
    url: '/attendancy_score/attendancy_score',
    method: 'put',
    data: data
  })
}

// 删除考勤扣分项管理
export function delAttendancy_score(id) {
  return request({
    url: '/attendancy_score/attendancy_score/' + id,
    method: 'delete'
  })
}
