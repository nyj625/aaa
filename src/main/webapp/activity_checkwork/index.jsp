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
	<script type="text/javascript" src="../layui/layui.js"></script>
	<script type="text/javascript" src="../js/index.js"></script>
	<script type="text/javascript" src="../layui/layui.all.js"></script>	
	<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.cookie.js"></script>
	<script>
	var id=[];
	function kaoqin(){
		$("[type=checkbox]").each(function(){
			if($(this).attr("checked")){
				id.push($(this).val());
				
			}
		});
		var ids1=id.slice(1);
		layer.open({
			  type: 2,
			  area: ['700px', '400px'],		  
			  maxmin: true,
			  content:'kaoqin?ids1='+ids1,
			fixed:false
			});
		
	}
	function selectAll(obj){
		//alert(2);
		if($(obj).is(':checked'))
			{
				$("[type=checkbox]").attr("checked","checked");
			
			}
		if(!$(obj).is(':checked')){
			$("[type=checkbox]").removeAttr("checked");
		}
		
    }   
	
	</script>
</head>
<body class="body">
<script type="text/javascript">
$(function(){
	var form=layui.form;
	$(".inputselect").find("[value="+$.cookie('the_cookie2')+"]").prop("selected",true);
	if($.cookie('the_cookie2')=='activity_id'){
		
		$(".active").find("[value="+$.cookie('the_cookie1')+"]").prop("selected","selected");		
		form.render();
	}
	else{
	
		console.log($.cookie('the_cookie1'));
		$(".opera").find("[value="+$.cookie('the_cookie1')+"]").prop("selected","selected");		
		form.render();
	}
	form.render();
});

function add(url){
	//alert(url);
	layer.open({
		  type: 2,
		  area: ['700px', '400px'],		  
		  maxmin: true,
		  content:url,
		fixed:false
		});
}



</script>


 
<div class="my-btn-box">
    <span class="fl">       
        <a class="layui-btn btn-add btn-default" id="btn-add" href="javascript:;" onclick="add('change');">添加</a>      
    </span>
    <span class="fl" style="margin-left: 10px;">       
        <a class="layui-btn btn-add btn-default" id="btn-add" href="javascript:;" onclick="kaoqin();">全部考勤</a>      
    </span>
  
    	<form class="layui-form" action="index" method="post">
    	 <span class="fr">
    	
    		<label class="layui-form-label">搜索条件：</label>
    	
        		<div class="layui-input-inline sinput" style="width: 120px;">
					<select  class="inputselect" name="select" lay-filter="inputselect">
						<option value="">-</option>					
						<option value="operator_name">最后修改人</option>
						<option value="activity_id">活动名称</option>
					</select>
				</div>

				<div class="layui-input-inline select1">
					<div class="layui-form-select layui-select-title"
						style="width: 115px;">
						<select name="activity_id" class="active" lay-filter="activeselect">
							<option value="">-</option>
							<c:forEach items="${requestScope.acti_list}" var="r">
								<option value="${r.id}">${r.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>

				<div class="layui-input-inline select2" >
					<div class="layui-form-select layui-select-title"
						style="width: 115px;">
						<select name="operator_id" class="opera">
							<option value="">-</option>
							<c:forEach items="${requestScope.op_list}" var="r">
								<option value="${r.id}">${r.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>

				<button class="layui-btn mgl-20" type="submit">查询</button>
    	  </span>
    	</form>
  
</div>

<!-- 表格 -->
<div id="dateTable">
<table class="layui-table" layui-fileter="test">
<thead>
<tr>
<td>
<input type="checkbox" name="" lay-skin="primary" onclick="selectAll(this)">
</td>
<td>日期</td>
<td>活动</td>
<td>参与人名称</td>
<td><a href="upmor" >早打卡</a></td>
<td><a href="uplun">午打卡</a></td>
<td><a href="upnig">晚打卡</a></td>
<td>记录人员</td>
<td>最后记录时间</td>
<td>备注</td>
<td>操作</td>
</tr>
</thead>
<tbody style="height: 200px;">

<c:forEach items="${requestScope.list}" var="r">
<tr>
<td>
<input type="checkbox" name="id" value="${r.id}">
</td>
<td>${r.date}</td>
<td>${r.activity_name}</td>
<td>${r.user_name}</td>
<td>${r.check1list}</td>
<td>${r.check2list}</td>
<td>${r.check3list}</td>
<td>${r.operator_name}</td>
<td>${r.lastdate}</td>
<td>${r.comments}</td>

<td>

    <a class="layui-btn layui-btn-mini layui-btn-normal" href="javascript:;" onclick="add('edit?id=${r.id}')">编辑</a>
    
</td>
</tr>
</c:forEach>

</tbody>
</table>
</div>
<script type="text/javascript">
layui.use(['form', 'layedit', 'laydate', 'element','table'], function () {
    var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate
            , element = layui.element
            ,table=layui.table;
   
    form.on('select(inputselect)', function(data){  	
  	 $(".select1").addClass("layui-hide");
  	 $(".select2").addClass("layui-hide");   
  	 var a='activity_id';
  	 if(data.value==a){
  		 $(".select1").removeClass("layui-hide");
  		 $(".select2").find(".opera").prop("disabled","disabled");
  		// alert(".active").val();
  		//var options=$(".active option:selected");
  		form.on('select(activeselect)',function(data){
  			$.cookie('the_cookie1',data.value);
  			//data.othis.find("[lay-value="+data.value+"]").prop("selected",true)
  			//alert(data.othis.find("[lay-value="+data.value+"]").attr());
  			$.cookie('the_cookie2',a);
  			console.log($.cookie('the_cookie2'));
  		})
  	 }
  	 var b='operator_name';
  	 if(data.value==b){
  		 $(".select2").removeClass("layui-hide");
  		 $(".select1").find(".active").prop("disabled","disabled");
  	 }
  	 
  	}); 
    
     

 
      form.render();       
    laydate.render({
        elem: '#date'
    });
    laydate.render({
        elem: '#date1'
    });   
        return false;
      
});
</script>


</body>
</html>