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
    <style>
    	.left
    	{
    		width:50%;
    		height:100%;
    		margin:14px 250px;
    		display:inline-block;
    	}
    	.right{
    		width:425px;
    		height:425px;
    		margin:30px 30px;
    		display:none;
    		float:right;
    		position:fixed;
    	}
    </style>
</head>
<body class="body">
<div class="left">
<form class="f1 layui-form layui-form-pane" method="post" action="insert">        
     <div class="layui-form-item" pane="" style="width:455px">
        <label class="layui-form-label">设备场地选择</label>
        <div class="layui-input-block " >
            <input type="checkbox" name="option1" lay-skin="primary" title="音响" class="chk">
            <input type="checkbox" name="option2" lay-skin="primary" title="座椅" class="chk">
            <input type="checkbox" name="option3" lay-skin="primary" title="投影" class="chk">
            <input type="checkbox" name="option4" lay-skin="primary" title="话筒" class="chk">
            <input type="checkbox" name="option5" lay-skin="primary" title="场地：酒店" class="chk">
            <input type="checkbox" name="option6" lay-skin="primary" title="场地：学校" class="chk">
            <input type="checkbox" name="option7" lay-skin="primary" title="场地：室外" class="chk">
        </div>
    </div>
     
     
      <div class="layui-form-item">
      		<div class="layui-input-inline" >
	      		<label class="layui-form-label">活动名称</label>
	            <div class="layui-input-block" style="width: 190px;">
	               <input type="text" name="name" autocomplete="off"  class="layui-input" value="${requestScope.info.name}" onclick="hide()">           
	            </div>  
      		</div>
      		<div class="layui-input-inline" style="margin-left:90px">
	     		<label class="layui-form-label">参与人数</label>
	            <div class="layui-input-block" style="width: 60px;">
	               <input type="number" name="count"   class="layui-input" value="${requestScope.info.user_id}" onclick="hide()">          
	            </div>
 			</div>        
 	</div>
 	<div class="layui-form-item"> 
     <label class="layui-form-label">活动类型</label>
        <div class="layui-input-inline" style="width:180px">
           <select  class="inputselect" name="type" onclick="hide()">
				<option value="0">实训</option>
		        <option value="1">宣讲</option>
		        <option value="2">比赛</option>
		        <option value="3">假期团建</option>					
			</select>
		</div>
		<div class="layui-input-inline" style="margin-left:-10px">
     		<label class="layui-form-label">班级数量</label>
            <div class="layui-input-block" style="width:60px;">
               <input type="number" name="classcount"   class="layui-input" value="${requestScope.info.operator_id}" onclick="hide()">           
        </div>
 </div>
	</div>

	<div class="layui-form-item studentForm">
	        <label class="layui-form-label layui-text" style="color:black">专业</label>
	        	<div class="layui-input-inline" style="display:inline-block;width:165px">
		            <select name="school_id" lay-filter="school_id" onclick="hide()">
		            	<option value="">学校</option>
		                <c:forEach items="${requestScope.school}" var="s">
		                	<c:if test="${s.id==user.school_id }">
		                		<option value=${s.id } selected>${s.name }</option>
		                	</c:if>
		                	<c:if test="${s.id!=user.school_id }">
		                		<option value=${s.id }>${s.name }</option>
		                	</c:if>
		                </c:forEach>
		            </select>
	        	</div>
		        <div class="layui-input-inline" style="display:inline-block;margin:0 8px;width:165px;">
		            <select name="college_id" lay-filter="college_id" onclick="hide()">
		            	<option value="">学院</option>
		            	<c:forEach items="${requestScope.college}" var="c">
		            		<c:if test="${c.id==user.college_id}">
		            			<option value=${c.id } selected>${c.name }</option>
		            		</c:if>
		                	<c:if test="${c.id!=user.college_id}">
		            			<option value=${c.id }>${c.name }</option>
		            		</c:if>
		                </c:forEach>
		            </select>
    			</div>
    	</div>
  <div class="layui-form-item">
  <div class="layui-input-inline">
     <label class="layui-form-label">负责人</label>
            <div class="layui-input-block">
               <input type="text" class="layui-input charge_operatorname" value="${requestScope.info.operator_id}" onfocus="show()" readonly="readonly" style="width: 130px">           
            </div>
 	</div>
 		<div class="layui-input-inline" style="margin-left:51px">
     		<label class="layui-form-label">辅导员</label>
            <div class="layui-input-block" style="width: 100px;">
               <input type="text"   class="layui-input Instructor_username" value="${requestScope.info.operator_id}" onfocus="show()" readonly="readonly">           
            </div>
 		</div>
 		
 	</div>
 <div class="layui-form-item" style="width:450px">
  	<div class="layui-input-inline">
     		<label class="layui-form-label">来源人</label>
            <div class="layui-input-block" style="width: 120px;">
               <input type="text" class="layui-input source_operatorname" value="${requestScope.info.operator_id}" onfocus="show()" readonly="readonly">           
            </div>
 	</div>
 	<!-- <div class="layui-input-inline" style="width:300px">
  	<label class="layui-form-label">状态</label>
        <div class="layui-input-block">
            <input type="radio" name="status" value="1" title="正常" check='' onclick="hide()">
            <input type="radio" name="status" value="0" title="取消" onclick="hide()">
        </div>
  </div> -->
 </div>
  <div class="layui-form-item" style="width:460px">
			<div class="layui-form-item layui-form-text">
        <label class="layui-form-label">时间信息</label>
        <div class="layui-input-block">
            <textarea placeholder="xxxx年xx月xx日" class="layui-textarea" name="dateinfo" onclick="hide()">${requestScope.info.comments}</textarea>
        </div>
    </div>
    </div>
     <div class="layui-form-item" style="width:460px">
			<div class="layui-form-item layui-form-text">
        <label class="layui-form-label">计划信息</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" name="planinfo" onclick="hide()">${requestScope.info.comments}</textarea>
        </div>
    </div>
    </div>
     <div class="layui-form-item" style="width:460px">
			<div class="layui-form-item layui-form-text">
        <label class="layui-form-label">课程信息</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" name="courseinfo" onclick="hide()">${requestScope.info.comments}</textarea>
        </div>
    </div>
    </div>
  <div class="layui-form-item" style="width:460px">
			<div class="layui-form-item layui-form-text">
        <label class="layui-form-label">注意事项</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" name="attention" onclick="hide()">${requestScope.info.comments}</textarea>
        </div>
    </div>
    </div>
  <div class="layui-form-item" style="width:460px">
			<div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" name="comments" onclick="hide();">${requestScope.info.comments}</textarea>
        </div>
    </div>
    </div>
    <div class="layui-form-item">
  <div class="layui-input-inline">
            <div class="layui-input-block" style="width: 100px;">
            <input type="hidden" name="charge_operator_id"   class="layui-input" value="${requestScope.info.operator_id}" readonly="readonly" placeholder="添加人">
            	<input type="hidden" name="source_operator_id"   class="layui-input" value="${requestScope.info.operator_id}"  readonly="readonly" placeholder="添加人">
            	<input type="hidden" name="instructor_user_id"   class="layui-input" value="${requestScope.info.operator_id}"  readonly="readonly" placeholder="添加人">
            </div>
 </div>
 </div>
    <div class="layui-form-item">
        <button class="layui-btn"  onclick="save()" type="button">提交</button>
    </div>
