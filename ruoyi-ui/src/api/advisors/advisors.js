import request from '@/utils/request'

// 查询辅导员管理列表
export function listAdvisors(query) {
  return request({
    url: '/advisors/advisors/list',
    method: 'get',
    params: query
  })
}

// 查询辅导员管理详细
export function getAdvisors(id) {
  return request({
    url: '/advisors/advisors/' + id,
    method: 'get'
  })
}

// 新增辅导员管理
export function addAdvisors(data) {
  return request({
    url: '/advisors/advisors',
    method: 'post',
    data: data
  })
}

// 修改辅导员管理
export function updateAdvisors(data) {
  return request({
    url: '/advisors/advisors',
    method: 'put',
    data: data
  })
}

// 删除辅导员管理
export function delAdvisors(id) {
  return request({
    url: '/advisors/advisors/' + id,
    method: 'delete'
  })
}
