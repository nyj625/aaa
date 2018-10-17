<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="../frame/layui/css/layui.css">
	<link rel="stylesheet" href="../frame/static/css/style.css">
	<link rel="icon" href="../frame/static/image/code.png">
	<script src="../frame/layui/layui.all.js"></script>
	<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.cookie.js"></script>
	<style>
		.layui-form-label{
			margin:0 auto;
		}
		
	
		.layui-table{
			width:90%;
			text-align:center;
			margin:0 auto;
		}
		 .layui-input-block{
              display:inline-block;
          }
		.layui-input-inline{
		width:140px;
		}
	</style>

</head>
<body>
<script type="text/javascript">
$(function(){
	var form = layui.form;

$(".searchon").find("[value="+$.cookie('the_cookie2')+"]").prop("selected",true);
if($.cookie('the_cookie2')=='school'){
	$(".school").find("[value="+$.cookie('the_cookie1')+"]").prop("selected",true);
}
if($.cookie('the_cookie2')=='college'){
	$(".college").find("[value="+$.cookie('the_cookie1')+"]").prop("selected",true);
}
if($.cookie('the_cookie2')=='people'){
	$(".people").find("[value="+$.cookie('the_cookie1')+"]").prop("selected",true);
	$(".sinput").val($.cookie('the_cookie3'));
}
	   form.render(); 
})
</script>
<form class="layui-form" action="">
<div class="layui-form-item">
        <label class="layui-form-label">查询方式</label>
        <div class=" layui-input-inline searchway" style="width: 110px;">
        <select lay-filter="searchon" class="searchon" name="way">
        <option value="">请选择</option>
        <option  value="school">学校查询</option>
        <option value="college">学院查询</option>
        <option  value="people">用户查询</option>
        </select>
       
        </div>
         <div class=" layui-input-inline searchType1" style="width: 110px;">
        	<select name="searchType" lay-filter="school" class="school">
        	<option selected value="">请选择</option>
        	<c:forEach items="${requestScope.school}" var="r">
        	<option value="${r.id}">${r.name}</option>
        	</c:forEach>        	               
           	</select>
        </div>
        <div class=" layui-input-inline searchType2" style="width: 110px;">
        	<select name="searchType" lay-filter="college" class="college">
        	<option selected value="">请选择</option>
        	<c:forEach items="${requestScope.college}" var="r">
        	<option value="${r.id}">${r.name}</option>
        	</c:forEach>       	               
           	</select>
        </div>
         <div class=" layui-input-inline searchType3" style="width: 110px;">
        	<select name="searchType" lay-filter="people" class="people">
        	<option value="" selected="">请选择</option>       	   
			<option  value="0">学生</option>
            <option value="1">导员</option>            
           	</select>
        </div>
       <div class=" layui-input-inline" style="width: 410px;"> 
      <div class="layui-inline">
      <input type="text" name="txt" lay-verify="title" autocomplete="off" placeholder="搜索" class="layui-input sinput"  style="width: 110px;">
      </div>
      <div class="layui-inline">
       <button class="layui-btn" lay-submit="" lay-filter="submit">搜索</button>
            <button class="layui-btn"  type="button" lay-submit="" lay-filter="add">添加</button>
            <button class="layui-btn" type="button" onclick="newTeam()">构建分组</button>
      </div>
        	
      </div>     
       
</div>
</form>

