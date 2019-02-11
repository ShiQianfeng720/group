import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import test from '@/components/test'
//sqf
import Home from '@/views/Home.vue'
import JingDian from '@/views/JingDian.vue'
import HuiYuan from '@/views/HuiYuan.vue'
import DingDan from '@/views/DingDan.vue'
import LiuYan from '@/views/LiuYan.vue'
import Login from '@/components/sqf/Login.vue'
import Register from '@/components/sqf/Register.vue'
import HTlogin from '@/components/sqf/HTlogin.vue'

Vue.use(Router)

export default new Router( {
routes:[ 
  {
    path:'/', 
    name:'HelloWorld', 
    component:HelloWorld
  }, 
  {path:'/test', component:test},
  {path:'/Login', component:Login},
  {path:'/Register', component:Register},
  {path:'/HTlogin', component:HTlogin},


  //后台管理
  {
    path:'/Home',
    component:Home,
    redirect:"HuiYuan",//重定向，第一次进入就进入HuiYuan，不添加的话第一次进入右侧是空白
    children:[
    {path:'/JingDian',component:JingDian},
    {path:'/HuiYuan',component:HuiYuan},
    {path:'/DingDan',component:DingDan},
    {path:'/LiuYan',component:LiuYan},
  ]}, 




]
})
