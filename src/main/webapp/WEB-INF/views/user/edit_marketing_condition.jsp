<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link href="<%=basePath %>js/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>js/dateControl.js"></script>
<script type="text/javascript" src="<%=basePath %>js/uploadify/swfobject.js"></script>
<script type="text/javascript" src="<%=basePath %>js/uploadify/jquery.uploadify.v2.1.0.js"></script>
<script type="text/javascript" src="<%=basePath %>js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath %>js/ProvinceAndCityJson.js"></script>
<script>
	$(document).ready(function(){
		var province=document.getElementById("province");
		for(var i=0;i<provinceAndCityData.province.length;i++)
		{
				var opt = document.createElement ("option");
			    opt.value = provinceAndCityData.province[i].code;
			    opt.innerText =provinceAndCityData.province[i].name;
			    
			    //************设置选中**************
			    var province2 = "${mc.province }";
			    if(province2==provinceAndCityData.province[i].name){
			    	opt.selected = true;
			    }
			    //********************************
			    
			    province.appendChild(opt);
			  	getvalue(opt.value);
		}
	});
	
	function getvalue(){ 
		
		var provincecode=document.getElementById("province").value;
		 document.getElementById("city").options.length = 0;
		var city=document.getElementById("city");
		for(var i=0;i<provinceAndCityData.province.length;i++)
		{
			if(provinceAndCityData.province[i].code==provincecode){
				for(var x=0;x<provinceAndCityData.province[i].city.length;x++){
					var citydata=provinceAndCityData.province[i].city[x];
					var op = document.createElement ("option");
					//htmlcity+='<option value="'+citydata.code+'">'+citydata.name+'</option>';
					op.value =citydata.code;
				    op.innerText =citydata.name;
				    
				    //************设置选中**************
				    var city2 = "${mc.city }";
				    if(city2==citydata.name){
				    	op.selected = true;
				    }
				    //********************************
				    
				    city.appendChild(op);
				}
			}
		}
		
	  }; 
</script>
<script>
var editor;
$(document).ready(function()
{
// 	  editor=UE.getEditor('content');
	var age = "${mc.age }";  //年龄段
	var consumptions = "${mc.consumptions }";  //消费观念
	var preferences = "${mc.preferences }";  //消费偏好

	//设置已选中
	var age_strs= new Array(); //定义一数组 
	age_strs=age.split(","); //字符分割 
	for (i=0;i<age_strs.length ;i++ ) 
	{ 
// 		document.write(age_strs[i]+"<br/>"); //分割后的字符输出 
		$('input[name="age_list"]').each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数    
			var a = $(this).val()
			if(a==age_strs[i]){
				$(this).attr("checked", true);
			}
		}); 
	} 

	//设置已选中
	var consumptions_strs= new Array(); //定义一数组 
	consumptions_strs=consumptions.split(","); //字符分割 
	for (i=0;i<consumptions_strs.length ;i++ ) 
	{ 
// 		document.write(consumptions_strs[i]+"<br/>"); //分割后的字符输出 
		$('input[name="consumption_idea"]').each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数    
			var a = $(this).val()
			if(a==consumptions_strs[i]){
				$(this).attr("checked", true);
			}
		}); 
	} 

	//设置已选中
	var preferences_strs= new Array(); //定义一数组 
	preferences_strs=preferences.split(","); //字符分割 
	for (i=0;i<preferences_strs.length ;i++ ) 
	{ 
// 		document.write(preferences_strs[i]+"<br/>"); //分割后的字符输出 
		$('input[name="consumer_preference"]').each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数    
			var a = $(this).val()
			if(a==preferences_strs[i]){
				$(this).attr("checked", true);
			}
		}); 
	} 
	
});

$(document).ready(function()
{
	$("#uploadimgs").change(function()
	   {
		//创建FormData对象
		var data = new FormData();
	       //为FormData对象添加数据
		$.each($('#uploadimgs')[0].files, function(i, file) 
	     	{
	         	data.append('upload_file', file);
	       });
		data.append('phototype', $('#phototype').val());
		data.append('photosize', $('#photosize').val());
		data.append('photowidth', $('#photowidth').val());
		data.append('photoheight', $('#photoheight').val());
		//data.append('images', $('#images').val());
		$.ajax(
		{
			url:'<%=basePath%>fileupload.do',
			type:'POST',
			data:data,
			cache: false,
			contentType: false,    //不可缺
			processData: false,    //不可缺
			success: function(data)
	           {
				var jsonData = eval('(' + decodeURIComponent(data) + ')');
				if(jsonData.status == 'SUCCESS')
				{
					$('#img').val(jsonData.data);
					$('#topimg').attr('src', jsonData.data);
				}
				else
				{
					alert(jsonData.data);
				}
	           }
	       });
	   });
			
});


