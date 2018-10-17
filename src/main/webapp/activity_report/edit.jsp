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
		<label class="inputtext">讲师ID：</label> 
		 <input class="inputinput" name="operator_id" value="${requestScope.info.operator_id}" >
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">日期：</label> 
		 <input class="inputinput" name="date" value="${requestScope.info.date}" >
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">教学进度：</label> 
		 <input class="inputinput" name="tprogress" value="${requestScope.info.tprogress}" >
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">学生状况：</label> 
		 <input class="inputinput" name="sprogress" value="${requestScope.info.sprogress}" >
		</span>

		<span class="inputspan"> 
		<label class="inputtext">市场情况：</label> 
		 <input class="inputinput" name="cprogress" value="${requestScope.info.cprogress}" >
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">学生信息：</label> 
		 <input class="inputinput" name="studentinfo" value="${requestScope.info.studentinfo}" >
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">日总结：</label> 
		 <input class="inputinput" name="comments" value="${requestScope.info.comments}" >
		</span>
		</div>
		<div class="inputbtpanel " style="margin-top: 100px;">
		<button class="seachbt1" type="button"  onclick="save();">保存</button>
		</div>
	</form>


</body>
</html>
