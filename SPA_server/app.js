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
    origin: ["http://127.0.0.1:8080",
        "http://localhost:8080"],//允许列表
    credentials: true   //是否验证
}))
//3:加载第三方模块express-session
const session = require("express-session");
//4:配置模块
app.use(session({
    secret: "128位随机字符串", //安全令牌--计算sessionID
    resave: false,   //请求保存  无需每次重新设置
    saveUninitialized: true, //初始化
    cookie: {
        maxAge: 1000 * 60 * 60 * 24  //session保存时间  1天
    }
}))



//会员管理

//功能1：会员列表和分页
app.get("/getList", (req, res) => {
    //1:参数   pno页码，pageSize页大小
    var pno = req.query.pno;
    var pageSize = req.query.pageSize;
    //1.2设置默认值
    if (!pno) {
        pno = 1;
    }
    if (!pageSize) {
        pageSize = 7;
    }
    //2:验证正则表达式
    var reg = /^[0-9]{1,}$/;  //页码也大小都是数值，至少1位多了不限
    if (!reg.test(pno)) {
        res.send({code: -1, msg: "页码格式不正确"});
        return;
    }
    if (!reg.test(pageSize)) {
        res.send({code: -2, msg: "页大小格式不正确"});
        return;
    }
    //3:创建sql
    //查询总页数
    var sql = "SELECT count(mid) as c FROM member";
    var progress = 0; //sql执行进度
    obj = {code: 1};
    pool.query(sql, (err, result) => {
        if (err) throw err;
        // console.log(result[0].c);//数据总条数
        var pageCount = Math.ceil(result[0].c / pageSize); //数据总页数
        obj.pageCount = pageCount;
        progress += 50;
        if (progress == 100) {
            res.send(obj);
        }

    });
    //3.2:查询当前页内容
    var sql = "SELECT mid,mname,gender,phone,level,money,core,count FROM member LIMIT ?,?";
    var offset = parseInt((pno - 1) * pageSize);
    pageSize = parseInt(pageSize);
    pool.query(sql, [offset, pageSize], (err, result) => {
        if (err) throw err;
        // console.log(result);
        obj.data = result;
        progress += 50;
        if (progress == 100) {
            res.send(obj);
        }
    });
});

// 新增会员
app.get("/addnewuser", (req, res) => {
    // 获取参数
    // var idno = req.query.idno; // 会员卡号
    const name = req.query.name; // 姓名
    const gender = req.query.gender; // 性别
    const phone = req.query.phone; // 手机号
    const level = req.query.level; // 会员级别
    const money = req.query.money; // 余额
    const score = req.query.score; // 积分
    const count = 0; // 消费次数

    var sql = "INSERT INTO member (mname, gender, phone, level, money, core, count) VALUES (?, ?, ?, ?, ?, ?, ?)";
    pool.query(sql, [name, gender, phone, level, money, score, count], (err, result) => {
        if (err) throw err;
        if (result['insertId'] > 0) {
            res.send({code: 1, msg: "新增会员成功"});
        } else {
            res.send({code: -1, msg: "新增会员失败"});
        }
    })
});

//商品管理
//商品列表及分页
app.get("/getProductList", (req, res) => {
    //1:参数   pno页码，pageSize页大小
    var pno = req.query.pno;
    var pageSize = req.query.pageSize;
    //1.2设置默认值
    if (!pno) {
        pno = 1;
    }
    if (!pageSize) {
        pageSize = 7;
    }
    //2:验证正则表达式
    var reg = /^[0-9]{1,}$/;  //页码也大小都是数值，至少1位多了不限
    if (!reg.test(pno)) {
        res.send({code: -1, msg: "页码格式不正确"});
        return;
    }
    if (!reg.test(pageSize)) {
        res.send({code: -2, msg: "页大小格式不正确"});
        return;
    }
    //3:创建sql
    //查询总页数
    var sql = "SELECT count(id) as c FROM goods";
    var progress = 0; //sql执行进度
    obj = {code: 1};
    pool.query(sql, (err, result) => {
        if (err) throw err;
        // console.log(result[0].c);//数据总条数
        var pageCount = Math.ceil(result[0].c / pageSize); //数据总页数
        obj.pageCount = pageCount;
        progress += 50;
        if (progress == 100) {
            res.send(obj);
        }

    });
    //3.2:查询当前页内容
    var sql = "SELECT id,pic,title,classify,des,price,number FROM goods LIMIT ?,?";
    var offset = parseInt((pno - 1) * pageSize);
    pageSize = parseInt(pageSize);
    pool.query(sql, [offset, pageSize], (err, result) => {
        if (err) throw err;
        // console.log(result);
        obj.data = result;
        progress += 50;
        if (progress == 100) {
            res.send(obj);
        }
    });
});