function gotoUrl(state){
	
	var sex = $("#sex").val();
// 	var age = $("#age").val();
	//jquery获取复选框值    
	var age_value = [];
	$('input[name="age_list"]:checked').each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数    
		age_value.push($(this).val());//将选中的值添加到数组chk_value中    
	});    
	var age  = age_value.toString();
	document.getElementById("agelist").value=age;
	
	//jquery获取复选框值    
	var consumption_idea_value = [];
	$('input[name="consumption_idea"]:checked').each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数    
		consumption_idea_value.push($(this).val());//将选中的值添加到数组chk_value中    
	});    
	var consumption_idea  = consumption_idea_value.toString();
	document.getElementById("consumption_idealist").value=consumption_idea;
	
	//jquery获取复选框值    
	var consumer_preference_value = [];
	$('input[name="consumer_preference"]:checked').each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数    
		consumer_preference_value.push($(this).val());//将选中的值添加到数组chk_value中    
	});    
	var consumer_preference  = consumer_preference_value.toString();
	document.getElementById("consumer_preferencelist").value=consumer_preference;
	
	//省份
	var provincename = $("#province").find("option:selected").text();  
	var provincevalue = $("#province").val();
// 	alert(provincevalue);
	$("#province1").val(provincename);
  	if(provincevalue==null || provincevalue=="" || provincevalue==undefined){
    	alert("省份、市、自治州不能为空！");
    	return;
    }
	
  	//城市
	if(provincevalue!=null || provincevalue!="" || provincevalue!=undefined){
		var city=document.getElementById("city");
		var cityname=city.options[city.options.selectedIndex].text;
// 	 	alert(cityname);
		$("#city1").val(cityname);
	} 
	
    if(sex==null || sex=="" || sex==undefined){
    	alert("性别不能为空！");
    	return;
    }
    if(age==null || age=="" || age==undefined){
    	alert("年龄段不能为空！");
    	return;
    }
    if(consumption_idea==null || consumption_idea=="" || consumption_idea==undefined){
    	alert("消费观念不能为空！");
    	return;
    }
    if(consumer_preference==null || consumer_preference=="" || consumer_preference==undefined){
    	alert("消费偏好不能为空！");
    	return;
    }
  
    
	var activity=document.getElementById("content");
	activity.action='<%=basePath%>marketing/edit';
   	activity.submit(); 
}

</script>

