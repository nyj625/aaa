<%@page language="java" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<link rel="stylesheet" href="../frame/layui/css/layui.css">
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

<style type="text/css">

	.inputspan{
	
		margin-left: 60px;
	
	}
	
	.inputinput{
		margin-top:20px;
		
		resize:none;
		height: 30px;
		width: 150px;
	}
	
	.input{
		margin-top:20px;
		height: 30px;
		width: 150px;
	}

</style>
</head>
<body>


		<!-- 判断进行添加还是修改 -->
		<c:if test="${requestScope.info==null}">
		<form class="f1" action="insert" method="post">
		</c:if>
		<c:if test="${requestScope.info!=null}">
		<form class="f1" action="update" method="post">
		<input type="hidden" name="id" value="${requestScope.info.id}">
		</c:if>
		
		<div class="inputview">
		
		<span class="inputspan"> 
		<label class="inputtext">活动ID：</label> 
		 <input class="input" name="activity_id" value="${requestScope.info.activity_id}">
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">用户ID：</label> 
		 <input class="input" name="user_id" value="${requestScope.info.user_id}">
		</span>
		
		<br>
		<p></p>
		<span class="inputspan"> 
		<label class="inputtext" style="margin-left: 2px;">&nbsp;状&nbsp;&nbsp;态：</label> 
		<select  class="input" na>
		 <c:if test="${requestScope.info.status==0||requestScope.info==null }">
		 			<option value="0" selected>未答</option>
		 			<option value="1">已答</option>
		 		</c:if>
		 		<c:if test="${requestScope.info.status==1}">
		 			<option value="0">未答</option>
		 			<option value="1" selected>已答</option>
		 		</c:if>
		 		</select>
		</span>
		
		

		<br>
		<p></p>
		<p>
			<hr>
		</p>
		<span class="inputspan"> 
		<label class="inputtext">问题1：&nbsp;</label> 			
		 <textarea class="inputinput" name="opt1" >${requestScope.info.opt1}</textarea>
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">问题2：&nbsp;</label> 
		 <textarea class="inputinput" name="opt2" >${requestScope.info.opt2}</textarea>
		</span>
		
		<br>
		<p></p>
		<span class="inputspan"> 
		<label class="inputtext">问题3：&nbsp;</label> 
		 <textarea class="inputinput" name="opt3" >${requestScope.info.opt3}</textarea>
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">问题4：&nbsp;</label> 
		 <textarea class="inputinput" name="opt4" >${requestScope.info.opt4}</textarea>
		</span>
		
		<br>
		<p></p>
		<span class="inputspan"> 
		<label class="inputtext">问题5：&nbsp;</label> 
		 <textarea class="inputinput" name="opt5" >${requestScope.info.opt5}</textarea>
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">问题6：&nbsp;</label> 
		 <textarea class="inputinput" name="opt6" >${requestScope.info.opt6}</textarea>
		</span>
		
		<br>
		<p></p>
		<span class="inputspan"> 
		<label class="inputtext">问题7：&nbsp;</label> 
		 <textarea class="inputinput" name="opt7" >${requestScope.info.opt7}</textarea>
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">问题8：&nbsp;</label> 
		 <textarea class="inputinput" name="opt8" >${requestScope.info.opt8}</textarea>
		</span>
		
		<br>
		<p></p>
		<span class="inputspan"> 
		<label class="inputtext">问题9：&nbsp;</label> 
		 <textarea class="inputinput" name="opt9" >${requestScope.info.opt9}</textarea>
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">问题10：</label> 
		 <textarea class="inputinput" name="opt10" >${requestScope.info.opt10}</textarea>
		</span>
		
		<br>
		<p></p>
		<span class="inputspan"> 
		<label class="inputtext">回&nbsp;&nbsp;&nbsp;应：</label> 
		 <textarea class="inputinput" name="result" >${requestScope.info.result}</textarea>
		</span>
		
		</div>
		
		
		<div class="inputbtpanel" style="margin-top: 30px;margin-left: 280px;">
		<button class=" layui-btn" type="button"  onclick="save();" style="margin-bottom: 50px;">保存</button>
		</div>
	</form>


</body>
</html>
