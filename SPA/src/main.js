import Vue from 'vue'
//1.引入elementUI组件库
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import App from './App'
import router from './router'

//sqf引入字符图标
import 'font-awesome/css/font-awesome.css'


Vue.use(ElementUI);
Vue.config.productionTip = false

//2.引入axios组件库
  //1.引入指定组件 axios
  import axios from "axios";
  //2.修改配置信息，跨域访问保存session值
  axios.defaults.withCredentials=true;
  //3.注册指定组件
  Vue.prototype.axios=axios;
//3.设置过滤器
  Vue.filter("datatimefilter",function(val){
    //var 当前日期对象
    //1:新创建日期对象
    var date=new Date(val);
    //2:获取年月日时分秒
    var y = date.getFullYear();
    var m = date.getMonth()+1;
    if(m<10) m="0"+m;
    var d = date.getDay();
    if(d<10) d="0"+d;
    var h = date.getHours();
    if(h<10) h="0"+h;
    var min = date.getMinutes();
    if(min<10) min="0"+min;
    var s = date.getSeconds();
    if(s<10) s="0"+s;
    //3.拼接字符串
    return `${y}-${m}-${d} ${h}:${min}:${s}`
  })
//3.1 设置过滤器 sex
Vue.filter("sexfilter",function(val){
if(val){
  return "男"
}else{
  return "女"
}
})
//3.2 设置过滤器 level
Vue.filter("levelfilter",function(val){
  if(val){
    return "高级会员"
  }else{
    return "普通会员"
  }

})
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
