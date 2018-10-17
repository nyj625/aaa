<%@page language="java" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../libs/css/edit.css">
    <link rel="stylesheet" href="../frame/static/css/style.css">
    <link rel="icon" href="../frame/static/image/code.png">
<link rel="stylesheet" href="../frame/layui/css/layui.css"  media="all">
<script src="../frame/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

function save(){
	var option=$(".inputselect1").val()+$(".inputselect2").val()+$(".inputselect3").val()+$(".inputselect4").val()+$(".inputselect5").val();
	if (option.lengh<5){
		alert("错误");
	}
	/* $("select[name=option]").each(function(i) { // 遍历name=test的多选框
		   // 每一个被选中项的值
		
		   if($(this).is(":checked"))
			   {
			   option=option+'1';
			   }
		   else
			   {
				option=option+'0';
			   }
		}); */
	var date=$.param({'opt':option})+'&'+$(".f1").serialize();
	$.ajax({	
	 url:$('.f1').attr("action"),
	 dataType: "json",
       type:"post",
       data:date,
	   //contentType: 'application/json;charset=utf-8',
　　　　success:function(json){
	if(json.status>1)
　　　　　　alert("成功 ! ");
		parent.location.reload();
　　　　}
});
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
<label class="inputtext">活动名称:</label>  
<select name="activity_id" class="inputselect">
<c:forEach items="${requestScope.typerow}" var="r" >
<c:if test="${requestScope.info.activity_id!=r.id}">
<option value="${r.id}">${r.name}</option>
</c:if>
<c:if test="${requestScope.info.activity_id==r.id}">
<option selected="selected" value="${r.id}">${r.name}</option>
</c:if>
</c:forEach>
		</select>
		</span>
		
		
		<span class="inputspan"> 	
			
		<label class="inputtext">执行人:</label>  
		<select name="operator_id" class="inputselect">
			<c:forEach items="${requestScope.typerow1}" var="v" >
			<c:if test="${requestScope.info.operator_id!=v.id}">
			<option value="${v.id}">${v.name}</option>
			</c:if>
			<c:if test="${requestScope.info.operator_id==v.id}">
			<option selected="selected" value="${v.id}">${v.name}</option>
			</c:if>
			
			</c:forEach>
		</select>
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">创建时间：</label>
		<input class="inputinput" name="createdate" id="test13" type="text" value="${requestScope.info.createdate}">
        </span>
		

		
		
		
		
		<span class="inputspan"> 
		<label class="inputtext">学生状况:</label> 
		<textarea name="sstatus" class="inputtextrea">${requestScope.info.sstatus}</textarea>
		 
		</span>
		
		<span class="inputspan"> 
		<label class="inputtext">课程状况:</label> 
		<textarea name="tstatus" class="inputtextrea">${requestScope.info.tstatus}</textarea>
		 
		
		</span>
		<span class="inputspan"> 
		<label class="inputtext">市场状况:</label> 
		<textarea name="cstatus" class="inputtextrea">${requestScope.info.cstatus}</textarea>
		 
		
		</span>
		<span class="inputspan"> 
		<label class="inputtext">学校状况:</label> 
	<textarea name="xstatus" class="inputtextrea">${requestScope.info.xstatus}</textarea>
		 
		
		</span>
		<span class="inputspan"> 
		<label class="inputtext">总结:</label> 
		<textarea class="inputtextrea" name="summary">${requestScope.info.summary}</textarea>
		
		</span>
			<span class="inputspan"> 
		<label class="inputtext">建议:</label> 
		<textarea name="proposal" class="inputtextrea">${requestScope.info.proposal}</textarea>
		
		</span>
           <span class="inputspan"> 
		<label class="inputtext">备注:</label> 
		<textarea name="comments"class="inputtextrea">${requestScope.info.comments}</textarea>
	
		</span>
		<span class="inputspan" > 	
	
   <label class="inputtext"  >你对这里的评价？:</label>
        
  <select name="option" class="inputselect1"  >
		<option value="0" >十分满意</option>
	    <option value="1">满意</option>
	    <option value="2">一般</option>
		<option value="3">差</option>
		</select>
	
	
   <label class="inputtext" >你对自己的评价？:</label>
        
  <select name="option" class="inputselect2" >
		<option value="0">十分满意</option>
	    <option value="1">满意</option>
	    <option value="2">一般</option>
		<option value="3">差</option>
		</select>
		
		
		  <label class="inputtext">你的学习进度？:</label>
        
  <select name="option" class="inputselect3" >
		<option value="0">完全跟的上</option>
	    <option value="1">跟得上</option>
	    <option value="2">跟不上</option>
		<option value="3">完全听不懂</option>
		</select>
		<label class="inputtext">班里活跃程度怎么样？:</label>
        
  <select name="option" class="inputselect4">
		<option value="0">十分活跃</option>
	    <option value="1">活跃</option>
	    <option value="2">一般</option>
		<option value="3">死气沉沉</option>
		</select>
		
<label class="inputtext">老师的教学状况？:</label>
        
  <select name="option" class="inputselect5">
		<option value="0">十分满意</option>
	    <option value="1">满意</option>
	    <option value="2">一般</option>
		<option value="3">差</option>
		</select>
  		</span>

		
		
		</div>
		<div class="inputbtpanel ">
        <button class="seachbt1" type="button" onclick="save();" style="margin-top: 150px;" >保存</button>	
		</div>
</form>


<script src="../frame/layui/layui.all.js"></script>
<script>
layui.use('laydate', function(){
  var laydate = layui.laydate;
  
  //执行一个laydate实例
  laydate.render({
	    elem: '#test13'
	    ,format: 'yyyyMMdd'
	  });
	  
	 
});
</script>




</body>
</html>
