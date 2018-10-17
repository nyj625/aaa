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
	<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
	<style>
		.layui-form-label{
			display:inline-block;
			text-align:center;
		}
		.layui-text{
			display:inline-block;
			width:400px;
		}
		.layui-input-block{
			margin:10 -200px;
		}
	</style>
</head>
<body>
	<form class="layui-form" style="margin:0 -50px">
	<c:if test="${user!=null}">
		<input type="hidden" name="id" value=${user.id }>
	</c:if>
		<div class="layui-form-item">
	        <div class="layui-input-block">
	        	<label class="layui-form-label">用户名</label>
	            <input type="text" name="niki" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input layui-text" value="${user.niki}">
	        </div>
    	</div>
	    <div class="layui-form-item">
	        <div class="layui-input-block">
	        	<label class="layui-form-label">名字</label>
	            <input type="text" name="name" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input layui-text" value="${user.name}">
	        </div>
	    </div>
	    <div class="layui-form-item" pane="" style="margin:0 110px">
	        <label class="layui-form-label">性别</label>
	        <div class="layui-input-block">
	        	<c:if test="${user.sex==0||user==null}">
	        		<input type="radio" name="sex" value="0" title="男" checked="checked">
	        		<input type="radio" name="sex" value="1" title="女">
	        	</c:if>
	            <c:if test="${user.sex==1 }">
	        		<input type="radio" name="sex" value="0" title="男" >
	        		<input type="radio" name="sex" value="1" title="女" checked="checked">
	        	</c:if>

	        </div>
    	</div>
	    <div class="layui-form-item">
	        <label class="layui-form-label" style="margin:0 110px;display:inline-block">类型</label>
	        <div class="layui-input-block" style="width:400px;display:inline-block;margin:0 -110px">
	            <select name="type" lay-filter="type">
	            <c:if test="${user==null}">
	            <option value="" selected=""></option>
	            <option value="0" >学生</option>
	            <option value="1">辅导员</option>
	            <option value="2">临时</option>
	            </c:if>
	                
	                <c:if test="${user.type==0}">
	                	<option value="0" selected="">学生</option>
	                	<option value="1">辅导员</option>
	                	<option value="2">临时</option>
	                </c:if>
	                <c:if test="${user.type==1}">
	                	<option value="0" selected="">学生</option>
	                	<option value="1" >辅导员</option>
	                	<option value="2">临时</option>
	                </c:if>
	                <c:if test="${user.type==2}">
	                	<option value="0">学生</option>
	                	<option value="1">辅导员</option>
	                	<option value="2" selected="">临时</option>
	                </c:if>
	            </select>
	        </div>
    	</div>
    	<div class="layui-form-item studentForm">
	        <label class="layui-form-label layui-text" style="margin:0 -50px;color:black">专业</label>
	        	<div class="layui-input-inline" style="display:inline-block;margin:0 -110px;width:120px">
		            <select name="school_id" lay-filter="school_id">
		            	<option value="">学校</option>
		                <c:forEach items="${requestScope.school}" var="s">
		                	<c:if test="${s.id==user.school_id }">
		                		<option value="${s.id}" selected>${s.name}</option>
		                	</c:if>
		                	<c:if test="${s.id!=user.school_id }">
		                		<option value="${s.id}">${s.name}</option>
		                	</c:if>
		                </c:forEach>
		            </select>
	        	</div>
		        <div class="layui-input-inline" style="display:inline-block;width:120px;margin:0 10px">
		            <select name="college_id" lay-filter="college_id">
		            	<option value="">学院</option>
		            	<c:forEach items="${requestScope.college}" var="c">
		            		<c:if test="${c.id==user.college_id}">
		            			<option value="${c.id}" selected>${c.name}</option>
		            		</c:if>
		                	<c:if test="${c.id!=user.college_id}">
		            			<option value="${c.id}">${c.name}</option>
		            		</c:if>
		                </c:forEach>
		            </select>
    			</div>
    			<div class="layui-input-inline">
	            <input type="text" name="classinfo" lay-verify="title" autocomplete="off" placeholder="专业" class="layui-input layui-text" value="${user.classinfo}" style="width:120px;margin:0 -10px;width:160px">
	        	</div>
    	</div>
	    <div class="layui-form-item">
	        <div class="layui-input-block">
	        	<label class="layui-form-label">电话</label>
	            <input type="text" name="tel" lay-verify="title" autocomplete="off" placeholder="请输入电话" class="layui-input layui-text" value="${user.tel}">
	        </div>
	    </div>
	    <div class="layui-form-item">
	        <div class="layui-input-block">
	        	<label class="layui-form-label">QQ</label>
	            <input type="text" name="qq" lay-verify="title" autocomplete="off" placeholder="请输入QQ" class="layui-input layui-text" value="${user.qq}">
	        </div>
	    </div>
	    <div class="layui-form-item">
	        <label class="layui-form-label" style="margin:0 110px;display:inline-block">意向</label>
	        <div class="layui-input-block" style="width:400px;display:inline-block;margin:0 -110px">
	            <select name="ylevel" lay-filter="aihao">
	            	<c:if test="${user.ylevel==0||user==null}">
	            	<option value="0" selected>读书</option>
	                <option value="1">公务员</option>
	                <option value="2">就业</option>
	            	</c:if>
	            	<c:if test="${user.ylevel==1}">
	            	<option value="0">读书</option>
	                <option value="1" selected>公务员</option>
	                <option value="2">就业</option>
	            	</c:if>
	            	<c:if test="${user.ylevel==2}">
	            	<option value="0">读书</option>
	                <option value="1">公务员</option>
	                <option value="2" selected>就业</option>
	            	</c:if>
	            </select>
	        </div>
    	</div>
	    <div class="layui-form-item">
	        <label class="layui-form-label" style="margin:0 110px;display:inline-block">关注</label>
	        <div class="layui-input-block" style="width:400px;display:inline-block;margin:0 -110px">
	            <select name="glevel" lay-filter="glevel">
	            	<c:if test="${user.glevel==0||user==null }">
	            		<option value="0" selected>A</option>
		                <option value="1">B</option>
		                <option value="2">C</option>
		                <option value="3">D</option>
		                <option value="4">N</option>
		                <option value="5">Y</option>
	            	</c:if>
	            	<c:if test="${user.glevel==1}">
	            		<option value="0">A</option>
		                <option value="1" selected>B</option>
		                <option value="2">C</option>
		                <option value="3">D</option>
		                <option value="4">N</option>
		                <option value="5">Y</option>
	            	</c:if>
	            	<c:if test="${user.glevel==2}">
	            		<option value="0">A</option>
		                <option value="1">B</option>
		                <option value="2" selected>C</option>
		                <option value="3">D</option>
		                <option value="4">N</option>
		                <option value="5">Y</option>
	            	</c:if>
	            	<c:if test="${user.glevel==3}">
	            		<option value="0">A</option>
		                <option value="1">B</option>
		                <option value="2">C</option>
		                <option value="3" selected>D</option>
		                <option value="4">N</option>
		                <option value="5">Y</option>
	            	</c:if>
	            	<c:if test="${user.glevel==4}">
	            		<option value="0">A</option>
		                <option value="1">B</option>
		                <option value="2">C</option>
		                <option value="3">D</option>
		                <option value="4" selected>N</option>
		                <option value="5">Y</option>
	            	</c:if>
	            	<c:if test="${user.glevel==5}">
	            		<option value="0">A</option>
		                <option value="1">B</option>
		                <option value="2">C</option>
		                <option value="3">D</option>
		                <option value="4">N</option>
		                <option value="5" selected>Y</option>
	            	</c:if>
	            </select>
	        </div>
    	</div>
	   <div class="layui-form-item">
	        <label class="layui-form-label" style="margin:0 110px;display:inline-block">状态等级</label>
	        <div class="layui-input-block" style="width:400px;display:inline-block;margin:0 -110px">
	            <select name="slevel" lay-filter="aihao">
	            	<c:if test="${user.slevel==0||user==null}">
		            	<option value="0" selected>未联系</option>
		                <option value="1">已联系</option>
		                <option value="2">预报名</option>
		                <option value="3">已报名</option>
		                <option value="4">终结</option>
	            	</c:if>
	            	<c:if test="${user.slevel==1}">
		            	<option value="0">未联系</option>
		                <option value="1" selected>已联系</option>
		                <option value="2">预报名</option>
		                <option value="3">已报名</option>
		                <option value="4">终结</option>
	            	</c:if>
	            	<c:if test="${user.slevel==2}">
		            	<option value="0">未联系</option>
		                <option value="1">已联系</option>
		                <option value="2" selected>预报名</option>
		                <option value="3">已报名</option>
		                <option value="4">终结</option>
	            	</c:if>
	            	<c:if test="${user.slevel==3}">
		            	<option value="0">未联系</option>
		                <option value="1">已联系</option>
		                <option value="2">预报名</option>
		                <option value="3" selected>已报名</option>
		                <option value="4">终结</option>
	            	</c:if>
	            	<c:if test="${user.slevel==4}">
		            	<option value="0">未联系</option>
		                <option value="1">已联系</option>
		                <option value="2">预报名</option>
		                <option value="3">已报名</option>
		                <option value="4" selected>终结</option>
	            	</c:if>
	            </select>
	        </div>
    	</div>
	    <div class="layui-form-item">
	        <label class="layui-form-label" style="margin:0 110px;display:inline-block">状态</label>
	        <div class="layui-input-block" style="width:400px;display:inline-block;margin:0 -110px">
	            <select name="status" lay-filter="aihao">
	            	<c:if test="${user.status==0||user==null}">
		            	<option value="0" selected>正常</option>
		                <option value="1">禁止</option>
		                <option value="2">过期</option>
	            	</c:if>
	            	<c:if test="${user.status==1 }">
		            	<option value="0">正常</option>
		                <option value="1" selected>禁止</option>
		                <option value="2">过期</option>
	            	</c:if>
	            	<c:if test="${user.status==2 }">
		            	<option value="0">正常</option>
		                <option value="1">禁止</option>
		                <option value="2" selected>过期</option>
	            	</c:if>
	            </select>
	        </div>
    	</div>
	    <div class="layui-form-item">
	        <div class="layui-input-block">
	        	<label class="layui-form-label">相关信息</label>
	            <input type="text" name="info" lay-verify="title" autocomplete="off" placeholder="请输入" class="layui-input layui-text" value="${user.info}">
	        </div>
	    </div>
	    <div class="layui-form-item">
	        <div class="layui-input-block">
	        	<label class="layui-form-label">备注</label>
	            <input type="text" name="comments" lay-verify="title" autocomplete="off" placeholder="请输入" class="layui-input layui-text" value="${user.comments}">
	        </div>
	    </div>
	    <div class="layui-form-item">
	        <button class="layui-btn" lay-submit="" lay-filter="submit" style="margin:0px 150px;width:475px">保存</button>
	    </div>	
	</form>
<script src="../frame/layui/layui.all.js"></script>
<script type="text/javascript">
layui.use('form', function(){
  var form = layui.form;
 
	  form.on('select(school_id)', function(data){
		  alert(1);
		  if(${requestScope.user==null}){
			  alert(2);
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
		  }
		});
 
 
  form.on('submit(submit)', function(data){
	  if(${requestScope.user.id==null})
	  	{
			  $.post("insert",$(".layui-form").serialize(),function(){
				  var index=parent.layer.getFrameIndex(window.name);
				  parent.layer.close(index);
				  window.parent.location.reload();
			  },"text");
	  	}
	  else
		  {
			  $.post("update",$(".layui-form").serialize(),function(){
				  var index=parent.layer.getFrameIndex(window.name);
				  parent.layer.close(index);
				  window.parent.location.reload();
			  },"text");
		  }
	  
	  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
	});
  
});
</script>
</body>
</html>