<div class="navigation">当前位置：接单人管理&nbsp;>&nbsp;接单人列表&nbsp;>&nbsp;编辑接单人营销条件&nbsp;>&nbsp;<a href="javascript: history.go(-1);">返回</a></div>
  <!--动态内容-->

 <form  method="post" action="#" id="content"  style="margin-top: 40px;">
	<div class="detail">
	
		<div class="itempanel">
			<div class="floatleft title">省份：</div>
			<div class="floatleft editor">
				<select name="" id="province" style="height: 28px;width:230px;border: 1px solid #ddd;" onchange="getvalue();";>
	   					<option value="">请选择省份</option>
	            </select>
	            <div style=" color: red; margin-top: -24px; float: right; ">*</div>
			</div>
			<div class="floatleft message">请选择省份！</div>
			<div class="clear"></div>
		</div>
	
		<div class="itempanel">
			<div class="floatleft title">*市、自治州：：</div>
			<div class="floatleft editor">
				<select name="" id="city" style="height: 28px;width:230px;border: 1px solid #ddd;">
	   					<option value="">请选择城市</option>
	            </select>
	            <div style=" color: red; margin-top: -24px; float: right; ">*</div>
			</div>
			<div class="floatleft message">请选择城市！</div>
			<div class="clear"></div>
		</div>
		
 		<div class="itempanel">
			<div class="floatleft title">性别：</div>
			<div class="floatleft editor">
				<select name="sex" id="sex" style="height: 28px;width:230px;border: 1px solid #ddd;" onchange="fistlist()";>
	   					<option value="">请选择性别</option>
						<c:forEach items="${sexlist}" var="list">
							<option <c:if test="${mc.sex==list.id}">selected="selected"</c:if> value="${list.id}">${list.label}</option>
						</c:forEach> 
	            </select>
	            <div style=" color: red; margin-top: -24px; float: right; ">*</div>
			</div>
			<div class="floatleft message">请选择性别！</div>
			<div class="clear"></div>
		</div>
	
		<div class="itempanel">
			<div class="floatleft title">年龄段：</div>
			<div class="floatleft editor" style="width: 189px;">
				<%-- <select name="age" id="age" style="height: 28px;width:230px;border: 1px solid #ddd;" onchange="fistlist()";>
	   					<option value="">请选择年龄段</option>
						<c:forEach items="${agelist}" var="list">
							<option <c:if test="${mc.age==list.id}">selected="selected"</c:if> value="${list.id}">${list.label}</option>
						</c:forEach> 
	            </select> --%>
	            <c:forEach items="${agelist}" var="list">
	            	<input type="checkbox" name="age_list" value="${list.id}"/>${list.label} &nbsp;&nbsp;&nbsp;
	            </c:forEach>
	            <div style=" color: red; margin-top: -24px; float: right; ">*</div>
			</div>
			<div class="floatleft message">请选择年龄段！</div>
			<div class="clear"></div>
		</div> 
	
 		<div class="itempanel">
			<div class="floatleft title">消费观念：</div>
			<div class="floatleft editor" style="width: 130px;">
				<%-- <select name="consumption_idea" id="consumption_idea" style="height: 28px;width:230px;border: 1px solid #ddd;" onchange="fistlist()";>
	   					<option value="">请选择消费观念</option>
						<c:forEach items="${consumption_idea_list}" var="list">
							<option value="${list.id}">${list.label}</option>
						</c:forEach> 
	            </select> --%>
	           <%--  <c:forEach var="num" items="${fn:split(mc.consumptions, ',')}">
                        <c:out value="${num}" /> 
                </c:forEach> --%>
	            
	            <c:forEach items="${consumption_idea_list}" var="list">
	            	<input type="checkbox" name="consumption_idea" value="${list.id}"/>${list.label} &nbsp;&nbsp;&nbsp;
	            </c:forEach>
	            <div style=" color: red; margin-top: -6px; float: right; ">*</div>
			</div>
			<div class="floatleft message">请选择消费观念！</div>
			<div class="clear"></div>
		</div>
	
		<div class="itempanel">
			<div class="floatleft title">消费偏好：</div>
			<div class="floatleft editor" style="width: 195px;">
			<%-- 	<select name="consumer_preference" id="consumer_preference" style="height: 28px;width:230px;border: 1px solid #ddd;" onchange="fistlist()";>
	   					<option value="">请选择消费偏好</option>
						<c:forEach items="${consumer_preference_list}" var="list">
							<option value="${list.id}">${list.label}</option>
						</c:forEach> 
	            </select> --%>
	            
	            <c:forEach items="${consumer_preference_list}" var="list">
	            	<input type="checkbox" name="consumer_preference" value="${list.id}"/>${list.label}
	            </c:forEach>
	            <div style=" color: red; margin-top: -6px; float: right; ">*</div>
			</div>
			<div class="floatleft message">请选择消费偏好！</div>
			<div class="clear"></div>
		</div> 
		
		
		<div class="itempanel">
			<div class="floatleft message" style="color:red;color: red; margin-left: 10%; font-family: 微软雅黑; font-weight: bold;">注：带*均为必填项！</div>
			<div class="clear"></div>
		</div>
		
		<input type="hidden" id="province1" name="province" value="${mc.province }"/> 
		<input type="hidden" id="city1" name="city" value="${mc.city }"/>
		<input type="hidden" id="consumption_idealist" name="consumptions" value="${mc.consumptions }"/>
		<input type="hidden" id="consumer_preferencelist" name="preferences" value="${mc.preferences }"/>
		<input type="hidden" id="agelist" name="age" value="${mc.age }"/>
		<input type="hidden" id="id" name="id" value="${mc.id }"/>
		<input type="hidden" id="userid" name="userid" value="${userid }"/>
		
		<input id="phototype" type="hidden" value=".jpg|.png"/>
		<input id="photosize" type="hidden"  value="1000KB"/>
		<input id="photowidth" type="hidden"  value="2000"/>
		<input id="photoheight" type="hidden"  value="2000"/>
		<div class="actionbar">
		    <input id="submit_btn"  class="greenbutton2" style="margin-left: 55px;width: 97px;" onclick="gotoUrl(1)" type="button" value="保存"/>
		    <input id="cancel_btn" class="greenbutton2" style="margin-left: 29px;" type="button" value="返回" onclick="history.back()">
		</div><br/>
	</div>
 </form>
