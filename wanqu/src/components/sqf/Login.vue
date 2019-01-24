<template>
  <div class="container">
    <el-header style="height:103px">
      <div class="logo">
        <img src="http://127.0.0.1:3000/images/wanqu.jpg" style="width:17%;">
      </div>
    </el-header>
    <el-main>
      <!--背景图片-->
      <!--登陆卡片-->
      <div class="maininner">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>用户登录</span>
          </div>
          <div class="text item">
            <el-form class="login-form">
              <el-form-item prop="username" class="wrapper" >
                <i class="fa fa-user-circle" aria-hidden="true"></i>
                <input type="text" v-model="name" placeholder="手机号/会员名">
              </el-form-item>
              <el-form-item prop="password" class="wrapper">
                <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                <input type="password" v-model="pwd" placeholder="密码">
              </el-form-item>
              <el-button class="strength" type="primary" @click.prevent="handLogin" >登录</el-button>
            </el-form>
          </div>
          <div class="clearfix">
            <p>其他登陆方式</p>
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
              <span class="pass">合作卡 </span>
          </div>
        </el-card>
      </div>
      <!--登陆卡片-->
    </el-main>
    <!--foot-->
    <el-footer>
      <div class="footer">
        <p id="TN-24">24小时客户服务电话(免长途费)：4007-999-999  玩去呼叫中心位于杭州来电将统一显示为 025-123999</p>
        <p id="TN-links">
        <a href="javascript:;">关于我们</a>
        <a href="javascript:;">Investor Relations</a>
        <a href="javascript:;">联系我们</a>
        <a href="javascript:;">投诉建议</a>
        <a href="javascript:;">广告服务</a>
        <a href="javascript:;">旅游券</a>
        <a href="javascript:;">玩去招聘</a>
        <a href="javascript:;">隐私保护</a>
        <a href="javascript:;">免责声明</a>
        <a href="javascript:;">旅游度假资质</a>
        <a href="javascript:;">供应商合作</a>
        <a href="javascript:;">用户协议</a>
        <a href="javascript:;">网站地图</a>
        <br>
        <a href="javascript:;">团队博客</a>
        <a href="javascript:;">网站联盟</a>
        <a href="javascript:;">UEIP</a>
        <a href="javascript:;">帮助中心</a>
    </p>
    <p id="copyright">Copyright © 2006-2014
        <a rel="nofollow" href="javascript:;">玩去旅游网</a>
        <a rel="nofollow" href="javascript:;">WanQu.com</a> |
        <a target="_blank" href="javascript:;">营业执照</a> |
        <a target="_blank" href="javascript:;">ICP证：ZAB2-20130006</a>&nbsp;&nbsp;
        <a target="_blank" href="javascript:;">上海旅游网</a>
    </p>
      </div>
    </el-footer>
  </div>
</template>

<script>
export default {
  data() {
    return {
      name:"",
      pwd:""
    }
  },
  methods: {
    handLogin(){
      //1：获取用户输入的用户名和密码
      var name=this.name;
      var pwd=this.pwd;
      //2：验证
      var reg=/^\w{5,12}$/i;
      if(!reg.test(name)){
        alert("用户名格式不正确");
        return;
      }
      if(!reg.test(pwd)){
        alert("密码格式不正确");
        return;
      }
      //发送请求
      var url="http://127.0.0.1:3000/login?name="+name+"&pwd="+pwd;
      this.axios.get(url).then(result=>{
        if(result.data.code>0){
          // this.$router.push("/网站首页");
          alert("跳到登陆页面")
        }else{
          alert(result.data.msg);
        }
      })
    }
  },
  
};
</script>

<style scope="">
.container {
  width: 100%;
  height: 745px;
}

 
.logo {
  width: 1200px;
  margin: 0 auto;
}
.el-main {
  background-image: url("http://127.0.0.1:3000/images/bj.jpg");
  color: #333;
  text-align: center;
  height: 560px;
}
/*登陆卡片*/
.el-card__header{
  /* background: #7CCB46; */
  font-size: 20px;
  font-weight: bold;
}
.wrapper { position: relative; }
i.fa-user-circle, i.fa-unlock-alt{ position: absolute; top: 15px; left: 37px; }
.wrapper input { text-indent: 30px;}

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
  width: 400px;
  height: 401px;
  float: right;
}
input[type="text"],
input[type="password"] {
  height: 38px;
  width: 300px;
}
.strength{
		width: 300px;
		margin: auto;
		/* margin-left: 110px; */
		margin-bottom: 30px;
	}
  .pass{
    margin-left: 5px;
    margin-right: 5px;
    font-size: 14px;
    color: #333;
  }
  p{font-size: 14px}
  .blue{color:#00AAEE}
  .green{color:#4CBF00}
  .red{color:#E7222E}
  .light{color: #2AC09E}

  /*footer*/
  .footer{
    width: 1000px;
    height: 150px;
    margin: 0 auto;
    margin-top:30px;
    font-size: 12px;
    color:#777;
  }
  .footer p{
    line-height: 18px;
    text-align: center;
  }
  .footer a{
    color: #777;
    text-decoration: none;
    margin:0 3px;
  }

</style>