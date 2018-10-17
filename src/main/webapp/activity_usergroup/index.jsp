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
layui.use('layui-form', function(){
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
		  area: ['650px', '500px'],		  
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
    <form class="layui-form">
    <span class="fr">
    	
    		<span class="layui-form-label">搜索条件：</span>
        		<div class="layui-input-inline ">
					<select  class="inputselect" name="select">
						<option value="name">小组名</option>
						<option value="project">项目名称</option>
						<option value="activity_id">活动</option>
					</select>
				
				</div>
		        <div class="layui-input-inline sinput">
		            <input type="text" value="" placeholder="请输入搜索条件" class="layui-input" name="input">
		        </div>
        <button class="layui-btn mgl-20" onclick="search();">查询</button>
    </span>
    </form>
</div>

<!-- 表格 -->
<div id="dateTable">
<table class="layui-table">
<thead>
<tr>
<td>小组名</td>
<td>创建时间</td>
<td>项目名称</td>
<td>活动</td>
<td>录入员</td>
<td>分数一览</td>
<td>备注</td>
<td>操作</td>
</tr>
</thead>
<tbody>

<c:forEach items="${requestScope.list}" var="r">
<tr>
<td>小组一</td>
<td>${r.createdate}</td>
<td>购物商城</td>
<td>蓝桥杯</td>
<td>${r.operator_id}</td>
<td>${r.point1},${r.point2},${r.point3},${r.point4},${r.point5},${r.point6},${r.point7},${r.point8},${r.point9},${r.point10}</td>
<td>${r.comments}</td>
<td>

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