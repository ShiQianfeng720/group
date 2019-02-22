<template>
    <div>
       <!--面包屑导航-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>商品管理</el-breadcrumb-item>
      <el-breadcrumb-item>套餐列表</el-breadcrumb-item>
    </el-breadcrumb>
    <!--商品轮播图-->
    <el-carousel :interval="4000" type="card" height="200px">
    <el-carousel-item v-for="item in carousel" :key="item">
      <img :src="item"/>
      <!-- <img :src="'http://localhost:3000/images/goods/1.jpg'"/> -->
    </el-carousel-item>
  </el-carousel>
    </div>
</template>

<script>
export default {
    data(){
        return{
           carousel:[
               "http://localhost:3000/images/goods/1.jpg",
               "http://localhost:3000/images/goods/2.jpg",
               "http://localhost:3000/images/goods/3.jpg",
               "http://localhost:3000/images/goods/4.jpg",
               "http://localhost:3000/images/goods/5.jpg",

           ] 
        }
    }
}
</script>

<style scoped>
     .el-carousel__item h3 {
    color: #475669;
    font-size: 14px;
    opacity: 0.75;
    line-height: 200px;
    margin: 0;
  }
  
  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }
  
  .el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  }
</style>