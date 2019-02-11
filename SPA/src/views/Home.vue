<template>
  <el-container class="container">
    <!--Header-->
    <el-header class="head">
      <el-row>
        <el-col :span="24" class="head">
          <el-col :span="10" class="logo">{{logoNmae}}</el-col>
          <el-col :span="10">
            <div class="tools">
              <i class="fa fa-align-justify"></i>
            </div>
          </el-col>

          <el-col :span="4" class="userinfo">
            <el-dropdown trigger="hover">
              <span class="el-dropdown-link userinfo-inner">
                <img src="http://127.0.0.1:3000/images/timg.jpg">
                {{useName}}
              </span>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item>我的消息</el-dropdown-item>
                <el-dropdown-item>设置</el-dropdown-item>
                <el-dropdown-item divided @click.native="logout">退出登录</el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
          </el-col>
        </el-col>
      </el-row>
    </el-header>
    <!--container-->
    <el-container>
      <!--container aside-->
      <el-aside class="collapsed">
        <el-col :span="24">
          <el-menu
default-active="1"
class="el-menu-vertical-demo"
background-color="#283846"
text-color="#fff"
active-text-color="#ffd04b"
:router="true"
>
<el-submenu index="1">
<template slot="title">
<i class="el-icon-location"></i>
<span>会员管理</span>
</template>
<el-menu-item-group>
<el-menu-item index="1-1">会员列表</el-menu-item>
<el-menu-item index="1-2">新增会员</el-menu-item>
<el-menu-item index="/grade">会员等级</el-menu-item>
</el-menu-item-group>
</el-submenu>

<el-submenu index="2">
<template slot="title">
<i class="el-icon-location"></i>
<span>商品管理</span>
</template>
<el-menu-item index="2-1">商品列表</el-menu-item>
<el-menu-item index="2-2">套餐列表</el-menu-item>
<el-menu-item index="2-3">库存管理</el-menu-item>
</el-submenu>

<el-submenu index="3">
<template slot="title">
<i class="el-icon-location"></i>
<span>收银管理</span>
</template>
<el-menu-item index="3-1">选项1</el-menu-item>
<el-menu-item index="3-2">选项2</el-menu-item>
<el-menu-item index="3-3">选项3</el-menu-item>
</el-submenu>

<el-submenu index="4">
<template slot="title">
<i class="el-icon-location"></i>
<span>报表管理</span>
</template>
<el-menu-item index="4-1">商品列表</el-menu-item>
<el-menu-item index="4-2">套餐列表</el-menu-item>
<el-menu-item index="4-3">员工提成</el-menu-item>
</el-submenu>
</el-menu>
        </el-col>
      </el-aside>
      <!--container main-->
      <el-main class="ma">
            <router-view></router-view>
      </el-main>
    </el-container>
  </el-container>
</template>


<script>

export default {
  data() {
    return {
      logoNmae: "SPA",
      useName: "管理员",
      searchCriteria: "",
      breadcrumbItems: ["会员管理"]
    };
  },
  methods: {
    logout: function() {
      var _this = this;
      this.$confirm("确认退出吗?", "提示", {
        //type: 'warning'
      })
        .then(() => {
          sessionStorage.removeItem("user");
          _this.$router.push("/HTlogin");
        })
        .catch(() => {});
    },

    // handleSelect(key, keyPath) {
    //   switch (key) {
    //     case "1":
    //       this.$router.push("/HuiYuan");
    //       break;
    //     case "2":
    //       this.$router.push("/JingDian");
    //       break;
    //     case "3":
    //       this.$router.push("/DingDan");
    //       break;
    //     case "4":
    //       this.$router.push("/LiuYan");
    //       break;
    //   }
    // }
  }
};
</script>

<style scope>
.container {
  /* width: 1500px; */
  height: 800px;
  margin: 0 auto;
  
}
/*head*/

.el-header {
  background-color: #20a0ff;
  color: #333;
  text-align: center;
  line-height: 60px;
}
.logo {
  width: 280px;
  height: 60px;
  font-size: 22px;
  padding-left: 20px;
  padding-right: 20px;
  border-color: rgba(238, 241, 146, 0.3);
  border-right-width: 1px;
  border-right-style: solid;
  color: #fff;
}
.logo img {
  width: 40px;
  float: left;
  margin: 10px 10px 10px 18px;
}
.tools {
  padding: 0px 23px;
  width: 14px;
  height: 60px;
  line-height: 60px;
  cursor: pointer;
}
.userinfo {
  text-align: right;
  padding-right: 35px;
  float: right;
}
.userinfo .userinfo-inner {
  cursor: pointer;
  color: #fff;
}
.userinfo img {
  width: 40px;
  height: 40px;
  border-radius: 20px;
  margin: 10px 0px 10px 10px;
  float: right;
}

/*aside*/
.el-aside {
  background-color: #d3dce6;
  color: #333;
  text-align: center;
}
.aside {
  width: 60px;
}

.collapsed {
  width: 60px;
  padding-top: 10px;
}
.collapsed .item {
  position: relative;
}
.el-menu-item {
  height: 56px;
  line-height: 56px;
  font-size: 15px;
  padding: 0 20px;
  cursor: pointer;
  position: relative;
  transition: border-color 0.3s, background-color 0.3s, color 0.3s;
  box-sizing: border-box;
  white-space: nowrap;
}

.el-main {
  background-color: #e9eef3;
  color: #333;
  /* text-align: center; */
  /* line-height: 160px; */
}
</style>
