<template>
  <div>
    <!--面包屑导航-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>会员管理</el-breadcrumb-item>
      <el-breadcrumb-item>积分变动</el-breadcrumb-item>
    </el-breadcrumb>
    <!--查询-->
    <el-form class="el-form1">
      <el-form-item>
        <el-input placeholder="请输入会员号" v-model="input1" class="input1">
          <template slot="append" >查询</template>
        </el-input>
      </el-form-item>
      <el-form-item class="msg">
        姓名:<span>{{name}}</span>
        等级:<span>{{level}}</span>
        余额:<span>{{money}}</span>
        积分:<span>{{core}}</span>
      </el-form-item>
    </el-form>

    <el-form class="el-form2">
      <el-form-item class="score">
        积分变动
      </el-form-item>
    <el-form-item>
      <hr/>
    </el-form-item> 
    </el-form>
  </div>
</template>

<script>
export default {
  data(){
    return{
      input1:"",
      name:"xxx",
      level:"xxx",
      money:"xxx",
      core:"xxx",
    }
  }
}
</script>

<style>
.el-form1 ,.el-form2{
  background:#fff;
  margin-top:20px;
  width: 100%;
    background: #ffff;
    padding-top: 20px;
    padding-bottom: 0px;
}
.score{
  color: #333;

}
hr{
  width: 30%;
  float: left;
  color:#333;
  margin-top:-10px;
  margin-left:5px;
}
.input1 {
  width: 400px;
  padding-left: 10px;
}
  .el-input-group__append{
    color: green;
    cursor: pointer;
  }
  .el-input-group__append:hover{
    background:#0DCC6D;
    color: #fff;
  }
  .msg{
    padding-left: 12px;
    font-size: 15px !important;
  }
  .el-form-item__content{
    font-size: 17px;
    color: #5E5E5E;
  }
  .msg span{
    margin-right: 35px;

  }
</style>
