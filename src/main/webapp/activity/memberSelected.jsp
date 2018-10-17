<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../frame/layui/css/layui.css">
<link rel="stylesheet" href="../frame/static/css/style.css">
<link rel="icon" href="../frame/static/image/code.png">
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
<script src="../frame/layui/layui.all.js" charset="utf-8"></script>
<style>
	.left
	{
		width:550px;
		display:inline-block;
		float:left;
		margin:0px 35px;
	}
	.left [type=text]
	{
		width:140px;
		display:inline-block;
		margin:0px -30px;
	}
	.left label{
		margin:0px -10px;
		width:60px;
	}
	.left button
	{
		display:inline-block;
		position:absolute;
	}
	.right
	{
		width:550px;
		display:inline-block;
		margin:70px 40px;
		position:fixed;
	}
	.layui-table{
		width:95%;
		
	}
	.layui-table-view {
    margin: 10px 20px;
}
</style>
	<script>
		function addToRight(id){
			var activity_id=<%=request.getAttribute("activity_id")%>;
			window.location.href="newMember?activity_id="+activity_id+"&id="+id;
/* 			$.post("newMember",{activity_id:activity_id,id:id},function(msg){
				 form.render();
			},"text"); */

		}
		function addToLeft(obj){
			
		}
		function distribute()
		{
			var nikis=new Array();
			var names=new Array();
			$(".right table tbody tr").each(function(index,element){
				nikis.push($(this).find(":first").html());
				names.push($(this).find(":first").next().html());
			});
			parent.setMember(nikis,names);
			var index=parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		}
		function edit(){
			layer.open({
				  type: 2,
				  area: ['700px', '450px'],
				  fixed: false, //不固定
				  maxmin: true,
				  content: '../activity_user/add',
				  scrollbar: false,
				  maxmin: false,
				  resize:false
				});
		}
		function noLast(){
			var activity_id=<%=request.getAttribute("activity_id")%>;
			window.location.href="noLast?activity_id="+activity_id;
		}
	</script>
</head>
<body>
<form class="layui-form" action="">
<div class="layui-form-item" style="margin:20px 0">
        <label class="layui-form-label">活动名</label>
        <div class="layui-input-block" style="width:450px;">
        	<input type="text" name="txt" lay-verify="title" autocomplete="off" placeholder="名字" class="layui-input" style="width:200px;display:inline-block">
        	<input type="text" name="txt" lay-verify="title" autocomplete="off" placeholder="电话" class="layui-input" style="margin:0px -30px;width:200px;display:inline-block;">
            <button class="layui-btn"  type="button" onclick="edit()" style="display:inline-block">添加</button>
        </div>
</div>
</form>

<table class="layui-table layui-table-view" lay-even="" lay-skin="row">
    <thead>
	    <tr>
	        <th>勾选</th>
	        <th>用户名</th>
	        <th>联系方式</th>
	        <th>就读或就职</th>
	    </tr>
    </thead>
    <tbody>
    	<c:forEach items="${requestScope.user_added}" var="r">
	    	<tr>
	    		<td><input type="checkbox" name=""  lay-skin="primary" value=${r.id } onchange="amount(this)"></td>
		        <td>${r.name}</td>
		        <td>QQ:${r.qq} <br/>tel:${r.tel}</td>
		        <td>
		        	<c:forEach items="${requestScope.school }" var="s">
		        		<c:if test="${s.id==r.school_id }">${s.name}</c:if>
		        	</c:forEach>
		        	<c:forEach items="${requestScope.college }" var="c">
		        		<c:if test="${c.id==r.college_id }">${c.name }</c:if>
		        	</c:forEach>
		        	${r.classinfo}
		        </td>
	    	</tr>
    	</c:forEach>
    </tbody>
</table> 

<button type="button" class="layui-btn" style="display:inline-block" onclick="noLast()">不要最后一个</button>
</body>
</html>