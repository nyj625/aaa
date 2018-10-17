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
    <title>表格</title>
    <link rel="stylesheet" href="../frame/layui/css/layui.css">
    <!--<link rel="stylesheet" href="http://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">-->
    <link rel="stylesheet" href="../frame/static/css/style.css">
    <link rel="icon" href="../frame/static/image/code.png">
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../frame/layui/layui.js"></script>
	<script type="text/javascript" src="../js/index.js"></script>
	<script type="text/javascript" src="../frame/layui/layui.all.js"></script>

    
</head>


<script type="text/javascript" >


function del(id) {
	  
	if(confirm("确认删除？")){
		location.href="dele?id="+id;
	}
}

function fresh() {
		location.href = "index";
	}
	


</script>
<script type="text/javascript">
function up(id){
	layer.open({
		  type: 2,
		  area: ['300px', '250px'],
		  fixed: false, //不固定
		  maxmin: true,
		  content: "edit?id="+id
		});
}




function zj(){
	layer.open({
		  type: 2,
		  area: ['300px', '250px'],
		  fixed: false, //不固定
		  maxmin: true,
		  content: 'add'
		});
}



</script>

<body class="body">
<form action="index" method="post">

<input name="txt" style="height: 30px;"> <button  class="layui-btn" type="submit">查询</button>
<button  class="layui-btn" type="button" onclick="zj();">新增</button>





</form>

<!--  <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>默认表格</legend>
</fieldset>-->

<table class="layui-table">
    <colgroup>
        <col width="150">
        <col width="150">
        <col width="200">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th>id</th>
     <th>活动名称</th>
        <th>执行人</th>
        <th>创建时间</th>
       <th>设备场地</th>
        <th>学生状况</th>
        <th>课程状况</th>
        <th>市场状况</th>
       
        <th>学校状况</th>
        <th>总结</th>
        <th>建议</th>
        <th>备注</th>
        <th>功能</th>
        

    </tr>
    </thead>
    <tbody>
   
   <c:forEach items="${requestScope.list}" var="r">
   
     <tr>
        <th>${r.id}</th>
      <th>${r.t_name}</th>
        <th>${r.o_name}</th>
        <th>${r.createdate}</th>
     <th>${r.opt}</th>
        <th>${r.sstatus}</th>
        <th>${r.tstatus}</th>
        <th>${r.cstatus}</th>
        <th>${r.xstatus}</th>
        <th>${r.summary}</th>
        <th>${r.proposal}</th>
       
        <th>${r.comments}</th>
         <th><a href="javascript:up(${r.id});">修改</a>||<a href="javascript:del(${r.id});">删除</a></th>
 
    </tr>
   
   
   
   </c:forEach>

					</tbody>
   
   
</table>
 <button type="button" class="layui-btn" onclick="location.href='index?pageno=${requestScope.search.prev}'" >上一页</button>
<button type="button" class="layui-btn" onclick="location.href='index?pageno=${requestScope.search.next}'">下一页</button>
		
<!-- 
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>行边框表格</legend>
</fieldset>

<table class="layui-table" lay-skin="line">
    <colgroup>
        <col width="150">
        <col width="150">
        <col width="200">
        <col>
    </colgroup>
    <thead>
    
    <tr>
        <th>人物</th>
        <th>民族</th>
        <th>出场时间</th>
        <th>格言</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>贤心</td>
        <td>汉族</td>
        <td>1989-10-14</td>
        <td>人生似修行</td>
    </tr>
    <tr>
        <td>张爱玲</td>
        <td>汉族</td>
        <td>1920-09-30</td>
        <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
    </tr>
    <tr>
        <td>Helen Keller</td>
        <td>拉丁美裔</td>
        <td>1880-06-27</td>
        <td> Life is either a daring adventure or nothing.</td>
    </tr>
    <tr>
        <td>岳飞</td>
        <td>汉族</td>
        <td>1103-北宋崇宁二年</td>
        <td>教科书再滥改，也抹不去“民族英雄”的事实</td>
    </tr>
    <tr>
        <td>孟子</td>
        <td>华夏族（汉族）</td>
        <td>公元前-372年</td>
        <td>猿强，则国强。国强，则猿更强！</td>
    </tr>
    </tbody>
</table>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>列边框表格</legend>
</fieldset>

<table class="layui-table" lay-even="" lay-skin="row">
    <colgroup>
        <col width="150">
        <col width="150">
        <col width="200">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th>人物</th>
        <th>民族</th>
        <th>出场时间</th>
        <th>格言</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>贤心</td>
        <td>汉族</td>
        <td>1989-10-14</td>
        <td>人生似修行</td>
    </tr>
    <tr>
        <td>张爱玲</td>
        <td>汉族</td>
        <td>1920-09-30</td>
        <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
    </tr>
    <tr>
        <td>Helen Keller</td>
        <td>拉丁美裔</td>
        <td>1880-06-27</td>
        <td> Life is either a daring adventure or nothing.</td>
    </tr>
    <tr>
        <td>岳飞</td>
        <td>汉族</td>
        <td>1103-北宋崇宁二年</td>
        <td>教科书再滥改，也抹不去“民族英雄”的事实</td>
    </tr>
    <tr>
        <td>孟子</td>
        <td>华夏族（汉族）</td>
        <td>公元前-372年</td>
        <td>猿强，则国强。国强，则猿更强！</td>
    </tr>
    </tbody>
</table>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>无边框表格</legend>
</fieldset>

<table class="layui-table" lay-even="" lay-skin="nob">
    <colgroup>
        <col width="150">
        <col width="150">
        <col width="200">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th>人物</th>
        <th>民族</th>
        <th>出场时间</th>
        <th>格言</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>贤心</td>
        <td>汉族</td>
        <td>1989-10-14</td>
        <td>人生似修行</td>
    </tr>
    <tr>
        <td>张爱玲</td>
        <td>汉族</td>
        <td>1920-09-30</td>
        <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
    </tr>
    <tr>
        <td>Helen Keller</td>
        <td>拉丁美裔</td>
        <td>1880-06-27</td>
        <td> Life is either a daring adventure or nothing.</td>
    </tr>
    <tr>
        <td>岳飞</td>
        <td>汉族</td>
        <td>1103-北宋崇宁二年</td>
        <td>教科书再滥改，也抹不去“民族英雄”的事实</td>
    </tr>
    <tr>
        <td>孟子</td>
        <td>华夏族（汉族）</td>
        <td>公元前-372年</td>
        <td>猿强，则国强。国强，则猿更强！</td>
    </tr>
    </tbody>
</table> -->

<script type="text/javascript" src="../frame/layui/layui.js"></script>
<script type="text/javascript">
    // you code ...


</script>
</body>
</html>