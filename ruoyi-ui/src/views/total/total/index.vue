<template>
  <el-table :data="tableData" border style="width: 80%">
    <el-table-column prop="attendanceScore" label="用户编号"></el-table-column>
    <el-table-column prop="attendanceScore" label="考勤得分"></el-table-column>
    <el-table-column prop="dormitoryScore" label="宿舍得分"></el-table-column>
    <el-table-column prop="otherScore" label="其它不良行为扣分"></el-table-column>
    <el-table-column prop="activityScore" label="活动加分"></el-table-column>
    <el-table-column prop="totalScore" label="总分"></el-table-column>
  </el-table>
</template>

<script>
import request from '@/utils/request';

export default {
  created() {
    var info = request({
      url: '/getInfo',
      method: 'get'
    });
    // console.log(info);
    info.then(value => {
      console.log('success');
      console.log(value.user.userId);
    }, error => {
      console.log(error);
    });
  },
  data() {
    return {
      tableData: [
        // 数据列表
      ]
    }
  }
}
</script>
