<%@page language="java" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../libs/css/edit.css">
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

function save() {
	$.post($(".f1").attr("action"),$(".f1").serialize(),function(json){
		if(json.status>0){
			parent.fresh();
			var index=parent.layer.getFrameIndex(window.name );
			parent.layer.close(index);
		}else{
			alert(json.text);
		}
		
		
	},"json");
}




</script>



</head>
<body>



	
	<c:if test="${requestScope.info==null }">
    <form class="f1" action="insert" method="post">
	</c:if>
	<c:if test="${requestScope.info!=null }">
	<form class="f1" action="update" method="post">
	<input type="hidden" name="id" value="${requestScope.info.id }">
	</c:if>
	
<div class="inputview">
		<span class="inputspan"> 
		<label class="inputtext">姓名:</label> 
		 <input class="inputinput" name="name" value="${requestScope.info.name}">
		</span>
		
		
		
			
		<span class="inputspan"> 	
			
		<label class="inputtext">学校:</label>  
		<select name="school_id" class="inputselect">
			<c:forEach items="${requestScope.typerow}" var="r" >
			<c:if test="${requestScope.info.school_id!=r.id}">
			<option value="${r.id}">${r.name}</option>
			</c:if>
			<c:if test="${requestScope.info.school_id==r.id}">
			<option selected="selected" value="${r.id}">${r.name}</option>
			</c:if>
			
			</c:forEach>
		</select>
		</span>
		
		</div>
		<div class="inputbtpanel ">
        <button class="seachbt1" type="button" onclick="save();" >保存</button>	
		</div>
</form>


</body>
</html>
