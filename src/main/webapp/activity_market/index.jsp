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
	<script type="text/javascript" src="../js/jquery.cookie.js"></script>
</head>
<body class="body">
<script type="text/javascript">
$(function(){
	var form = layui.form;
form.on('select(sselect)',function(data){
		
		$.cookie('serach',data.value);
		console.log($.cookie('serach'));
		console.log(data.othis.html());
	});
$(".selecttype").find("[value="+$.cookie('serach')+"]").prop("selected",true);
	   form.render(); 
})
layui.use(['form', 'layedit', 'laydate', 'element'], function () {
    var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate
            , element = layui.element;
   
	
    form.render();       
    laydate.render({
        elem: '#date'
    });
    laydate.render({
        elem: '#date1'
    });
    //监听提交
    //form.on('submit(sub)', function (data) {
      //  layer.alert(JSON.stringify(data.field), {
       //     title: '最终的提交信息'
      //  });
        return false;
  //  });

});

function add(url){
	layer.open({
		  type: 2,
		  area: ['700px', '500px'],		  
		  maxmin: true,
		  content:url,
		fixed:false
		});
}
function del(id){
	location.href="delete?id="+id;
	
}
function search(){
	
	$.post('index',{activity_id:$(".selecttype").val()},function(){
		
	},"text")
}
</script>
<!-- 工具集 -->

 
<div class="my-btn-box">
    <span class="fl">       
        <a class="layui-btn btn-add btn-default" id="btn-add" href="javascript:;" onclick="add('change');" style="display:inline-block">添加</a>      
    </span>
   
    	<form class="layui-form" style="display:inline-block">
    	<div class="layui-form-item" style="margin-left: 700px;"> 
    	<label style="display:inline-block;margin-top:9px;float:left">搜索条件：</label>
    	<div class="layui-input-inline">   	 					      
		        <select class='selecttype'  name="activity_id" lay-filter="sselect">
		        <c:forEach items="${requestScope.activity}" var="r" varStatus="v">
		        <option value="${r.id}">${r.name}</option>
		        </c:forEach>
		        </select>		           
		 </div>     
        <button class="layui-btn mgl-20" onclick="search();" style="display:inline-block">查询</button>

     </div>
    	</form>
  
</div>

<!-- 表格 -->
<div id="dateTable">
<table class="layui-table">
<thead>
<tr>
<td>活动名称</td>
<td>添加人</td>
<td>日期</td>
<td>事件</td>
<td>活动注意事项</td>
<td width="40px;">学生信息</td>
<td width="160px;">操作</td>
</tr>
</thead>
<tbody>

<c:forEach items="${requestScope.list}" var="r">
<tr>
<td>${r.activity_name}</td>
<td>${r.operator_name}</td>
<td>${r.date}</td>
<td>${r.info}</td>
<td>${r.comments}</td>
<td><a class="layui-btn layui-btn-primary layui-btn-small"  title="查看" href="javaScript:;" onclick="add('information?id=${r.id}');"><i class="layui-icon">&#xe609;</i></a></td>
<td>
    <a class="layui-btn layui-btn-mini layui-btn-normal" href="javascript:;" onclick="add('edit?id=${r.id}')">编辑</a>
    <a class="layui-btn layui-btn-mini layui-btn-danger" href="javascript:;" onclick="del(${r.id})">删除</a>
</td>
</tr>
</c:forEach>

</tbody>
</table>
</div>
<script type="text/javascript">
layui.use('form', function(){
	  var form = layui.form;
	  form.render();
	  });
	  
	  
	  
	  
</script>


</body>
</html>