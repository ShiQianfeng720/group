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
          <template slot="append" class="append">查询</template>
        </el-input>
      </el-form-item>
      <el-form-item class="msg">
        姓名:
        <span>{{name}}</span>
        等级:
        <span>{{level}}</span>
        余额:
        <span>{{money}}</span>
        积分:
        <span>{{core}}</span>
      </el-form-item>
    </el-form>

    <el-form class="el-form2">
      <el-form-item class="score">积分变动</el-form-item>
      <el-form-item>
        <hr>
        <br>
        <el-form :rules="rules" id="el-form3" label-width="80px">
          <el-form-item label="操作类型">
            <el-radio-group v-model="type">
              <el-radio label="增加积分"></el-radio>
              <el-radio label="扣除积分"></el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="现有积分">
            <el-input v-model="nowScore" :disabled="true" class="inputWidth"></el-input>
          </el-form-item>
          <el-form-item label="输入积分" prop="name">
            <el-input v-model="inputScore" class="inputWidth"></el-input>
          </el-form-item>
          <el-form-item label="剩余积分">
            <el-input v-model="nowScore" :disabled="true" class="inputWidth"></el-input>
          </el-form-item>
          <el-form-item label="备注" prop="desc">
            <el-input type="textarea" v-model="desc" class="inputWidth"></el-input>
          </el-form-item>
          <el-button  type="success" plain icon="el-icon-success">确认</el-button>
        </el-form>
        
      </el-form-item>
    </el-form>
  </div>
</template>
        </el-form-item>
    </el-form-item> 
    </el-form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      input1: "",
      name: "xxx",
      level: "xxx",
      money: "xxx",
      core: "xxx",
      type: "",
      nowScore: "",
      inputScore: "",
      desc: "",
      rules: {
        name: [{ required: true, message: "请输入积分", trigger: "blur" }]
      }
    };
  }
};
</script>

<style>
  .el-input-group__append{
  color: green;
  cursor: pointer;
}
.el-input-group__append:hover {
  background: #0dcc6d;
  color: #fff;
}

</style>


<style scoped>
.el-form1,
.el-form2 {
  background: #fff;
  margin-top: 20px;
  width: 100%;
  background: #ffff;
  padding-top: 15px;
  padding-bottom: 0px;
}
.score {
  color: #333;
  font-weight: bold;
  margin-left: 10px;
  margin-bottom:0px;
}
hr {
  width: 600px;
  float: left;
  color: #777;
  margin-left: 5px;
  margin-top:-13px;
}
.input1 {
  width: 600px;
  padding-left: 10px;
}
.append{
  color: green;
  cursor: pointer;
}

.msg {
  padding-left: 15px;
  color:#333;
  font-size: 15px;
}
.el-form-item__content {
  font-size: 17px;
  color: #5e5e5e;
  margin-bottom: 20px !important;
}
.msg span {
  margin-right: 75px;
  color: red;
}
.inputWidth {
  width: 400px;
  /* margin-left: 25px; */
  margin-right: 10px;
}
#el-form3{
  width: 550px;
  margin-left:65px;
  padding-bottom:20px;
  border:1px solid #ccc;
}
 .el-button{
   margin-left: 200px;
   /* margin-top: 20px; */
 } 
 .el-form-item{
   margin-bottom: 25px;
 }
</style>
