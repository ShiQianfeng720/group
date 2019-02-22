
<template>
  <div>
    <!--面包屑导航-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>商品管理</el-breadcrumb-item>
      <el-breadcrumb-item>商品列表</el-breadcrumb-item>
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

    <!--e-table-->
    <el-table
      ref="multipleTable"
      :data="gList"
      tooltip-effect="dark"
      style="width: 100%"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="ID"  ></el-table-column>
      <el-table-column prop="pic" label="图片" >
        <!-- <img class="pic_size" :src="'http://127.0.0.1:3000/'+gList.pic" alt=""> -->
      </el-table-column>
      <el-table-column prop="title" label="标题"></el-table-column>
      <el-table-column prop="classify" label="商品分类"></el-table-column>
      <el-table-column prop="des" label="商品描述" class="p"></el-table-column>
      <el-table-column prop="price" label="价格" ></el-table-column>
      <el-table-column prop="number" label="库存"></el-table-column>
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
        gList: [],
        input: "",
        pageIndex:0,//初始页
        pageSize:5,//每页数据
        pageCount:1 //总页数
      };
    },
    created() {
      this.goodsTable();
    },
    methods: {
      current_change(val){
        var pno=val;
        var ps=this.pageSize;
        var url="http://127.0.0.1:3000/getProductList?pno="+pno+"&pageSize="+ps;
        this.axios.get(url).then(result=>{
          // console.log(result.data)
          var rows=result.data.data;
          this.gList=rows;
        })
      },
      goodsTable() {
        //加载下一页请求参数
        this.pageIndex++;
        var pno=this.pageIndex;
        var ps=this.pageSize;
        //请求地址
        var url = "http://127.0.0.1:3000/getProductList?pno="+pno+"&pageSize="+ps;
        //发送异步请求
        this.axios.get(url).then(result => {
          //返回数据保存到mList
          // this.mList = result.data;
          // this.mList = result.data.data;
          var rows=this.gList.concat(result.data.data);
          this.gList=rows;
          console.log(rows);
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
  .el-table{
    text-align: center;
  }
 

.el-table .cell{
  text-align: center;
  height:40px;
  /* line-height: 40px; */
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}
 .el-table th{
 background: #bbddc5;
 color: rgb(82, 80, 80);
 font-size: 15px;
 line-height: 40px;
}

  /*分页*/
  .block{
    float: right;
    background:lightgreen;
  }
</style>
