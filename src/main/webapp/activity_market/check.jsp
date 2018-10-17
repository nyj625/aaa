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
   
    <div class="layui-form-item" >
    <table class="layui-table" id="demo" lay-filter="test"></table>    
    </div>
    
  

<script type="text/javascript" >

$(function(){
	layui.use('table', function(){
	    var table = layui.table;
	       
	      //转换静态表格
	           table.render({
	                elem: '#demo',
	               
	                url:'infomation',
	              contentType: 'application/json',
	              
	                parseData:function(res){
	                    return {
	                         "code":res.code,
	                         "msg":res.msg,
	                         "count":res.count,
	                         "data":res.data.item
	                    }
	                },
	                  cols: [[	               
	                 {field:"name", title: '姓名',width:220 ,edit:'text'}
	                 ,{field:"level", title: '受关注度',width:220 ,edit:'text'} //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1  新增
	                 ,{field:"studentinfo", title: '学生信息',width:220 ,edit:'text'}
	                  ]]
	         });
	      
	           table.on('edit(test)', function(obj){
	      		 var names=[];
	      		 var levels=[];
	      		 var studentinfos=[];
	        	   
	       	    var value = obj.value //得到修改后的值
	       	    ,data = obj.data //得到所在行所有键值
	       	    ,field = obj.field; //得到字段
	       	
				$("tr").each(function(index,element){
					
					if(index>0)
						{		
						//alert(field);
						if(field=='name'){

							if(obj.data.name==$(this).find(".laytable-cell-1-name").html()){
								
								names.push(value);
							levels.push($(this).find(".laytable-cell-1-level").html());
							studentinfos.push($(this).find(".laytable-cell-1-studentinfo").html());
							}
							
							else{
								names.push($(this).find(".laytable-cell-1-name").html());
								levels.push($(this).find(".laytable-cell-1-level").html());
								studentinfos.push($(this).find(".laytable-cell-1-studentinfo").html());
							}
						}else if(field=='level'){

							if(obj.data.level==$(this).find(".laytable-cell-1-level").html()){
								names.push($(this).find(".laytable-cell-1-name").html());
								levels.push(value);
								studentinfos.push($(this).find(".laytable-cell-1-studentinfo").html());
							}else{
								names.push($(this).find(".laytable-cell-1-name").html());
								levels.push($(this).find(".laytable-cell-1-level").html());
								studentinfos.push($(this).find(".laytable-cell-1-studentinfo").html());
								}
						}else{
							if(obj.data.studentinfo==$(this).find(".laytable-cell-1-studentinfo").html())
								{
								names.push($(this).find(".laytable-cell-1-name").html());
								levels.push($(this).find(".laytable-cell-1-level").html());
								studentinfos.push(value);
								}
							else{
								names.push($(this).find(".laytable-cell-1-name").html());
								levels.push($(this).find(".laytable-cell-1-level").html());
								studentinfos.push($(this).find(".laytable-cell-1-studentinfo").html());
								}
						}
						}
				});
	       		var giveback=[];
	       		for(i=0;i<names.length;i++){
	       			giveback.push('{'+'"'+'name'+'":"'+names[i]+'",'+'"'+'level'+'":"'+levels[i]+'",'+'"'+'studentinfo'+'":"'+studentinfos[i]+'"'+'}');
	       			
	       			}
	       		alert(giveback);
	       	giveback="["+giveback+"]";
	       		alert(giveback);
	       	   $.post('student',{studentjson:giveback},function(json){
	       		   if(json.status>1){
	       			alert("修改成功");
	       		   }
	       	   })
	       	    
	       	  });
	   })
	   
	 
})
</script>
</body>
</html>