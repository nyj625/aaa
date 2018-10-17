<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>登录</title>
    <link rel="stylesheet" href="frame/layui/css/layui.css">
    <link rel="stylesheet" href="frame/static/css/style.css">
    <link rel="icon" href="frame/static/image/code.png">
    
    <script type="text/javascript" src="frame/layui/layui.js"></script>
	<script type="text/javascript">
	layui.use('element', function(){
		  var element = layui.element;
		 
		});
        if (window.top !== window.self) {
            window.top.location = window.location;
        }
        var a=0;
        function changerimg(o) {
			o.src="img?a="+(a++);
		}
    </script>
    
    
    
</head>
<body class="login-body body">

<div class="layui-tab">
  <ul class="layui-tab-title">
    <li class="layui-this">用户登录</li>
    <li>内部人员登陆</li>
  </ul>
  <div class="layui-tab-content">
    <div class="layui-tab-item layui-show">
     
<div class="login-box">
    <form class="layui-form layui-form-pane" method="post" action="activity_user/login">
        <div class="layui-form-item">
            <h3>欢迎登陆</h3>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">账号：</label>

            <div class="layui-input-inline">
                <input type="text" name="tel" class="layui-input" lay-verify="account" placeholder="账号"
                       autocomplete="on" maxlength="20"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码：</label>

            <div class="layui-input-inline">
                <input type="password" name="pass" class="layui-input" lay-verify="pass" placeholder="密码"
                       maxlength="20"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">验证码：</label>

            <div class="layui-input-inline">
                <input type="text" name="code" class="layui-input" lay-verify="code" placeholder="验证码" maxlength="4" style="width: 90px;display: inline-block;"/>
                <img  src="img" onclick="changerimg(this);" style="display: inline-block;">
            </div>
        </div>
        <div class="layui-form-item">
            <button type="reset" class="layui-btn layui-btn-danger btn-reset">重置</button>
            <button type="submit" class="layui-btn btn-submit" >立即登录</button>
        </div>
    </form>
</div>
    </div>
    <div class="layui-tab-item">
<div class="login-box">
    <form class="layui-form layui-form-pane" method="post" action="operator/login">
        <div class="layui-form-item">
            <h3>思途后台登录系统</h3>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">账号：</label>

            <div class="layui-input-inline">
                <input type="text" name="niki" class="layui-input" lay-verify="account" placeholder="昵称"
                       autocomplete="on" maxlength="20"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码：</label>

            <div class="layui-input-inline">
                <input type="password" name="pass" class="layui-input" lay-verify="pass" placeholder="密码"
                       maxlength="20"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">验证码：</label>

            <div class="layui-input-inline">
                <input type="text" name="code" class="layui-input" lay-verify="code" placeholder="验证码" maxlength="4" style="width: 90px;display: inline-block;"/>
                <img  src="img" onclick="changerimg(this);" style="display: inline-block;">
            </div>
        </div>
        <div class="layui-form-item">
           <button type="reset" class="layui-btn layui-btn-danger btn-reset">重置</button> 
            <button type="submit" class="layui-btn btn-submit" >立即登录</button>
        </div>
    </form>
</div>
</div>
    
  </div>
</div>


</body>
</html>