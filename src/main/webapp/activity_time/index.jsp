<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../frame/layui/css/layui.css">
    <link rel="stylesheet" href="../frame/static/css/style.css">
    <link rel="icon" href="../frame/static/image/code.png">
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../frame/layui/layui.all.js"></script>
	<script>
		function checkwork(url,width,height)
		{
			layer.open({
				  type: 2,
				  area: [width, height],		  
				  maxmin: true,
				  content:url,
				fixed:false
				});
		}
	</script>
</head>

<body class="body">
<div class="layui-form-item">
        <label class="layui-form-label">活动</label>
        <div class="layui-input-block">
           <input type="text"  autocomplete="off" class="layui-input" value="${requestScope.activity.name }" disabled="disabled">
        </div>
</div>
<c:if test="${requestScope.schedule!=null}">
	<table class="layui-table">
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead>
    <tr>
      <th>日期</th>
      <th>时间信息</th>
      <th>讲师</th>
      <th>教室</th>
      <th>考勤</th>
    </tr> 
  </thead>
  <tbody>
  	<c:forEach items="${requestScope.schedule}" var="r">
  		<tr>
		      <td>${r.date }</td>
		      <td>
		      		${r.time1} ~ ${r.time2 }
		      		${r.time3} ~ ${r.time4 } 
		      		${r.time5} ~ ${r.time6 }  
		      </td>
		      <td>${r.operator_id }</td>
		      <td>${r.roominfo }</td>
		      <td>
		      	<a href="javascript:;" onclick="checkwork('../activity_checkwork/index?time_id=${r.id}','1000px','600px')">考勤</a>
		      	<a href="javascript:;" onclick="checkwork('../Report/edit?time_id=${r.id}','1000px','600px')">日评</a>
		      </td>
    	</tr>
  	</c:forEach>
  </tbody>
</table>
</c:if>
<c:if test="${requestScope.schedule==null}">
<div style="margin:0 37%;width:200px;height:400px;">
	<i class="layui-icon" style="font-size: 130px;color:#00FF7F">&#xe60c;</i>
	<br/>
	<span style="margin:10px -20px;font-size:25px">还未安排时间哦</span>
	<br/>
	<div style="widht:100px;height:30px;margin:100px 10px;">
		<a href="add?activity_id=${requestScope.activity.id}"><i class="layui-icon" style="font-size: 20px;">&#xe608;</i><span style="font-size:20px">一键安排</span></a>
	</div>
</div>
</c:if>
<script>
	function swit(o)
	{
		if($(o).next().is(".layui-show"))
			{
				$(o).next().removeClass("layui-show");
			}
		else
			{
				$(o).next().addClass("layui-show");
			}
	}
</script>
</body>
</html>