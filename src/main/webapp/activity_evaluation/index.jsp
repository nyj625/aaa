<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 
<!DOCTYPE html>
<html lang="en">
<head>

 	<title>测评表</title>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  
    <link rel="stylesheet" href="../frame/layui/css/layui.css">
    <link rel="stylesheet" href="../frame/static/css/style.css">
    <link rel="icon" href="../frame/static/image/code.png">
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
			  area: ['550px', '400px'],
			  fixed: false, //不固定
			  maxmin: true,
			  content: 'edit.jsp'
			});

    }
    //修改
    function edit(id) {
    	layer.open({
			  type: 2,
			  area: ['550px', '400px'],
			  fixed: false, //不固定
			  maxmin: true,
			  content: 'edit?id='+id
			});
    	 
    }
    
    </script>
    
    
    
    
</head>
<body class="body">


<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>测评表</legend>
</fieldset>

	<div class="demoTable">
	
	
<form action="index" method="post">
 
 
  <input name="txt" class="sinput" style="height: 30px"> 
  
  <button  class="layui-btn" type="submit">查询</button>

<button  class="layui-btn" type="button" onclick="openwin();">新增</button>

</form>
	

	</div>


<div class="layui-form  layui-table-view" >
	<div class="layui-table-box">
		<div class="layui-table-body layui-table-main" >
			<table  class="layui-table">
			<thead>
					<tr>
						
						<th style="width: 20px;text-align: center" ></th>
						<th style="width: 50px;text-align: center" >ID</th>
						<th style="width: 150px;text-align: center" >活动名称</th>
						<th style="width: 150px;text-align: center" >管理员</th>
						<th style="width: 150px;text-align: center" >用户名</th>
						<th style="width: 150px;text-align: center" >分数</th>
						<th style="width: 150px;text-align: center" >状态</th>
						<th style="width: 150px;text-align: center" >备注</th>
						
						
						<th style="width: 150px;text-align: center" >编辑</th>
					</tr>
				</thead>
				<tbody>
			<c:forEach items="${requestScope.list}" var="r" >
					<tr class="text-c">
				
				<th style="text-align: center"></th>
				<td style="text-align: center">${r.id}</td>
				<td style="text-align: center">${r.activity_id}</td>
				<td style="text-align: center">${r.operater_id}</td>
				
				<td style="text-align: center">${r.user_id}</td>
				<td style="text-align: center">${r.point}</td>
				<td style="text-align: center">
					<c:if test="${r.status==0 }">已测评</c:if>
					<c:if test="${r.status==1 }">未测评</c:if>
				</td>
				<td style="text-align: center">${r.comments}</td>
				<td style="text-align: center">
						<a href="javascript:edit(${r.id});">修改</a>|
						<a href="javascript:del(${r.id});">删除</a>
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