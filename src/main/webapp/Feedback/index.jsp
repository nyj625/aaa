<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>用户</title>
    <link rel="stylesheet" href="../frame/layui/css/layui.css">
    <link rel="stylesheet" href="../frame/static/css/style.css">
    <link rel="icon" href="../frame/static/image/code.png">
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
    <script src="../frame/layui/layui.all.js"></script>
    
    <script type="text/javascript">
    
    function del(id){
    	if(confirm("确认删除")){
    		location.href="delete?id="+id;
    	}
    	
    }
	//刷新
    function fresh() {
    	location.href="index";
    }
    //增加
    function openwin() { 
    	layer.open({
			  type: 2,
			  area: ['600px', '400px'],
			  fixed: false, //不固定
			  maxmin: true,
			  content: 'add'
			});

    }
    //修改
    function edit(id) {
    	layer.open({
			  type: 2,
			  area: ['620px', '570px'],
			  fixed: false, //不固定
			  maxmin: true,
			  content: 'edit?id='+id
			});
    	 
    }
    
    //回答问题(修改)
    function opt(id) {
    	layer.open({
			  type: 2,
			  area: ['700px', '600px'],
			  fixed: false, //不固定
			  maxmin: true,
			  content: 'opt?id='+id
			});
    	 
    }
    
    </script>
    <style type="text/css">
    
    .bt{
    	font-size:medium;
    	font-style:inherit;
    	color: olive;
    
    }
    
    </style>
    
</head>
<body class="body">


<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>用户</legend>
</fieldset>

	<div class="demoTable">
	
	
<form action="index" method="post">
 
 
  <input name="txt" class="sinput" style="height: 30px"> 
  
  <button  class="layui-btn" type="submit">查询</button>

<button  class="layui-btn" type="button" onclick="openwin();">新增</button>

</form>
	

	</div>


<div class="layui-form layui-border-box layui-table-view">
	<div class="layui-table-box">
		<div class="layui-table-body layui-table-main">
			<table  class="layui-table">
			<thead>
					<tr>
						
						<th style="width: 20px;text-align: center" ></th>
						<th style="width: 50px;text-align: center" >ID</th>
						<th style="width: 150px;text-align: center" >活动ID</th>
						<th style="width: 150px;text-align: center" >用户ID</th>
						<th style="width: 150px;text-align: center" >回应</th>
						<th style="width: 150px;text-align: center" >状态</th>
						
						
						
						<th style="width: 150px;text-align: center" >编辑</th>
					</tr>
				</thead>
				<tbody>
			<c:forEach items="${requestScope.list}" var="r" >
					<tr class="text-c">
				
				<th style="text-align: center"></th>
				<td style="text-align: center">${r.id}</td>
				<td style="text-align: center">${r.activity_id}</td>
				<td style="text-align: center">${r.user_id}</td>
				<td style="text-align: center">${r.result}</td>
				<td style="text-align: center">
					<c:if test="${r.status==0}">未答</c:if>
					<c:if test="${r.status==1}">已答</c:if>
				</td>
				
				
					<td style="text-align: center">
						<a class="bt" href="javascript:edit(${r.id});">修改</a>|
						<a class="bt" href="javascript:del(${r.id});">删除</a>|
						<a class="bt" href="javascript:opt(${r.id});">回答问题</a>
					</td>
					</tr>
			</c:forEach> 
			
				</tbody>
			</table>
		</div>
	</div>
	
	
	
</div>

<button type="button" class="layui-laypage-btn" onclick="location.href='index?pageno=${requestScope.search.prev}'" >上一页</button>
<button type="button" class="layui-laypage-btn" onclick="location.href='index?pageno=${requestScope.search.next}'">下一页</button>


<script type="text/javascript" src="../frame/layui/layui.js"></script>
<script type="text/javascript">
    


</script>
</body>
</html>