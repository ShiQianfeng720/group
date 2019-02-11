<template>
  <div>
    <table class="tab">
      <thead>
        <tr>
          <th>ID</th>
          <th>订单ID</th>
          <th>时间</th>
          <th>内容</th>
          <th>等级</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item of list" :key="item.mid">
          <td>{{item.mid}}</td>
          <td>{{item.aid}}</td>
          <td>{{item.time|datatimefilter}}</td>
          <td>{{item.content}}</td>
          <td>{{item.level}}</td>
          <td>
            <el-button type="primary" icon="el-icon-edit" circle></el-button>
            <el-button type="danger" icon="el-icon-delete" circle></el-button>
          </td>
        </tr>
      </tbody>
    </table>
    <!-- 分页显示 -->
    <div class="page">
    <el-pagination layout="total, prev, pager, next"  :current-page="pageIndex"
       :total="list.length"  :page-size="pagesize"  ></el-pagination>
    </div>
  </div>
</template>
<script >
export default {
  data() {
    return {
      list: [],
      pageIndex:1,//初始页
      pagesize:4,//每页数据
      pageCount:1 //总页数
    };
  },
  created() {
    this.table();
    
  },
  methods: {
        table(){
          //加载下一页
                this.pageIndex++;
                var pno=this.pageIndex;
                var ps=this.pagesize;
                console.log("pageindex");
                 //发送ajax请求
                 var url="http://127.0.0.1:3000/getLiu?pno="+pno+"&pageSize="+ps;
                 //返回数据保存list
                 this.axios.get(url).then(result=>{
                  //  this.list=result.data;
                  //点击分页
                  // this.list=result.data.data;
               //追加
               var rows=this.list.concat(result.data.data);
               this.list=rows;
               this.pageCount=result.data.pageCount;

                 })
        },
    // table() {
    //   var url = "http://127.0.0.1:3000/tabList";
    //   this.axios.get(url).then(result => {
    //     this.list = result.data;
    //   });
    // }
  }
};
</script>

<style scope>
.tab {
  border-collapse: collapse;
  width: 100%;
}

.tab,
td,
th {
  border: 1px solid #ccc;
  text-align: center;
}
.tab td,
.tab th {
  width: 25px;
}
.tab td {
  height: 100px;
  font-size: 12px;
}
.tab td:nth-child(4),
.tab th:nth-child(4) {
  width: 180px;
}
/*分页*/
.page{
  float:right;
  padding: 15px;
  background:lightblue;
}
</style>
