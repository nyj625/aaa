<%@ page language="java" contentType="text/html; charset=utf-8"
isELIgnored="false"  pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>管理人员</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <!--<link rel="stylesheet" href="http://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">-->
    <link rel="stylesheet" href="../frame/static/css/style.css">
    <link rel="icon" href="../frame/static/image/code.png">
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../layui/layui.js"></script>
	<script type="text/javascript" src="../js/index.js"></script>
	<script type="text/javascript" src="../layui/layui.all.js"></script>
</head>
<body class="body">
<script type="text/javascript">
layui.use('form', function(){
	  var form = layui.form;
	  form.render();
	  });
function reset(id){
	$.post('updatepass',{id:id},function(json){
		if(json.status>0)
			alert("重置成功");
	},"json")
	
}
function add(url){
	alert(url);
	layer.open({
		  type: 2,
		  area: ['500px', '400px'],		  
		  maxmin: true,
		  content:url,
		fixed:false
		});
}
function del(id){
	location.href="delete?id="+id;
	
}
function search(){
	$.post('index',$(".layui-form").serialize(),function(){
		
	},"text")
}
</script>
<!-- 工具集 -->

 
<div class="my-btn-box">
    <span class="fl">       
        <a class="layui-btn btn-add btn-default" id="btn-add" href="javascript:;" onclick="add('change');">添加</a>      
    </span>
    <span class="fr">
    	<form class="layui-form">
    		<span class="layui-form-label">搜索条件：</span>
        		<div class="layui-input-inline sinput">
					<select  class="inputselect" name="select">
						<option value="name">名称</option>
						<option value="tel">登录名tel</option>
						<option value="nike">昵称</option>
					</select>
				</div>
		        <div class="layui-input-inline sinput">
		            <input type="text" value="" placeholder="请输入搜索条件" class="layui-input" name="input">
		        </div>
        <button class="layui-btn mgl-20" onclick="search();">查询</button>
    	</form>
    </span>
</div>

<!-- 表格 -->
<div id="dateTable">
<table class="layui-table">
<thead>
<tr>
<td>ID</td>
<td>类型</td>
<td>用户名tel</td>
<td>昵称</td>
<td>权限</td>
<td>状态</td>
<td>姓名</td>
<td>备注</td>
<td>操作</td>
</tr>
</thead>
<tbody>

<c:forEach items="${requestScope.list}" var="r">
<tr>
<td>${r.id}</td>
<td>${r.typelist}</td>
<td>${r.tel}</td>
<td>${r.nike}</td>
<td>${r.powerlist}</td>
<td>${r.status}</td>
<td>${r.name}</td>
<td>${r.comments}</td>
<td>
 <a class="layui-btn layui-btn-mini" lay-event="detail" href="javascript:;" onclick="reset(${r.id})">重置密码</a>
    <a class="layui-btn layui-btn-mini layui-btn-normal" href="javascript:;" onclick="add('edit?id=${r.id}')">编辑</a>
    <a class="layui-btn layui-btn-mini layui-btn-danger" href="javascript:;" onclick="del(${r.id})">删除</a>
</td>
</tr>
</c:forEach>

</tbody>
</table>
</div>



</body>
</html>