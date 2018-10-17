<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>学生信息</title>
<link rel="stylesheet" href="../frame/layui/css/layui.css">
<link rel="stylesheet" href="../frame/static/css/style.css">
<link rel="icon" href="../frame/static/image/code.png">
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
<script src="../frame/layui/layui.js" charset="utf-8"></script>

</head>
<body class="body">

<script type="text/javascript">

			$(function(){
				var options=$(".select option:selected");
				options.val();
				options.text();	
			});
		


</script>
	<form class="f1 layui-form layui-form-pane" method="post">

<div class="layui-input-inline" style="width: 600px;">

		<div class="layui-form-item">
		<div class="layui-input-inline " style="margin-left: 38px;">
				<label class="layui-form-label">姓名</label>				
				<div class="layui-input-block " style="width: 100px;">
					<input type="text" name="name" class="layui-input inputs" value="">
				</div>
			</div>
			<div class="layui-input-inline " style="margin-left: 38px;">
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-block " style="width: 140px;">
					<select name="id" class="myselect" lay-filter="test"  id="select1"  >
					<option value=-1>请选择</option>
					<c:forEach items="${requestScope.username}" var="r">
					<option value='${r.id}'>${r.name}</option>
					
					</c:forEach>
						
					</select>
				</div>
				
			</div>
			
		</div>
			<div class="layui-form-item" style="margin-left: 100px;">
			
		</div>
</div>

		<div class="layui-form-item">
			<div class="layui-input-inline" style="margin-left: 38px;">
				<label class="layui-form-label">受关注度</label>
				<div class="layui-input-block" style="width: 140px;">
					<select name="level">
						<option value="0">不用后续关注</option>
						<option value="1">需跟进</option>
						<option value="2">有希望</option>
						<option value="3">可报名</option>
					</select>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-inline" style="margin-left: 38px;">
				<label class="layui-form-label">备注信息</label>
			</div>
			<div class="layui-input-block" style="margin-left: 38px;">
				<textarea class="layui-textarea" name="studentinfo"></textarea>
			</div>
		</div>


		<div class="layui-form-item">
			<button class="layui-btn" lay-submit lay-filter="addInfo" 
				type="button" style="margin-left: 160px;">提交</button>
		</div>
	</form>


	<script type="text/javascript">
		
		layui.use([ 'form' ], function() {
			var form = layui.form

			form.on('select(test)', function(data){
				  //console.log(data.elem); //得到select原始DOM对象
				//  console.log(data.value); //得到被选中的值
				  //console.log(data.othis); //得到美化后的DOM对象
				 // var  myselect=document.getElementById("select1");
				  //var index=myselect.selectedIndex ; 
				 // console.log(data.othis.html());
				//  var a=data.othis.html();
				//  alert(a);
				
				var name=  data.othis.find("[lay-value="+data.value+"]").text();
				var value=data.value;
				$(".inputs").val(name);
				
				}); 
			
			//监听提交
			form.on('submit(addInfo)', function(data) {
				//alert(data.filed);
				//JSON.stringify(data.field)
				//data.othis.find(".myselect").prop("disabled":"disabled");
				var student = JSON.parse(sessionStorage.getItem('student'));
				
				var students = [];
				//console.log(students);
				students.push(data.field);//初始null
				if(student!=null)students = students.concat(student);//合并数组
				//console.log(JSON.stringify(students));
				sessionStorage.setItem('student',JSON.stringify(students));
				alert(sessionStorage.getItem('student'));
				var index=parent.layer.getFrameIndex(window.name);//获取窗口索引
				parent.layer.close(index); 
				parent.location.reload(); 
				return false;
			});
			

		});
		
		
	</script>
</body>
</html>