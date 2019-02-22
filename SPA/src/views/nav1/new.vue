<template>
  <div>
    <!--面包屑导航-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>会员管理</el-breadcrumb-item>
      <el-breadcrumb-item>新增会员</el-breadcrumb-item>
    </el-breadcrumb>
    <!--会员信息-->
    <el-row class="news">
      <el-col :span="24"><div class="grid-content bg-purple-dark">基本信息</div></el-col>
    </el-row>
      <!-- <span class="p">基本信息</span> -->


    <el-form
      :model="ruleForm"
      :rules="rules"
      ref="ruleForm"
      label-width="100px"
      class="demo-ruleForm"
    >

      <el-form-item label="会员姓名" prop="name">
        <el-input v-model="ruleForm.name" placeholder="请输入会员名" style="width:200px"></el-input>
      </el-form-item>
      <el-form-item label="会员手机" prop="phone">
        <el-input v-model="ruleForm.phone" placeholder="请输入手机号" style="width:200px"></el-input>
      </el-form-item>

      <el-form-item label="会员性别" prop="gender">
        <el-radio-group v-model="ruleForm.gender">
          <el-radio label="男"></el-radio>
          <el-radio label="女"></el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="会员等级" prop="level">
        <el-select v-model="ruleForm.level" placeholder="请选择会员等级">
          <el-option label="普通会员" value="0"></el-option>
          <el-option label="高级会员" value="1"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="会员余额" prop="money">
        <el-input v-model="ruleForm.money" placeholder="请输入账户余额" style="width:100px"></el-input>
      </el-form-item>
      <el-form-item label="会员积分" prop="score">
        <el-input v-model="ruleForm.score" placeholder="请输入会员积分" style="width:100px"></el-input>
      </el-form-item>
      <el-form-item label="消费次数" prop="count">
        <el-input v-model="ruleForm.count"  style="width:100px"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm')">保存</el-button>
        <el-button @click="resetForm('ruleForm')">重置</el-button>
      </el-form-item>
    </el-form>
</div>

</template>

<script>
export default {
  data() {
    return {
      ruleForm: {
        // id: "",
        name: "",
        phone: "",
        gender: "",
        level: "",
        money: "",
        score:"10",
        count:'0'
      },
      rules: {

        name: [{ required: true, message: "请输入会员名称", trigger: "blur" }],
        phone: [
          { required: true, message: "请输入会员手机号", trigger: "blur" },
          { min: 11, max: 11, message: "长度为11个字符", trigger: "blur" }
        ],

        gender: [{ required: true, message: "请选择性别", trigger: "change" }],
        level: [
          { required: true, message: "请选择会员等级", trigger: "change" }
        ],
        money: [{ required: false, message: "请输入账户余额", trigger: "blur" }]
      }
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          //向数据库插入数据
          //请求参数
          var name=this.ruleForm.name;
          var phone=this.ruleForm.phone;
          var gender=this.ruleForm.gender;
          var level=this.ruleForm.level;
          var money=this.ruleForm.money;
          var score=this.ruleForm.score;
          //请求地址
          var url="http://127.0.0.1:3000/addnewuser?name="+name+"&phone="+phone+"&gender="+gender+
            "&level="+level+"&money="+money+"&score="+score;
          //发送异步请求
          this.axios.get(url).then(result=>{
            if (result.data.code > 0) {
              alert(result.data.msg)
            }else{
              alert(result.data.msg)
            }
          })

        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    }
  }
};
</script>

<style scoped>
.news{
    margin-bottom: 15px;
    margin-top:25px;
}
  /* .el-row {
    margin-bottom: 15px;
    margin-top:5px;
  } */
  .el-col {
    border-radius: 4px;
  }
  .bg-purple-dark {
    background: #ecfcf1;
  }
  .grid-content {
    border-radius: 4px;
    min-height: 40px;
    line-height: 40px;
    font-size: 15px;
    font-weight: bold;
    color: #21bc5e;
    padding-left: 28px;
  }

/*会员信息*/

.el-form {
  width: 100%;
  background: #ffff;
  padding-top: 20px;
  padding-bottom: 20px;
}
</style>
