<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="编号" prop="id">
        <el-input
          v-model="queryParams.id"
          placeholder="请输入编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="扣分人" prop="studentId">
        <el-input
          v-model="queryParams.studentId"
          placeholder="请输入扣分人"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="扣分类型" prop="typeId">
        <el-input
          v-model="queryParams.typeId"
          placeholder="请输入扣分类型"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="添加者" prop="addedBy">
        <el-input
          v-model="queryParams.addedBy"
          placeholder="请输入添加者"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="课程名" prop="courseName">
        <el-input
          v-model="queryParams.courseName"
          placeholder="请输入课程名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="扣分日期" prop="recDate">
        <el-date-picker clearable
          v-model="queryParams.recDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择扣分日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="是否已取消" prop="canceled">
        <el-input
          v-model="queryParams.canceled"
          placeholder="请输入是否已取消"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['attendancy_rec:attendancy_rec:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['attendancy_rec:attendancy_rec:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['attendancy_rec:attendancy_rec:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['attendancy_rec:attendancy_rec:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="attendancy_recList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
      <el-table-column label="扣分人" align="center" prop="studentId" />
      <el-table-column label="扣分类型" align="center" prop="typeId" />
      <el-table-column label="添加者" align="center" prop="addedBy" />
      <el-table-column label="课程名" align="center" prop="courseName" />
      <el-table-column label="扣分日期" align="center" prop="recDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.recDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="是否已取消" align="center" prop="canceled" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['attendancy_rec:attendancy_rec:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['attendancy_rec:attendancy_rec:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改考勤扣分记录对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="扣分人" prop="studentId">
          <el-input v-model="form.studentId" placeholder="请输入扣分人" />
        </el-form-item>
        <el-form-item label="扣分类型" prop="typeId">
          <el-input v-model="form.typeId" placeholder="请输入扣分类型" />
        </el-form-item>
        <el-form-item label="添加者" prop="addedBy">
          <el-input v-model="form.addedBy" placeholder="请输入添加者" />
        </el-form-item>
        <el-form-item label="课程名" prop="courseName">
          <el-input v-model="form.courseName" placeholder="请输入课程名" />
        </el-form-item>
        <el-form-item label="扣分日期" prop="recDate">
          <el-date-picker clearable
            v-model="form.recDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择扣分日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="是否已取消" prop="canceled">
          <el-input v-model="form.canceled" placeholder="请输入是否已取消" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listAttendancy_rec, getAttendancy_rec, delAttendancy_rec, addAttendancy_rec, updateAttendancy_rec } from "@/api/attendancy_rec/attendancy_rec";

export default {
  name: "Attendancy_rec",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 考勤扣分记录表格数据
      attendancy_recList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        id: null,
        studentId: null,
        typeId: null,
        addedBy: null,
        courseName: null,
        recDate: null,
        canceled: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询考勤扣分记录列表 */
    getList() {
      this.loading = true;
      listAttendancy_rec(this.queryParams).then(response => {
        this.attendancy_recList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        studentId: null,
        typeId: null,
        addedBy: null,
        courseName: null,
        recDate: null,
        canceled: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加考勤扣分记录";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getAttendancy_rec(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改考勤扣分记录";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateAttendancy_rec(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addAttendancy_rec(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除考勤扣分记录编号为"' + ids + '"的数据项？').then(function() {
        return delAttendancy_rec(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('attendancy_rec/attendancy_rec/export', {
        ...this.queryParams
      }, `attendancy_rec_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
