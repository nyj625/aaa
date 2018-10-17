<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>表格</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <!--<link rel="stylesheet" href="http://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">-->
    <link rel="stylesheet" href="../frame/static/css/style.css">
    <link rel="icon" href="../frame/static/image/code.png">
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../layui/layui.js"></script>
	<script type="text/javascript" src="../js/index.js"></script>
	<script type="text/javascript" src="../layui/layui.all.js"></script>

    
</head>


<script type="text/javascript" >


function del(id) {
	  
	if(confirm("确认删除？")){
		location.href="dele?id="+id;
	}
}

function fresh() {
		location.href = "index";
	}
	


</script>
<script type="text/javascript">
function up(id){
	layer.open({
		  type: 2,
		  area: ['300px', '250px'],
		  fixed: false, //不固定
		  maxmin: true,
		  content: "edit?id="+id
		});
}




function zj(){
	layer.open({
		  type: 2,
		  area: ['300px', '250px'],
		  fixed: false, //不固定
		  maxmin: true,
		  content: 'add'
		});
}



</script>

<body class="body">
<form action="index" method="post">
<c:forEach items="${requestScope.sclist}" var="r">
<select name="school_id">
<option value="${r.id}">${r.name}</option>
</select>
</c:forEach>
 <button  class="layui-btn" type="submit">查询</button>
<button  class="layui-btn" type="button" onclick="zj();">新增</button>





</form>



<table class="layui-table">
    <colgroup>
        <col width="150">
        <col width="150">
        <col width="200">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th>id</th>
        <th>学院</th>
        <th>学校</th>
        <th>功能</th>
    </tr>
    </thead>
    <tbody>
   
   <c:forEach items="${requestScope.list}" var="r">
   
     <tr>
        <th>${r.id}</th>
        <th>${r.name}</th>
        <th>${r.s_name}</th>
         <th><a href="javascript:up(${r.id});">修改</a>||<a href="javascript:del(${r.id});">删除</a></th>
 
    </tr>
   
   
   
   </c:forEach>

					</tbody>
   
   
</table>


<script type="text/javascript" src="../frame/layui/layui.js"></script>
<script type="text/javascript">
   


</script>
</body>
</html>