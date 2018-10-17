<%@ page language="java" contentType="text/html; charset=utf-8"
isELIgnored="false"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>管理人员</title>
    <link rel="stylesheet" href="../frame/layui/css/layui.css">
    <!--<link rel="stylesheet" href="http://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">-->
    <link rel="stylesheet" href="../frame/static/css/style.css">
    <link rel="icon" href="../frame/static/image/code.png">
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../frame/layui/layui.js"></script>
	<script type="text/javascript" src="../js/index.js"></script>
	<script type="text/javascript" src="../frame//layui/layui.all.js"></script>
	<style>
		.layui-form-label{
			margin:0 auto;
		}
		input[type=text]{
			width:200px;
			display:inline-block;
		}
		button[class=layui-btn]{
			display:inline-block;
		}
		.layui-input-block{
			display:inline-block;
			margin-left:25px;
		}
		.searchType{
			display:inline-block;
		}
		.layui-table{
			width:97%;
			text-align:center;
			margin:0 auto;
			height:90%;
		}
		.activityType
		{
			display:inline-block;
		}
	</style>
</head>
<body class="body">
<script type="text/javascript">


function add(url,width,height){
	layer.open({
		  type: 2,
		  area: [width, height],		  
		  maxmin: true,
		  content:url
		});
}
function cancel(o,id){
	$.post("cancel",{id:id},function(msg){
		if(msg=='success'){
			$(o).parent().prev().html('取消');
			$(o).removeClass('layui-btn-danger').attr('onclick','restart(this,'+id+')').html('按计划');
		}
	},'text');

	
}
function restart(o,id){
	$.post("restart",{id:id},function(msg){
		if(msg=='success'){
			$(o).parent().prev().html('按计划');
			$(o).addClass('layui-btn-danger').attr('onclick','cancel(this,'+id+')').html('取消');
		}
	},'text');
}
function change()
{
	alert("changed already");
}
</script>
<form class="layui-form" action="">
<div class="layui-form-item">
        <label class="layui-form-label">搜索</label>
        <div class="layui-input-block dates">
           <input type="text" name="date" value="" id="date1" autocomplete="off" class="layui-input" >
        </div>
        <div class="searchType">
        	<select  class="inputselect" name="select" lay-filter="searchType">
				<option value="type">活动类型</option>
				<option value="planinfo">计划安排信息</option>
				<option value="courseinfo">课程信息</option>
			</select>
        </div>
        <div class="activityType layui-hide">
			<select class='selecttype '  name="txt" lay-filter="activityType" >
		        <option value="0">实训</option>
		        <option value="1">宣讲</option>
		        <option value="2">比赛</option>
		        <option value="3">假期团建</option>
		    </select>
        </div>
        <input type='text' name='txt' lay-verify='title' autocomplete='off' placeholder='搜索' class='layui-input inputtxt layui-hide'>
        <!-- <input type="text" name="txt" lay-verify="title" autocomplete="off" placeholder="搜索" class="layui-input"> -->
        <div class="layui-input-block" style="width:165px;margin:0 0px">
            <button class="layui-btn" lay-submit="" lay-filter="submit" type="button">搜索</button>
            <button class="layui-btn"  type="button" lay-submit="" lay-filter="add" onclick="add('add','1030px','400px')">添加</button>
        </div>
</div>
</form>
<!-- 表格 -->
<div id="dateTable">
<table class="layui-table">
<thead>
<tr style="height: 20px;">
<td>活动名称</td>
<td>活动类型</td>
<td>参加人数</td>
<td>班级数量</td>
<td>设备</td>
<td>注意事项</td>
<td>人员详情</td>
<td>特别信息</td>
<td>状态</td>
<td>操作</td>
</tr>
</thead>
<tbody>

<c:forEach items="${requestScope.list}" var="r">
<tr>
<td>${r.name}</td>
<td>
	<c:if test="${r.type==0}">实训</c:if>
	<c:if test="${r.type==1}">宣讲</c:if>
	<c:if test="${r.type==2}">比赛</c:if>
	<c:if test="${r.type==3}">假期团建</c:if>