</form>
</div>
<div class="right layui-anim" style="overflow-y:scroll;height:400px">
	<table class="layui-table" lay-even="" lay-skin="row">
    <colgroup>
        <col width="150">
        <col width="150">
        <col width="200">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th>名字</th>
        <th>部门</th>
        <th>角色选定</th>
    </tr>
    </thead>
    <tbody>
    	<c:forEach items="${requestScope.oper}" var="o">
		    <tr>
			    <td><label class="name">${o.name }</label>
			    	<input type="hidden" value="${o.id}" class="id">
			    </td>
			    <td>
			    	<c:if test="${o.type==0}">讲师</c:if>
			    	<c:if test="${o.type==1}">市场</c:if>
			    	<c:if test="${o.type==2}">后勤</c:if>
			    	<c:if test="${o.type==3}">人事</c:if>
			    </td>
			    <td><form class="layui-form">
			        <div class="layui-input-block" style="margin:0 0">
			        <select lay-filter="moveToLeft" class="moveToLeft">
			             <option value="" selected>未选择</option>
			             <option value="0">负责人</option>
			             <option value="1">来源人</option>
			             <option value="2">辅导员</option>

			        </select>
        			</div>
    				    </form>
			    </td>
		    </tr>
    	</c:forEach>

    </tbody>
