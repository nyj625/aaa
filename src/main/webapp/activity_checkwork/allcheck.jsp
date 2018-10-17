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

<script type="text/javascript">
$(function(){
	
	var a=${requestScope.info.check1};
	var b=${requestScope.info.check2};
	var c=${requestScope.info.check3};
	$("input[name='check1'][value='"+a+"']").attr("checked",true); 
	$("input[name='check2'][value='"+b+"']").attr("checked",true);
	$("input[name='check3'][value='"+c+"']").attr("checked",true);
	
});

</script>

<c:if test="${requestScope.info==null}">
<form class="f1 layui-form layui-form-pane" method="post" action="insert">
</c:if>
<c:if test="${requestScope.info!=null}">
<form class="f1 layui-form layui-form-pane" method="post" action="update">
<input type="hidden" name="id" value="${requestScope.info.id}">
</c:if>
       
    
    <div class="layui-form-item "> 
    <input type="checkbox"  value="mornning" layui-filter="all">
    <label class="layui-form-label">早打卡</label>     
        <div class="layui-input-block">
            <input type="radio" name="check1" value="0" title="正常" >
            <input type="radio" name="check1" value="1" title="迟到">
           <input type="radio" name="check1" value="2" title="早退">
           <input type="radio" name="check1" value="3" title="请假">
           <input type="radio" name="check1" value="4" title="未到">
        </div>
    </div>
     <div class="layui-form-item">   
     <input type="checkbox"  value="lunch" layui-filter="all">
        <label class="layui-form-label">午打卡</label>
        <div class="layui-input-block">
            <input type="radio" name="check2" value="0" title="正常" >
            <input type="radio" name="check2" value="1" title="迟到">
           <input type="radio" name="check2" value="2" title="早退">
           <input type="radio" name="check2" value="3" title="请假">
           <input type="radio" name="check2" value="4" title="未到">
        </div>
    </div>
    <div class="layui-form-item">
    <input type="checkbox"  value="night" layui-filter="all">
        <label class="layui-form-label">晚打卡</label>
        <div class="layui-input-block">
            <input type="radio" name="check3" value="0" title="正常" >
            <input type="radio" name="check3" value="1" title="迟到">
           <input type="radio" name="check3" value="2" title="早退">
           <input type="radio" name="check3" value="3" title="请假">
           <input type="radio" name="check3" value="4" title="未到">
        </div>
    </div>
  
    <div class="layui-form-item">
        <button class="layui-btn"  onclick="up();" type="button">提交</button>
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
            form.on('checkbox(filter)', function(data){
            	  console.log(data.elem); //得到checkbox原始DOM对象
            	  console.log(data.elem.checked); //是否被选中，true或者false
            	  console.log(data.value); //复选框value值，也可以通过data.elem.value得到
            	  console.log(data.othis); //得到美化后的DOM对象
            	}); 

    });
    function up(){
    	var upcheck=[];
    	var inform=[];
    	var check = {
				check1:"",
				check2:"",
				check3:""
		}
    	var pre = {
				mornning:"",
				lunch:"",
				night:""
		}
		$("input[type='radio']").each(function() {
			if($(this).is(":checked")){
				var value=$(this).val();
				var name=$(this).attr("name");
				
				var p=$(this).parent().prev().prev().prev().val();
				var l=$(this).parent().prev().prev().prev().val();
				
				
				if(name=='check1'){
					check.check1=value;
				}
				if(name=='check2'){
					check.check2=value;	
				}
				if(name=='check3'){
					check.check3=value;
				}
				if(l=='mornning'){
					pre.mornning =p;
				}
				if(l=='lunch'){
					pre.lunch =p;
				}	
				if(l=="night"){
					pre.night =p;
				}
			}
		});
		
		var q=JSON.stringify(inform);
		var m=JSON.stringify(upcheck);
		//q.concat(m);
		//alert(m);
		//alert(q);
		  // alert(inform);
		   var data1 = {
		        	checkwork:JSON.stringify(check),
		        	pre:JSON.stringify(pre)
		        }
		  
		  $.ajax({
		        url: 'upcheck',
		        type: "POST",
		        data:{
		        	json:JSON.stringify(data1)
		        },
		        dataType: "json",
		        success: function(json){
		            if(json.status>0){
		                   
		                layer.msg("修改成功", {icon: 500});
		                parent.location.reload();
		            }else{
		                layer.msg("修改失败", {icon: 500});
		            }
		        }
		    });
	}
  

</script>
</body>
</html>