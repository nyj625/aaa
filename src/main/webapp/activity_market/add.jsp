<%@ page language="java" contentType="text/html; charset=utf-8"
isELIgnored="false"  pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>添加-修改</title>
    <link rel="stylesheet" href="../frame/layui/css/layui.css">
    <link rel="stylesheet" href="../frame/static/css/style.css">
    <link rel="icon" href="../frame/static/image/code.png">
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
    <script src="../frame/layui/layui.js" charset="utf-8"></script>
</head>
<body class="body">

<form class="f1 layui-form layui-form-pane" method="post" action="insert">


       
      <div class="layui-form-item">
      <label class="layui-form-label">学生信息</label>
      
      <a class="layui-btn layui-btn-normal layui-btn-small" title="添加" style="margin-left: 40px;margin-top: 4px;" href="javaScript:;" onclick="add('addstudent')"><i class="layui-icon">&#xe61f;</i></a>
     
      </div>
       
    <div class="layui-form-item" >
    <table  class="layui-table" id="demo"></table>
    <script type="text/javascript">
    layui.use('table', function(){
    	var table = layui.table;
        
  	  //转换静态表格
	  	  table.render({
	  		  elem: '#demo',
	  		  data:JSON.parse(sessionStorage.getItem('student')),
	  			cols: [[
		        {field:'name', title: '姓名',width:219}
		        ,{field:'level', title: '受关注度',width:219} //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
		        ,{field:'studentinfo', title: '学生信息',width:219}
	      		]]
	  	});
    })
    
    
      
    </script>
    </div>
    
    <div class="layui-form-item" >
        <label class="layui-form-label">活动</label>
        <div class="layui-input-block" style="width:140px;">
          <select name="activity_id" >
        <c:forEach items="${requestScope.activity}" var="r">     
         <option value="${r.id}">${r.name}</option>              
        </c:forEach>
           </select>  
        </div>
    </div>
   
     <div class="layui-form-item">
			<div class="layui-form-item layui-form-text">
        <label class="layui-form-label">事件</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" name="info" ></textarea>
        </div>
    </div>
    </div>

  <div class="layui-form-item">
			<div class="layui-form-item layui-form-text">
        <label class="layui-form-label">日总结</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" name="comments" ></textarea>
        </div>
    </div>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn"  onclick="save()" type="button">提交</button>
    </div>
</form>


<script type="text/javascript">
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
        });
        
            return false;


    });
  
    
    function add(url){
    	layer.open({
    		  type: 2,
    		  area: ['650px', '300px'],		  
    		  maxmin: true,
    		  content:url,
    		fixed:false
    		});
    }
    
    function save(){
    	var all='';
    	var json0=$(".f1").serialize();  
    	//alert(sessionStorage.getItem('student'));
    	var jsonObj=sessionStorage.getItem('student');
    	var json3=JSON.parse(sessionStorage.getItem('student'));
    	//alert(json3.toString());
    	//var json2=JSON.stringify(json3);
    	//alert(json2);
    
    	all=json0+'&'+$.param({'studentjson':jsonObj});
    	alert(all);
    	$.ajax({　　　　　　　　	
    	 url:$('.f1').attr("action"),
    	 dataType: "json",
    　　　        type:"post",
    　　　　data:all,
    	   //contentType: 'application/json;charset=utf-8',
    　　　　success:function(json){
    	if(json.status>1)
    　　　　　　alert("成功 ! ");
    	sessionStorage.clear();
    		parent.location.reload();
    　　　　}
    });
    }

</script>
</body>
</html>