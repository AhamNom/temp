import request from '@/utils/request'

// 查询测试列表
export function listTest_temp(query) {
  return request({
    url: '/test_temp/test_temp/list',
    method: 'get',
    params: query
  })
}

// 查询测试详细
export function getTest_temp(id) {
  return request({
    url: '/test_temp/test_temp/' + id,
    method: 'get'
  })
}

// 新增测试
export function addTest_temp(data) {
  return request({
    url: '/test_temp/test_temp',
    method: 'post',
    data: data
  })
}

// 修改测试
export function updateTest_temp(data) {
  return request({
    url: '/test_temp/test_temp',
    method: 'put',
    data: data
  })
}

// 删除测试
export function delTest_temp(id) {
  return request({
    url: '/test_temp/test_temp/' + id,
    method: 'delete'
  })
}
