//wanqu_server 服务器
const express = require("express");
var app = express();
app.use(express.static("public"));
app.listen(3000);
const pool = require("./pool");

//express mysql 参数 request;response
//跨域访问配置
	//1:加载模块cors
		const cors = require("cors");
	//2:配置cors
		app.use(cors({
		  origin:["http://127.0.0.1:8080",
		  "http://localhost:8080"],//允许列表
		  credentials:true   //是否验证
		}))
	//3:加载第三方模块express-session
		const session = require("express-session");
	//4:配置模块
		app.use(session({
		  secret:"128位随机字符串", //安全令牌--计算sessionID
		  resave:false,   //请求保存  无需每次重新设置
		  saveUninitialized:true, //初始化
		  cookie:{  
			maxAge:1000*60*60*24  //session保存时间  1天
		  }
		}))

                    
		//功能1：用户注册
app.get("/register",(req,res)=>{
  //1:参数 name pwd
  var uname=req.query.name;
  var password=req.query.pwd;
  //1.1:验证
  var reg=/^[a-z0-9_]{5,12}$/;
  if(!reg.test(uname)){
    res.send({
      code:-1,
      msg:"用户名格式不正确"
    });
    return;
  }
  //2：sql INSERT INTO 如果验证正确就把注册信息插入数据库
  var sql="INSERT INTO user(uid,uname,password) VALUES (null,?,md5(?))";
  pool.query(sql,[uname,password],(err,result)=>{
    if(err)throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"注册成功"});
      
    }else{
      res.send({code:-1,msg:"注册失败"});
    }
  })
  //返回值q
})

//功能2：用户名是否存在
app.get("/existsname",(req,res)=>{
  //1:获取参数
  var uname=req.query.name;
  //2:sql name
  var sql =" SELECT count(uid) as c from user WHERE uname=?";
  pool.query(sql,[uname],(err,result)=>{
    if(err)throw err;
    if(result[0].c>0){
      res.send({code:-1,msg:"用户名已存在"});
    }else{
      res.send({code:1,msg:"欢迎使用"});
    }
  })
});
//功能3：用户登陆
app.get("/login",(req,res)=>{
  //1:获取请求参数
  var uname=req.query.name;
  var password=req.query.pwd;
  //sql查询
  var sql="SELECT count(uid) as c,uid from user WHERE uname=? AND password=md5(?)";
  pool.query(sql,[uname,password],(err,result)=>{
    if(err)throw err;
    if(result[0].c>0){
      //如果匹配成功就将id保存到session 中
      req.session.uid=result[0].uid;
      res.send({code:1,msg:"登陆成功"})
    }else{
      res.send({code:-1,msg:"用户名或密码有误！"})
    }
  })
})

//功能4：留言table数据获取
app.get("/tabList",(req,res)=>{
  //查询数据库，并将表相应给浏览器
  var sql="SELECT * FROM message";
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    if(result.length>0){
      res.send(result);
    }
  })
})
//功能5：景点table数据获取
app.get("/jdList",(req,res)=>{
  //查询数据库，并将表格响应数据发送给浏览器
  var sql="SELECT * FROM jingdian";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send(result);
    }
  })
})

//功能6：留言分页
app.get("/getLiu",(req,res)=>{
  //1:参数       pno 页码;pageSize 页大小
  var pno = req.query.pno;
  var pageSize = req.query.pageSize;
  //1.2:默认值
  if(!pno){
    pno = 1;
  }
  if(!pageSize){
    pageSize = 4;
  }
  //2:验证正则表达式
  var reg = /^[0-9]{1,}$/;
  if(!reg.test(pno)){
     res.send({code:-1,msg:"页码格式不正确"});
     return;
  }
  if(!reg.test(pageSize)){
    res.send({code:-2,msg:"页大小格式不正确"});
    return;
  }
  //3:创建sql
  //  查询总页数
  var sql = "SELECT count(id) as c FROM message";
  var progress = 0; //sql执行进度
  obj = {code:1};
  pool.query(sql,(err,result)=>{
       if(err)throw err;
       //console.log(result[0].c);
       var pageCount = Math.ceil(result[0].c/pageSize);
       obj.pageCount = pageCount;
       progress += 50;
       if(progress == 100){
        res.send(obj);
       }
  });
  //  查询当前页内容
var sql=" SELECT mid,aid,time,content,level";
    sql +=" FROM message";
    sql +=" LIMIT ?,?"
var offset = parseInt((pno-1)*pageSize);
pageSize = parseInt(pageSize);
  pool.query(sql,[offset,pageSize],(err,result)=>{
    if(err)throw err;
    //console.log(result);
    obj.data = result;
    progress+=50;
    if(progress==100){
      res.send(obj);
    }
  }); 
})
