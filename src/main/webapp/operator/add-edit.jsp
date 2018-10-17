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
<c:if test="${requestScope.info==null}">
<form class="f1 layui-form layui-form-pane" method="post" action="insert">
</c:if>
<c:if test="${requestScope.info!=null}">
<form class="f1 layui-form layui-form-pane" method="post" action="update">
<input type="hidden" name="id" value="${requestScope.info.id}">
</c:if>
    <div class="layui-form-item">
        <label class="layui-form-label">昵称</label>

        <div class="layui-input-inline">
            <input type="text" name="nike"  placeholder="请输入" 
                   class="layui-input" value="${requestScope.info.nike}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>

        <div class="layui-input-inline">
            <input type="text" name="name" lay-verify="required" placeholder="请输入" autocomplete="off"
                   class="layui-input" value="${requestScope.info.name}">
        </div>
    </div>
     <div class="layui-form-item">
        <label class="layui-form-label">默认密码</label>

        <div class="layui-input-inline">
            <input type="text" name="pass" lay-verify="required" placeholder="请输入" autocomplete="off"
                   class="layui-input" value="${requestScope.info.pass}">
        </div>
    </div>
      <div class="layui-form-item">
        <label class="layui-form-label">登录名-tel</label>

        <div class="layui-input-inline">
            <input type="text" name="tel" lay-verify="required" placeholder="请输入" autocomplete="off"
                   class="layui-input" value="${requestScope.info.tel}">
        </div>
    </div>
    <div class="layui-form-item">
				<label  class="layui-form-label">类型</label>
				<div class="layui-input-inline">
					<select name="type" class="inputselect">
						<c:forEach items="${requestScope.typelist}" var="r"
							varStatus="v">
							<c:if test="${requestScope.info.type!=v.index}">
					<option value="${v.index}">${r}</option>
				</c:if>
				<c:if test="${requestScope.info.type==v.index}">
					<option selected="selected" value="${v.index}">${r}</option>
				</c:if>
						</c:forEach>
					</select>
				</div>
			</div>
			  <div class="layui-form-item">
				<label  class="layui-form-label">状态</label>
				<div class="layui-input-inline">
					<select name="status" class="inputselect">
						<c:forEach items="${requestScope.statuslist}" var="r"
							varStatus="v">
							<c:if test="${requestScope.info.status!=v.index}">
					<option value="${v.index}">${r}</option>
				</c:if>
				<c:if test="${requestScope.info.status==v.index}">
					<option selected="selected" value="${v.index}">${r}</option>
				</c:if>
						</c:forEach>
					</select>
				</div>
			</div>
			  <div class="layui-form-item">
				<label  class="layui-form-label">权限</label>
				<div class="layui-input-inline">
					<select name="power" class="inputselect">
						<c:forEach items="${requestScope.powerlist}" var="r"
							varStatus="v">
							<c:if test="${requestScope.info.power!=v.index}">
					<option value="${v.index}">${r}</option>
				</c:if>
				<c:if test="${requestScope.info.power==v.index}">
					<option selected="selected" value="${v.index}">${r}</option>
				</c:if>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
        <label class="layui-form-label">普通文本域</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" name="comments" >${requestScope.info.comments}</textarea>
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

        //监听提交
        //form.on('submit(sub)', function (data) {
          //  layer.alert(JSON.stringify(data.field), {
           //     title: '最终的提交信息'
          //  });
            return false;
      //  });

    });
    
    function save(){
    	//var json0=$(".f1").serialize();
    	$.ajax({　　　　　　　　	
    	 url:$('.f1').attr("action"),
    	 dataType: "json",
    　　　        type:"post",
    　　　　data:$(".f1").serialize(),
    	   //contentType: 'application/json;charset=utf-8',
    　　　　success:function(json){
    	if(json.status>1)
    　　　　　　alert("成功 ! ");
    		parent.location.reload();
    　　　　}
    });
    }

</script>
</body>
</html>