</table>
</div>

<script type="text/javascript">
    layui.use(['form', 'layedit', 'element','layer'], function () {
        var form = layui.form
                , layer = layui.layer
                , layedit = layui.layedit
                , element = layui.element;
        form.on('select(school_id)', function(data){
      	  $("select[name=college_id]").empty();
      	  $("select[name=college_id]").append($("<option value=''>学院</option>"))
      	  $.ajax({ 
      	        type: "POST", 
      	        cache: false, 
      	        data: {searchType:'school_id',txt:data.value}, 
      	        dataType:"json",
      	        async: true, 
      	        url: "../activity_college/ReturnData", 
      	        success: function(json) {
      	        	for(i=0;i<json.length;i++)
      				  {
      				  	$("select[name=college_id]").append($("<option value="+json[i].id+">"+json[i].name+"</option>"));
      				  }
      	        	form.render();
      	        }, error: function(data) { 
      	            username = ""; 
      	        } 
      	    }); 
      	});
        
        form.on('select(moveToLeft)',function(data){
        	var name=$(event.target).parent().parent().parent().parent().parent().prev().prev().children(".name").html();
			var id=$(event.target).parent().parent().parent().parent().parent().prev().prev().children(".id").val();
        	if(data.value==0)
        		{
        			$(".charge_operatorname").val(name);
        			$("[name=charge_operator_id]").val(id);
        			$(".moveToLeft").each(function(index){
        				if((!$(this).is($(data.elem)))&&$(this).val()==data.value)
        					{
         					$(this).find("[value='']").attr("selected","selected");
            				$(this).find("[value='0']").attr("selected",false);
            				$(this).find("[value='1']").attr("selected",false);
            				$(this).find("[value='2']").attr("selected",false);
        					}
        			})
    				form.render();
        		}
        	if(data.value==1)
        		{
        			$(".source_operatorname").val(name);
        			$("[name=source_operator_id]").val(id);
        			$(".moveToLeft").each(function(index){
        				if((!$(this).is($(data.elem)))&&$(this).val()==data.value)
        					{
         					$(this).find("[value='']").attr("selected","selected");
            				$(this).find("[value='0']").attr("selected",false);
            				$(this).find("[value='1']").attr("selected",false);
            				$(this).find("[value='2']").attr("selected",false);
        					}
        			})
    				form.render();
        		}
         	if(data.value==2)
         		{
         			$(".Instructor_username").val(name);
         			$("[name=instructor_user_id]").val(id);
         			$(".moveToLeft").each(function(index){
        				if((!$(this).is($(data.elem)))&&$(this).val()==data.value)
        					{
         					$(this).find("[value='']").attr("selected","selected");
            				$(this).find("[value='0']").attr("selected",false);
            				$(this).find("[value='1']").attr("selected",false);
            				$(this).find("[value='2']").attr("selected",false);
        					}
        			})
    				form.render();
         		}
        	
        });
            return false;
});
    function save(){
    	var option='';
    	$("input[type=checkbox]").each(function(i) { // 遍历name=test的多选框
    		   // 每一个被选中项的值
    		   $(".chk").prop("disabled", "disabled");
    		   if($(this).is(":checked"))
    			   {
    			   option=option+'1';
    			   }
    		   else
    			   {
   				option=option+'0';
    			   }
    		});
		var date=$.param({'options':option.toString()})+'&'+$(".f1").serialize();
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
    function show(){
    	$(".left").animate({'margin':'0px 0px'});
    	$(".right").addClass("layui-anim-fadein").removeClass("layui-anim-fadeout");
    	$(".right").css("display","inline-block"); 
    }
    function hide(){ 
    	$(".left").animate({'margin':'0px 250px'});
    	$(".right").addClass("layui-anim-fadeout").removeClass("layui-anim-fadein");

    }
    function memberSelect(url,width,height){
    	layer.open({
    		type: 2,
    		area: [width, height],		  
    		maxmin: true,
    		content:url
    		}); 	
    }
    function setMember(nikis,names)
    {
    	$("[name=comments]").val(names);
    }

</script>
</body>
</html>