</td>
<td>${r.count}</td>
<td>${r.classcount}</td>
<td>
	<c:if test="${fn:substring(r.options,0,1)==1 }">音响</c:if>
	<c:if test="${fn:substring(r.options,1,2)==1 }">话筒</c:if>
	<c:if test="${fn:substring(r.options,2,3)==1 }">投影</c:if>
	<c:if test="${fn:substring(r.options,3,4)==1 }">话筒</c:if>
	<c:if test="${fn:substring(r.options,4,5)==1 }">场地：酒店</c:if>
	<c:if test="${fn:substring(r.options,5,6)==1 }">场地：学校</c:if>
	<c:if test="${fn:substring(r.options,6,7)==1 }">场地：室外</c:if>
</td>
<td>${r.attention}</td>
<td>	
	<c:forEach items="${requestScope.oper}" var="op">
	<c:if test="${op.id==r.source_operator_id}">来源人:${op.name}</c:if>
	<c:if test="${op.id==r.instructor_user_id}">辅导员:${op.name}</c:if>
	<c:if test="${op.id==r.charge_operator_id}">负责人:${op.name}</c:if>
	</c:forEach>
</td>
<td>时间信息：${r.dateinfo }<br/>
	计划信息${r.planinfo}<br/>
	课程信息：${r.courseinfo}
</td>
<td>
	<c:if test="${r.status==0}">按计划</c:if>
	<c:if test="${r.status==1}">取消</c:if>
</td>

<td>

    <a class="layui-btn layui-btn-mini layui-btn-normal" href="javascript:;" onclick="add('edit?id=${r.id}','1030px','400px')">编辑</a>
    <c:if test="${r.status==0}">
    	<a class="layui-btn layui-btn-mini layui-btn-danger" href="javascript:;" onclick="cancel(this,${r.id})">取消</a>
    </c:if>
    <c:if test="${r.status==1}">
    	<a class="layui-btn layui-btn-mini" href="javascript:;" onclick="restart(this,${r.id})">还原</a>
    </c:if>
    <a class="layui-btn layui-btn-mini layui-btn-warm" href="javascript:;" onclick="add('../activity_time/index?txt=${r.id}','1050px','400px')">时间安排</a>
    <a class="layui-btn layui-btn-mini layui-btn-warm" href="javascript:;" onclick="add('memberSelected?activity_id=${r.id}','1050px','400px')">人员安排</a>
    <a class="layui-btn layui-btn-mini layui-btn-warm" href="javascript:;" onclick="add('../activity_usergroup/index?activity_id=${r.id}','1050px','400px')">分组</a>
    <a class="layui-btn layui-btn-mini layui-btn-warm" href="javascript:;" onclick="add('../activity_summary/add','1250px','400px')">总结</a>
    <a class="layui-btn layui-btn-mini layui-btn-warm" href="javascript:;" onclick="add('../Evaluation/index','1250px','400px')">测评</a>
</td>
</tr>
</c:forEach>

</tbody>
</table>
<div class="page " style="margin-left: 510px;">
			<div class="layui-main">
			<button type="button" class="layui-laypage-btn" onclick="location.href='index?pageno=${requestScope.prev}'" >上一页</button>
			<button type="button" class="layui-laypage-btn" onclick="location.href='index?pageno=${requestScope.next}'">下一页</button>
			</div>
		</div>
</div>
<script>
layui.use(['form', 'layedit', 'laydate', 'element'], function () {
    var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate
            , element = layui.element;    
    laydate.render({
        elem: '#date'
    });
    laydate.render({
        elem: '#date1'
        	,done: function(value, date, endDate){
        		location.href="index?createdate="+value;
        	    console.log(value); //得到日期生成的值，如：2017-08-18
        	    $(".searchType").remove();
        	    $(".activityType").remove();
        	  }
    });
   	form.on('submit(submit)',function(data){
   		var searchType=$('[name=select]').val();
   		var txt=$('[name=txt]').val();
   		location.href="index?searchType="+searchType+"&txt="+txt;
   	})
    
    
    
    form.render();   

});
</script>


</body>
</html>