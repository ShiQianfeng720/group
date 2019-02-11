<template>
  <table class="table">
    <thead>
      <tr>
        <th>ID</th>
        <!-- <th>图片</th> -->
        <th>title</th>
        <th>subtitle</th>
        <th>price</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="item of list2" :key="item.jingdian_id">
        <td>{{item.jingdian_id}}</td>
        <!-- <td>{{item.pic}}</td> -->
        <td>{{item.title}}</td>
        <td>{{item.subtitle}}</td>
        <td>{{item.price}}</td>
        <td> 
          <el-button type="primary" icon="el-icon-edit" circle></el-button>
          <el-button type="danger" icon="el-icon-delete" circle></el-button>
        </td>
      </tr>
    </tbody>
  </table>
</template>

<script>
export default {
  data() {
    return {
      list2:[]
    }
  },
  created() {
    this.jdTable();
  },
  methods: {
    jdTable(){
      //请求地址
      var url="http://127.0.0.1:3000/jdList";
      //发送异步请求
      this.axios.get(url).then(result=>{
        this.list2=result.data;
      })
    }
  },

}
</script>

<style scope>
  .table
  {
  border-collapse:collapse;
  width:100%;
  
  }

.table, td, th
  {
  
  text-align: center;
  }
  .table td,.table th{
    width: 25px;
    border:1px solid #ccc;
    /* border-top:none; */
  }
  .table td{height: 80px;font-size: 13px}
  
  .table td:nth-child(2),.table th:nth-child(2){
    width: 100px;
  }
  
</style>