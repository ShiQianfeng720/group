<template>
  <div>
    <!--面包屑导航-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>会员管理</el-breadcrumb-item>
      <el-breadcrumb-item>会员列表</el-breadcrumb-item>
    </el-breadcrumb>
    <!--工具条-->
    <el-input v-model="input" placeholder="请输入内容" class="input1"></el-input>
    <el-button type="success">查询</el-button>
    <div class="group">
      <el-button-group class="toolbar-container">
        <el-button type="primary" icon="el-icon-circle-plus" class="btn">添加</el-button>
        <el-button type="success" icon="el-icon-edit" class="btn">修改</el-button>
        <el-button type="danger" icon="el-icon-delete" class="btn">删除</el-button>
      </el-button-group>
    </div>
    <!--表格-->
    <!-- <table class="table">
      <thead>
        <tr>
          <th>
            <input type="checkbox">
          </th>
          <th>会员号</th>
          <th>会员名</th>
          <th>性别</th>
          <th>手机</th>
          <th>等级</th>
          <th>余额</th>
          <th>积分</th>
          <th>消费次数</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item of mList" :key="item.mid">
          <td>
            <input type="checkbox">
          </td>
          <td>{{item.mid}}</td>
          <td>{{item.mname}}</td>
          <td>{{item.gender}}</td>
          <td>{{item.phone}}</td>
          <td>{{item.level}}</td>
          <td>{{item.money}}</td>
          <td>{{item.core}}</td>
          <td>{{item.count}}</td>
        </tr>
      </tbody>
    </table>-->
    <!--e-table-->
    <el-table
      ref="multipleTable"
      :data="mList"
      tooltip-effect="dark"
      style="width: 100%"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="mid" label="会员号" width="180"></el-table-column>
      <el-table-column prop="mname" label="会员名" width="180"></el-table-column>
      <el-table-column prop="gender" label="性别"> 
        <template scope="scope">
                <span>{{scope.row.gender | sexfilter}}</span>
        </template>
      </el-table-column> 
      <el-table-column prop="phone" label="手机"></el-table-column>
      <el-table-column prop="level" label="等级">
        <template scope="scope">
                <span>{{scope.row.level | levelfilter}}</span>
         </template>
      </el-table-column>
      <el-table-column prop="money" label="余额"></el-table-column>
      <el-table-column prop="core" label="积分"></el-table-column>
      <el-table-column prop="count" label="消费次数"></el-table-column>
    </el-table>
    <!--分页-->
    <div class="block">
      <el-pagination layout="prev, pager, next" :page-size="1"  :total="pageCount" :pager-count="5"  @current-change="current_change" ></el-pagination>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      mList: [],
      input: "",
      pageIndex:0,//初始页
      pageSize:7,//每页数据
      pageCount:1 //总页数
    };
  },
  created() {
    this.memberTable();
  },
  methods: {
    current_change(val){
       var pno=val;
      var ps=this.pageSize;
      var url="http://127.0.0.1:3000/getList?pno="+pno+"&pageSize="+ps;
          this.axios.get(url).then(result=>{
                // console.log(result.data)
               var rows=result.data.data;
               this.mList=rows;
                 })
    },
    memberTable() {
      //加载下一页请求参数
      this.pageIndex++;
      var pno=this.pageIndex;
      var ps=this.pageSize;
      //请求地址
      var url = "http://127.0.0.1:3000/getList?pno="+pno+"&pageSize="+ps;
      //发送异步请求
      this.axios.get(url).then(result => {
        //返回数据保存到mList
        // this.mList = result.data;
        // this.mList = result.data.data;
        var rows=this.mList.concat(result.data.data);
        this.mList=rows;
        this.pageCount=result.data.pageCount;
      });
    },
    handleSelectionChange(val) {
      this.multipleSelection = val;
    }
  }
};
</script>

<style>
.el-breadcrumb {
  margin-bottom: 30px;
}
.input1 {
  width: 250px;
}
.toolbar-container {
  margin-left: 30px;
  padding: 8px;
}
.btn {
  width: 130px;
}
.group {
  margin-left: -38px;
  margin-top: 10px;
}
/*table*/
.table {
  border-collapse: collapse;
  width: 100%;
  background: #ffff;
}
.table th {
  height: 35px;
  font-size: 15px;
  background: #ecfcf1;
}
.table td {
  height: 50px;
  font-size: 13px;
}
.table td,
.table th {
  width: 25px;
  border: 1px solid #ccc;
  text-align: center;
  /* border-top:none; */
}
/*分页*/
.block{
  float: right;
  background:lightgreen;
}
</style>