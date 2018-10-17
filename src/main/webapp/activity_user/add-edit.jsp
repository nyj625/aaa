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
        <label class="layui-form-label">小组名</label>

        <div class="layui-input-inline">
            <input type="text" name="name"  placeholder="请输入" 
                   class="layui-input" value="${requestScope.info.name}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">成员</label>

        <div class="layui-input-inline">
            <input type="text" lay-verify="required" placeholder="请输入" autocomplete="off"
                   class="layui-input" value="${requestScope.names}" disabled="disabled">
            <input type="hidden" name="ids" value="${requestScope.ids}">
        </div>
    </div>
     <div class="layui-form-item">
        <label class="layui-form-label">项目名</label>

        <div class="layui-input-inline">
            <input type="text" name="project" lay-verify="required" placeholder="请输入" autocomplete="off"
                   class="layui-input" value="${requestScope.info.project}">
        </div>
    </div>
      <div class="layui-form-item">
        <label class="layui-form-label">操作员姓名</label>

        <div class="layui-input-inline">
            <input type="text" name="operator_name" lay-verify="required" placeholder="请输入" autocomplete="off"
                   class="layui-input" value="${requestScope.info.operator_name}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">活动名</label>

        <div class="layui-input-inline">
            <input type="text" name="activity_name" lay-verify="required" placeholder="请输入" autocomplete="off"
                   class="layui-input" value="${requestScope.info.activity_name}">
        </div>
    </div>
 <div class="layui-input-inline"></div>
  <div class="layui-input-inline">
   <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">日期选择</label>
            <div class="layui-input-block">
                <input type="text" name="createdate" value="${requestScope.info.createdate}" id="date1" autocomplete="off" class="layui-input" >
            </div>
        </div>
  </div>
  </div>
	<div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注</label>
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
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });
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
    	 url:'../activity_usergroup/insert',
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