<%@page language="java" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../libs/css/edit.css">
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

function  save() {
	$.post($(".f1").attr("action"),$(".f1").serialize(),function(json){
		if(json.status>0){
			parent.fresh();
			var index=parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		}else{
			alert(json.text);
		}
	},"json");
}



</script>
	<style>
		.inputtext{
			width: 85px;
			
			margin-left: 100px;
		}
	</style>
</head>
<body>


		
	<!-- 判断进行查询还是修改 -->
		<c:if test="${requestScope.info==null}">
		<form class="f1" action="insert" method="post">
		</c:if>
		<c:if test="${requestScope.info!=null}">
		<form class="f1" action="update" method="post">
		<input type="hidden" name="id" value="${requestScope.info.id}">
		</c:if>
		
<div class="inputview">

		<%-- <span class="inputspan"> 
		<label class="inputtext">ID:</label> 
		 <input class="inputinput" name="id" value="${requestScope.info.id}" >
		</span> --%>

		

		<span class="inputspan"> 
		<label class="inputtext">活动ID：</label> 
		 <input class="inputinput" name="activity_id" value="${requestScope.info.activity_id}" >
		</span>

		<span class="inputspan"> 
		<label class="inputtext">操作者ID：</label> 
		 <input class="inputinput" name="operater_id" value="${requestScope.info.operater_id}" >
		</span>

		<span class="inputspan"> 
		<label class="inputtext">用户ID：</label> 
		 <input class="inputinput" name="user_id" value="${requestScope.info.user_id}" >
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">分数：</label> 
		 <input class="inputinput" name="point" value="${requestScope.info.point}" >
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">状态：</label> 
		 	<select name="status" style="width: 143px;height: 32px">
		 		<c:if test="${requestScope.info.status==0||requestScope.info==null }">
		 			<option value="0" selected>已测评</option>
		 			<option value="1">未测评</option>
		 		</c:if>
		 		<c:if test="${requestScope.info.status==1}">
		 			<option value="0">已测评</option>
		 			<option value="1" selected>未测评</option>
		 		</c:if>
		 		
		 		
		 	</select>
		 
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">备注：</label> 
		 <input class="inputinput" name="comments" value="${requestScope.info.comments}" >
		</span>


		</div>
		
		
		<div class="inputbtpanel " style="margin-top: 35px;">
		<button class="seachbt1" type="button"  onclick="save();">保存</button>
		</div>
	</form>


</body>
</html>