<script type="text/javascript">
layui.use('form', function () {
    var form = layui.form;
    
    form.on('select(searchon)', function(data){ 
    	
  	 $(".searchType1").addClass("layui-hide");
  	 $(".searchType2").addClass("layui-hide");
  	 $(".searchType3").addClass("layui-hide");
  	
  	$(".sinput").addClass("layui-hide");
  	 var a='school';
  	 if(data.value==a){
  		
  		 $(".searchType1").removeClass("layui-hide");
  		 $(".searchType2").find(".college").prop("disabled","disabled");
  		 $(".searchType3").find(".people").prop("disabled","disabled");
  		
  		form.on('select(school)',function(data){
  			$.cookie('the_cookie1',data.value);  			
  			$.cookie('the_cookie2',a);
  			console.log($.cookie('the_cookie2'));
  		});
  	 }
  	 var b='college';
  	 if(data.value==b){
  		$(".searchType2").removeClass("layui-hide");
 		 $(".searchType1").find(".school").prop("disabled","disabled");
 		 $(".searchType3").find(".people").prop("disabled","disabled");
 		
 		form.on('select(college)',function(data){
 			$.cookie('the_cookie1',data.value);  			
 			$.cookie('the_cookie2',b);
 			console.log($.cookie('the_cookie2'));
 		});
  	 }
  	 var c='people';
  	 if(data.value==c){
   		$(".searchType3").removeClass("layui-hide");
   		$(".sinput").removeClass("layui-hide");
  		 $(".searchType2").find(".college").prop("disabled","disabled");
  		 $(".searchType1").find(".school").prop("disabled","disabled");
  		
  		form.on('select(people)',function(data){
  			$.cookie('the_cookie1',data.value);  			
  			$.cookie('the_cookie2',c);
  			
  		})
   	 }
  	}); 
    
      form.render();       
      
       
      
});
</script>
<table class="layui-table" lay-even="" lay-skin="row">
    <thead>
    <tr>
    	<th>勾选</th>
        <th>账号</th>
        <th>用户名</th>
        <th>性别</th>
        <th>类型</th>
        <th>联系方式</th>
        <th>意向</th>
        <th>关注</th>
        <th>状态等级</th>
        <th>就读或就职</th>
        <th>状态</th>
        <th>相关信息</th>
        <th>备注</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${requestScope.user}" var="user" varStatus="status">
    <tr>
    	<td><input type="checkbox" name=""  lay-skin="primary" value=${user.id } onchange="amount(this)"></td>
    	<td>${user.niki}</td>
        <td>${user.name}</td>
        <td><c:if test="${user.sex==0 }">男</c:if><c:if test="${user.sex==1 }">女</c:if></td>
        <td>
        	<c:if test="${user.type==0}">学生</c:if>
        	<c:if test="${user.type==1}">辅导员</c:if>
        	<c:if test="${user.type==2}">临时</c:if>
        </td>
        <th>QQ:${user.qq} <br/>tel:${user.tel}</th>
        <th>
        	<c:if test="${user.ylevel==0}">读书</c:if>
        	<c:if test="${user.ylevel==1}">公务员</c:if>
        	<c:if test="${user.ylevel==2}">就业</c:if></th>
        <th>
        	<c:if test="${user.glevel==0}">A</c:if>
        	<c:if test="${user.glevel==1}">B</c:if>
        	<c:if test="${user.glevel==2}">C</c:if>
        	<c:if test="${user.glevel==3}">D</c:if>
        	<c:if test="${user.glevel==4}">N</c:if>
        	<c:if test="${user.glevel==5}">Y</c:if>
        </th>
        <th>
        	<c:if test="${user.slevel==0}">未联系</c:if>
        	<c:if test="${user.slevel==1}">已联系</c:if>
        	<c:if test="${user.slevel==2}">预报名</c:if>
        	<c:if test="${user.slevel==3}">已报名</c:if>
        	<c:if test="${user.slevel==4}">终结</c:if>
        </th>
        <th>
        	<c:forEach items="${requestScope.school }" var="s">
        		<c:if test="${s.id==user.school_id }">${s.name}</c:if>
        	</c:forEach>
        	<c:forEach items="${requestScope.college }" var="c">
        		<c:if test="${c.id==user.college_id }">${c.name }</c:if>
        	</c:forEach>
        	${user.classinfo}
        </th>
        <th>
        	<c:if test="${user.status==0}">正常</c:if>
        	<c:if test="${user.status==1}">禁止</c:if>
        	<c:if test="${user.status==2}">过期</c:if>
        </th>
        <th>${user.info }</th>
        <th>${user.comments }</th>
        <th><a href="javascript:edit(${user.id})">修改</a><a href="javascript:del(${user.id})">删除</a></th>
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
<script>

 layui.use('form', function(){
	  var form = layui.form;
	  form.render();
	  form.on('submit(add)', function(data){
		  layer.open({
			  type: 2,
			  area: ['700px', '450px'],
			  fixed: false, //不固定
			  maxmin: true,
			  content: 'add',
			  scrollbar: false,
			  maxmin: false,
			  resize:false
			});
		});
	  
	  form.on('submit(submit)', function(data){
		  $.cookie('the_cookie3',$(".sinput").val());
		 location.href="index";
		});
	}); 
 		function edit(id)
 		{
 			layer.open({
 				  type: 2,
 				  area: ['700px', '450px'],
 				  fixed: false, //不固定
 				  maxmin: true,
 				  content: 'edit?id='+id
 				});
 		}
 		function del(id)
 		{
 			 layer.alert('确认删除?', {
 				     skin: 'layui-layer-molv' //样式类名  自定义样式
 				     ,closeBtn: 1    // 是否显示关闭按钮
 				     ,anim: 1 //动画类型
 				     ,btn: ['删了！','算了吧'] //按钮
 				     ,icon: 6    // icon
 				     ,yes:function(){
 				       location.href="del?id="+id;
 				     }
 				     ,btn2:function(){
 				     }});
 		}
 		function amount(o){
 			if($("input[type=checkbox]:checked").length>2)
 				{
 					alert("最多2个");
 					$(o).prop("checked",false);
 				}	
 		}
 		function newTeam()
 		{
 			var arr = [];
                $("input[type=checkbox]:checked").each(function(i){
                    arr.push($(this).val());
                });
                txt=arr.join(",");
                alert(txt);
 			layer.open({
 				  type: 2,
 				  area: ['600px', '400px'],		  
 				  maxmin: true,
 				  fixed:false,
 				 content:'newGroup?searchType=id&txt='+txt
 			})
 		}
</script>
</body>
</html>