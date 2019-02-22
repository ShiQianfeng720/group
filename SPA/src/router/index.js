import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
//sqf
import Home from '@/views/Home.vue'
import Score from '@/views/nav1/score.vue'
import List from '@/views/nav1/list.vue'
import New from '@/views/nav1/new.vue'
import Manage from '@/views/nav2/manage.vue'
import ProductList from '@/views/nav2/productList.vue'
import TaoList from '@/views/nav2/taoList.vue'
import MemberChart from '@/views/nav4/memberChart.vue'
import SellChart from '@/views/nav4/sellChart.vue'

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
  {path:'/Home', component:Home},
  {path:'/Login', component:Login},
  {path:'/Register', component:Register},
  {path:'/', component:HTlogin},
  

  //后台管理
  {
    path: '/nav1',
    component: Home,
    children: [
        { path: '/score', component: Score},
        { path: '/list', component: List},
        { path: '/new', component: New},
        
    ]
}, 
{
    path:'/nav2',
    component:Home,
    children:[
        { path:'/manage',component:Manage},
        { path:'/productList',component:ProductList},
        { path:'/taoList',component:TaoList},
    ]
},
{
    path:'/nav4',
    component:Home,
    children:[
        { path:'/memberChart',component:MemberChart},
        { path:'/sellChart',component:SellChart},
        
    ]
}



]
})
