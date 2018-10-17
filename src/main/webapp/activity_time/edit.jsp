<%@page language="java" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../frame/edit.css">
<link rel="stylesheet" href="../frame/layui/css/layui.css">
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function create(){
	var added='<tr>'+
	      '<td>'+$("[name=date]").val()+'</td>'+
	      '<td>'+$("[name=roominfo]").val()+'</td>'+
	      '<td>'+$("[name=morning]").val()+'<br/>'+
		   $("[name=afternoon]").val()+'<br/>'+
	       $("[name=night]").val()+'</td>'+
	     ' <td>'+$("[name=comments]").val()+'</td>'
	   ' </tr>';
	 $("tbody").append($(added));
}
function save() {
	var jsonSendBack='';
	var activity_id=<%=request.getAttribute("activity_id")%>;
	$("tr").each(function(index,element){
		if(index>0)
		{
			var time=$(this).children(":first").next().next().html();
			var times=time.split("<br>");
			
			jsonSendBack=jsonSendBack+'{"date":"'+$(this).children(":first").html()+'",'+
				'"roominfo":"'+$(this).children(":first").next().html()+'",'+
				'"times":"'+times+'",'+
				'"comments":"'+$(this).children(":first").next().next().next().html()+'"},'
		}
	})
	jsonSendBack='['+jsonSendBack.substring(0,jsonSendBack.length-1)+']';
	$.post("insert",{jsonSendBack:jsonSendBack,activity_id:activity_id},function(msg){
		var index=parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
	},"text");
}
</script>
<style>
	.layui-input{
		width:100px;
	}
</style>
</head>
<body>
	<input type="hidden" name="activity_id" value="${requestScope.id}">
	<div class="up">
		<div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label" style="display:inline-block">举行地点</label>
		      <div class="layui-input-inline" style="width:100px;">
		        <input type="text" class="layui-input" name="roominfo">
		      </div>
		    </div>
		    <div class="layui-inline">
		      <label class="layui-form-label">上午</label>
		      <div class="layui-input-inline" style="width:100px;">
		        <input type="text" class="layui-input" id="test2" placeholder=" - " name="morning">
		      </div>
		    </div>
		</div>
		<div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label">日期</label>
		      <div class="layui-input-inline" style="width:100px;">
		        <input type="text" class="layui-input" id="test1" placeholder="yyyy-MM-dd" name="date">
		      </div>
		    </div>
		    <div class="layui-inline">
		      <label class="layui-form-label">下午</label>
		      <div class="layui-input-inline" style="width:100px;">
		        <input type="text" class="layui-input" id="test3" placeholder=" - " name="afternoon">
		      </div>
		    </div>
		</div>
		<div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label">备注</label>
		      <div class="layui-input-inline" style="width:100px;">
		        <input type="text" class="layui-input" name="comments">
		      </div>
		    </div>
		    <div class="layui-inline">
		      <label class="layui-form-label">晚上</label>
		      <div class="layui-input-inline" style="width:100px;">
		        <input type="text" class="layui-input" id="test4" placeholder=" - " name="night">
		      </div>
		    </div>
		</div>
		<button type="button" class="layui-btn" onclick="create()" style="margin:0px 125px;width:75px;display:inline-block">增加</button>
		<button type="button" class="layui-btn" onclick="save()" style="width:75px;display:inline-block">保存</button>
	</div>
	<div class="down">
		<table class="layui-table">
		  <colgroup>
		    <col width="120">
		    <col width="120">
		    <col width="120">
		    <col width="80">
		  </colgroup>
		  <thead>
		    <tr>
		      <th style="width:100px">日期</th>
		      <th>地点</th>
		      <th>时间</th>
		      <th>备注</th>
		    </tr> 
		  </thead>
		  <tbody>
		  </tbody>
		</table>
	</div>
<script src="../frame/layui/layui.all.js"></script>
<script>
layui.use('laydate', function(){
  var laydate = layui.laydate;
  
  //执行一个laydate实例
  laydate.render({
	    elem: '#test1'
	    ,format: 'yyyy-MM-dd'
	  });
	  
	  laydate.render({
	    elem: '#test14'
	    ,type: 'time'
	    ,format: 'H点m分'
	  });
	  
	  laydate.render({
		    elem: '#test2'
		    ,type: 'time'
		    ,range: true
		    ,format:'HH:mm'
		    
		  });
	  laydate.render({
		    elem: '#test3'
		    ,type: 'time'
		    ,range: true
		    ,format:'HH:mm'
		    
		  });
	  laydate.render({
		    elem: '#test4'
		    ,type: 'time'
		    ,range: true
		    ,format:'HH:mm'
		    
		  });
});
</script>




</body>
</html>
