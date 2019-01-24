<template>
  <div class="container">
    <el-header style="height:103px">
      <div class="logo">
        <img src="../../assets/玩去.jpg" style="width:17%;">
      </div>
    </el-header>
    <el-main>
      <!--背景图片-->
      <!--登陆卡片-->
      <div class="maininner">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>注册账号</span>
          </div>
          
          <div class="text item">
            <el-form class="log in-form">
              <el-form-item prop="username" class="wrapper">
                <i class="fa fa-user-circle" aria-hidden="true"></i>
                <input type="text" v-model="name" placeholder="手机号/会员名" @blur.prevent="checkName">
              </el-form-item>
              <el-form-item prop="password" class="wrapper">
                <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                <input type="password" v-model="pwd1" placeholder="密码">
              </el-form-item>
              <el-form-item prop="password" class="wrapper">
                <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                <input type="password" v-model="pwd2" placeholder="确认密码">
              </el-form-item>
              <el-button class="strength" type="primary" @click="register">注册</el-button>
            </el-form>
          </div>


          <div class="clearfix">
            <p class="p">已有用户，去登陆 </p>
            <i class="fa fa-qq blue" aria-hidden="true"></i>
            <span class="pass">QQ</span>
            <span class="pass">|</span>
            <i class="fa fa-weixin green" aria-hidden="true"></i>
            <span class="pass">微信</span>
            <span class="pass">|</span>
            <i class="fa fa-weibo red" aria-hidden="true"></i>
            <span class="pass">微博</span>
            <span class="pass">|</span>
            <i class="fa fa-credit-card-alt light" aria-hidden="true"></i>
            <span class="pass">合作卡</span>
          </div>
        </el-card>
      </div>
      <!--登陆卡片-->
    </el-main>
  </div>
</template>

<script>
export default {
  data() {
    return {
      name:"",
      pwd1:"",
      pwd2:"",
      isSubmit:false //是否允许提交
    }
  },
  methods: {
    checkName() {
      //1：获取用户输入的用户名
      var name = this.name;
      //2：发送ajax请求
      var url = "http://127.0.0.1:3000/existsname?name=" + name;
      this.axios.get(url).then(result => {
        if (result.data.code > 0) {
          //3：提醒消息
          alert(result.data.msg);
          this.isSubmit = true;
        } else {
          alert(result.data.msg);
          this.isSubmit = false;
        }
      });
    },
    register() {
      
      //1:获取用户名 密码 确认密码
      if (this.isSubmit === false) {
        //禁止提交
        return;
      }
      var name = this.name;
      var pwd1 = this.pwd1;
      var pwd2 = this.pwd2;
      // console.log(name+"|"+pwd1+"|"+pwd2);
      //2:验证用户名和密码是否正确
      var regname = /^[a-z0-9_]{5,12}$/i;
      var regpwd = /^[a-z0-9]{5,12}$/i;
      if (!regname.test(name)) {
        alert("用户名格式不正确");
        return;
      }
      if (!regpwd.test(pwd1)) {
          alert("密码格式不正确");
        return;
      }
      if (pwd1 != pwd2) {
        alert("两次密码不一致，请修改");
        return;
      }
      
      if (pwd1 == pwd2) {
        //如果正确发送ajax请求
        var url =
          "http://127.0.0.1:3000/register?name=" + name + "&pwd=" + pwd1;
        this.axios.get(url).then(result => {
          if (result.data.code > 0) {
            alert(result.data.msg);
            this.$router.push("/Login");//注册成功跳转到登陆页面
          } else {
            alert(result.data.msg);
          }
        });
      }
    }
  },
};
</script>

<style scope>
.container {
  width: 100%;
  height: 745px;
}

.logo {
  width: 1200px;
  margin: 0 auto;
}
.el-main {
  background-image: url("http://127.0.0.1:3000/images/rbj.jpg");
  color: #333;
  text-align: center;
  height: 650px;
}
/*登陆卡片*/
.el-card__header{
  /* background: #7CCB46; */
  font-size: 20px;
  font-weight: bold;
}
.wrapper {
  position: relative;
}
i.fa-user-circle,
i.fa-unlock-alt {
  position: absolute;
  top: 15px;
  left: 65px;
}
.wrapper input {
  text-indent: 30px;
}

.maininner {
  width: 1200px;
  margin: 0 auto;
  margin-top: 35px;
}
.text {
  font-size: 14px;
}

.item {
  margin-bottom: 18px;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}
.clearfix:after {
  clear: both;
}

.box-card {
  width: 450px;
  height: 500px;
  float: right;
}
input[type="text"],
input[type="password"] {
  height: 38px;
  width: 300px;
}
.strength {
  width: 300px;
  margin: auto;
  /* margin-left: 110px; */
  margin-bottom: 30px;
}
.pass {
  margin-left: 5px;
  margin-right: 5px;
  font-size: 14px;
  color: #333;
}
p {
  font-size: 14px;
  color: gray;
}
.blue {
  color: #00aaee;
}
.green {
  color: #4cbf00;
}
.red {
  color: #e7222e;
}
.light {
  color: #2ac09e;
}

</style>