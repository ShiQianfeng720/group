import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
//sqf
import Home from '@/views/Home.vue'
import Grade from '@/views/nav1/grade.vue'

import Login from '@/components/sqf/Login.vue'
import Register from '@/components/sqf/Register.vue'
import HTlogin from '@/components/sqf/HTlogin.vue'

Vue.use(Router)

export default new Router( {
routes:[ 
  // {
  //   path:'/', 
  //   name:'HelloWorld', 
  //   component:HelloWorld
  // }, 
  {path:'/', component:Home},
  {path:'/Login', component:Login},
  {path:'/Register', component:Register},
  {path:'/HTlogin', component:HTlogin},
  

  //后台管理
  {
    path: '/nav1',
    component: Home,
    children: [
        { path: '/grade', component: Grade},
        
    ]
}, 




]
})
