<%@page language="java" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../frame/edit.css">
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

function  save() {
	$.post($(".f1").attr("action"),$(".f1").serialize(),function(json){
		if(json.status>0){
			var index=parent.layer.getFrameIndex(window.name);
			parent.location.reload();
			parent.layer.close(index);
		}else{
			alert(json.text);
		}
	},"json");
}

	function closewin() {
		
		var index=parent.layer.getFrameIndex(window.name);//获取窗口索引
		     parent.layer.close(index);  

	}


</script>
<style type="text/css">

	.inputspan{
	height: 100px;
	margin-top: 30px;
	margin-left: 80px;
	}
	
	.inputtext{
	width: 430px;
	
	
	}
	
	.inputinput{
	resize:none;
	height: 80px;
	width: 450px;
	}


</style>
</head>
<body>


		
	<!-- 问题|答案 -->
		
		<form class="f1" action="updateo" method="post">
		<input type="hidden" name="id" value="${requestScope.info.id}">
		<div class="inputview">
			
		<span class="inputspan" style="margin-top: 10px;"> 
		<label class="inputtext">问题1：${requestScope.info.opt1}</label>
		<br> 
		<p></p>
		 <textarea class="inputinput" name="text1" >${requestScope.info.text1}</textarea>
		</span>
		
		<br> 
		<span class="inputspan"> 
		<label class="inputtext">问题2：${requestScope.info.opt2}</label> 
		<br> 
		<p></p>
		 <textarea class="inputinput" name="text2">${requestScope.info.text2}</textarea>
		</span>
		
		<br> 
		<span class="inputspan"> 
		<label class="inputtext">问题3：${requestScope.info.opt3}</label> 
		<br> 
		<p></p>
		 <textarea class="inputinput" name="text3">${requestScope.info.text3}</textarea>
		</span>

		<br> 
		<span class="inputspan"> 
		<label class="inputtext">问题4：${requestScope.info.opt4}</label> 
		<br>
		<p></p> 
		 <textarea class="inputinput" name="text4">${requestScope.info.text4}</textarea>
		</span>
		
		<br> 
		<span class="inputspan"> 
		<label class="inputtext">问题5：${requestScope.info.opt5}</label> 
		<br>
		<p></p> 
		 <textarea class="inputinput" name="text5">${requestScope.info.text5}</textarea>
		</span>
		
		<br> 
		<span class="inputspan"> 
		<label class="inputtext">问题6：${requestScope.info.opt6}</label> 
		<br> 
		<p></p>
		 <textarea class="inputinput" name="text6">${requestScope.info.text6}</textarea>
		</span>
		
		<br> 
		<span class="inputspan"> 
		<label class="inputtext">问题7：${requestScope.info.opt7}</label> 
		<br>
		<p></p> 
		 <textarea class="inputinput" name="text7">${requestScope.info.text7}</textarea>
		</span>
		
		<br> 
		<span class="inputspan"> 
		<label class="inputtext">问题8：${requestScope.info.opt8}</label> 
		<br> 
		<p></p>
		 <textarea class="inputinput" name="text8" >${requestScope.info.text8}</textarea>
		</span>
		
		<br> 
		<span class="inputspan"> 
		<label class="inputtext">问题9：${requestScope.info.opt9}</label>
		<br> 
		<p></p>
		 <textarea class="inputinput" name="text9">${requestScope.info.text9}</textarea>
		</span>
		
		<br> 
		<span class="inputspan"> 
		<label class="inputtext">问题10：${requestScope.info.opt10}</label> 
		<br>
		<p></p> 
		 <textarea class="inputinput" name="text10">${requestScope.info.text10}</textarea>
		</span>
		
		</div>
		
		
		<div class="inputbtpanel " style="margin-top: 40px;margin-bottom: 40px;">
		<button class="seachbt1" type="button"  onclick="closewin();">取消</button>
		<button class="seachbt1" type="button"  onclick="save();">保存</button>
		</div>
	</form>


</body>
</html>
