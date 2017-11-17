<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			    var province2 = "${content.province }";
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
				    var city2 = "${content.city }";
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

$(document).ready(function()
{
	$("#uploadimgs2").change(function()
	   {
		//创建FormData对象
		var data = new FormData();
	       //为FormData对象添加数据
		$.each($('#uploadimgs2')[0].files, function(i, file) 
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
					$('#img2').val(jsonData.data);
					$('#topimg2').attr('src', jsonData.data);
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
	
	var title = $("#title").val();
	var sex = $("#sex").val();
	var age = $("#age").val();
	var consumption_idea = $("#consumption_idea").val();
	var consumer_preference = $("#consumer_preference").val();
	
	var province=document.getElementById("province");
	var provincename=province.options[province.options.selectedIndex].text;
// 	alert(provincename);
	$("#province1").val(provincename);
	
	if(provincename==null || provincename=="" || provincename==undefined){
		var city=document.getElementById("city");
		var cityname=city.options[city.options.selectedIndex].text;
//	 	alert(cityname);
		$("#city1").val(cityname);
	}

	var headimg = $("#img").val();
	var headimgurl = $("#headimgurl").val();
	var bottomimg = $("#img2").val();
	var bottomimgurl = $("#bottomimgurl").val();
	var starttime = $("#starttime").val();
	var endtime = $("#endtime").val();
	var totalprice = $("#totalprice").val();
	var cpmprice = $("#cpmprice").val();
	var cpcprice = $("#cpcprice").val();
	
	
    if(title==null || title=="" || title==undefined){
    	alert("文章标题不能为空！");
    	return;
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
    if(provincename==null || provincename=="" || provincename==undefined){
    	alert("省份、市、自治州不能为空！");
    	return;
    }
    if(headimg==null || headimg=="" || headimg==undefined){
    	alert("头部广告图片不能为空！");
    	return;
    }
    if(headimgurl==null || headimgurl=="" || headimgurl==undefined){
    	alert("头部广告链接不能为空！");
    	return;
    }
    if(bottomimg==null || bottomimg=="" || bottomimg==undefined){
    	alert("底部广告图片不能为空！");
    	return;
    }
    if(bottomimgurl==null || bottomimgurl=="" || bottomimgurl==undefined){
    	alert("底部广告链接不能为空！");
    	return;
    }
    if(starttime==null || starttime=="" || starttime==undefined){
    	alert("开始时间不能为空！");
    	return;
    }
    if(endtime==null || endtime=="" || endtime==undefined){
    	alert("结束不能为空！");
    	return;
    }
    if(totalprice==null || totalprice=="" || totalprice==undefined){
    	alert("推广总价不能为空！");
    	return;
    }
    if(cpmprice==null || cpmprice=="" || cpmprice==undefined){
    	alert("CPM单价不能为空！");
    	return;
    }
    if(cpcprice==null || cpcprice=="" || cpcprice==undefined){
    	alert("CPC单价不能为空！");
    	return;
    }
    
	var startdate=0;
	var enddate=0;
	if($("#starttime").val()!=null&&$("#starttime").val()!=""&&$("#starttime").val()!=undefined){
		startdate = new Date($("#starttime").val());
		$("#starttime1").val(startdate.getTime());
	}else{
		$("#starttime1").val(0);
	}
	if($("#endtime").val()!=null&&$("#endtime").val()!=""&&$("#endtime").val()!=undefined){
		enddate = new Date($("#endtime").val());
		$("#endtime1").val(enddate.getTime());
	}else{
		$("#endtime1").val(0);
	}
	
	if(state==1){
		var activity=document.getElementById("content");
		activity.action='<%=basePath%>content/add';
	   	activity.submit();
	}
	if(state==2){
		var activity=document.getElementById("content");
		activity.action='<%=basePath%>content/save';
	   	activity.submit();
	}

}

function getSecondLabel(id){
	var index = document.getElementById(id+"_label").options.length;
	if(index == 1){
		$.ajax(
				{
					url:'<%=basePath%>content/secondlist',
					type:'GET',
					data:'id='+id,
					success: function(jsonData)
			           {
						var dataObj = eval('(' + jsonData + ')');
						console.log(dataObj);
						var data = dataObj.data;
						document.getElementById(id+"_label").innerHTML = "";
						var html='';
						for(var i=0;i<data.length;i++)
						{
							document.getElementById(id+"_label").options.add(new Option(data[i].label, data[i].id));
						}
			           }
			       });
	}
}

</script>

<div class="navigation">当前位置：订单管理&nbsp;>&nbsp;订单发布&nbsp;>&nbsp;<a href="javascript: history.go(-1);">返回</a></div>
  <!--动态内容-->

 <form  method="post" action="#" id="content"  style="margin-top: 40px;">
	<div class="detail">
				
		<div class="itempanel">
			<div class="floatleft title">订单标题：</div>
			<div class="floatleft editor"><input type="text" id="title" name="title" value="${content.title }" placeholder="请输入订单标题..." /><div style=" color: red; margin-top: 5px; float: right; ">*</div></div>
			<div class="floatleft message">请输入订单标题！</div>
			<div class="clear"></div>
		</div>	
		
<%-- 	<c:forEach items="${list}" var="list">
		<c:if test="${list.pid == 0 }">
			<div class="itempanel">
				<div class="floatleft title">${list.label }：</div>
				<div class="floatleft editor">
					<select name="sex" id="${list.id }_label" style="height: 28px;width:230px;border: 1px solid #ddd;"  onclick="getSecondLabel(${list.id});";>
		   					<option value="">请选择${list.label }</option>
								<option value="${list.id}">${list.label}</option>
		            </select>
		            <div style=" color: red; margin-top: -24px; float: right; ">*</div>
				</div>
				<div class="floatleft message">请选择${list.label }！</div>
				<div class="clear"></div>
			</div>
		</c:if>
	</c:forEach>  --%>
	
 		<div class="itempanel">
			<div class="floatleft title">性别：</div>
			<div class="floatleft editor">
				<select name="sex" id="sex" style="height: 28px;width:230px;border: 1px solid #ddd;" onchange="fistlist()";>
	   					<option value="">请选择性别</option>
						<c:forEach items="${sexlist}" var="list">
							<option  <c:if test="${content.sex==list.id}"> selected="selected" </c:if> value="${list.id}">${list.label}</option>
						</c:forEach> 
	            </select>
	            <div style=" color: red; margin-top: -24px; float: right; ">*</div>
			</div>
			<div class="floatleft message">请选择性别！</div>
			<div class="clear"></div>
		</div>
	
		<div class="itempanel">
			<div class="floatleft title">年龄段：</div>
			<div class="floatleft editor">
				<select name="age" id="age" style="height: 28px;width:230px;border: 1px solid #ddd;" onchange="fistlist()";>
	   					<option value="">请选择年龄段</option>
						<c:forEach items="${agelist}" var="list">
							<option  <c:if test="${content.age==list.id}"> selected="selected" </c:if> value="${list.id}">${list.label}</option>
						</c:forEach> 
	            </select>
	            <div style=" color: red; margin-top: -24px; float: right; ">*</div>
			</div>
			<div class="floatleft message">请选择年龄段！</div>
			<div class="clear"></div>
		</div> 
	
 		<div class="itempanel">
			<div class="floatleft title">消费观念：</div>
			<div class="floatleft editor">
				<select name="consumption_idea" id="consumption_idea" style="height: 28px;width:230px;border: 1px solid #ddd;" onchange="fistlist()";>
	   					<option value="">请选择消费观念</option>
						<c:forEach items="${consumption_idea_list}" var="list">
							<option  <c:if test="${content.consumption_idea==list.id}"> selected="selected" </c:if> value="${list.id}">${list.label}</option>
						</c:forEach> 
	            </select>
	            <div style=" color: red; margin-top: -24px; float: right; ">*</div>
			</div>
			<div class="floatleft message">请选择消费观念！</div>
			<div class="clear"></div>
		</div>
	
		<div class="itempanel">
			<div class="floatleft title">消费偏好：</div>
			<div class="floatleft editor">
				<select name="consumer_preference" id="consumer_preference" style="height: 28px;width:230px;border: 1px solid #ddd;" onchange="fistlist()";>
	   					<option value="">请选择消费偏好</option>
						<c:forEach items="${consumer_preference_list}" var="list">
							<option  <c:if test="${content.consumer_preference==list.id}"> selected="selected" </c:if> value="${list.id}">${list.label}</option>
						</c:forEach> 
	            </select>
	            <div style=" color: red; margin-top: -24px; float: right; ">*</div>
			</div>
			<div class="floatleft message">请选择消费偏好！</div>
			<div class="clear"></div>
		</div> 
		
			
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
			<div class="floatleft title">头部广告图：</div>
			<div class="floatleft editor">
				<input type="hidden" name="headimg" id="img"/><div style=" color: red; margin-top: 5px; float: right; ">*</div>
				<input type="file" id="uploadimgs" name="uploadimgs" />
			</div>
			<div class="floatleft message" style="width: 100%;margin-left: 7%;">图片尺寸不超过2000px*2000px，支持jpg和png格式，大小不超过1000K，请尽量上传正方形图片以确保显示效果。</div>
			<div class="clear"></div>
			<div><img src="${content.headimg }" style="width: 120px;height: 120px;margin-left:174px;" id="topimg"/></div>
		</div>	
			
		<div class="itempanel">
			<div class="floatleft title">广告链接：</div>
			<div class="floatleft editor"><input type="text" id="headimgurl" name="headimgurl" value="${content.headimgurl }" placeholder='请输入正确的广告链接...'/><div style=" color: red; margin-top: 5px; float: right; ">*</div></div>
			<div class="floatleft message">请输入正确的广告链接！</div>
			<div class="clear"></div>
		</div>
		
		<div class="itempanel">
			<div class="floatleft title">底部广告图：</div>
			<div class="floatleft editor">
				<input type="hidden" name="bottomimg" id="img2"/><div style=" color: red; margin-top: 5px; float: right; ">*</div>
				<input type="file" id="uploadimgs2" name="uploadimgs2" />
			</div>
			<div class="floatleft message" style="width: 100%;margin-left: 7%;">图片尺寸不超过2000px*2000px，支持jpg和png格式，大小不超过1000K，请尽量上传正方形图片以确保显示效果。</div>
			<div class="clear"></div>
			<div><img src="${content.bottomimg }" style="width: 120px;height: 120px;margin-left:174px;" id="topimg2"/></div>
		</div>	
		
		<div class="itempanel">
			<div class="floatleft title">广告链接：</div>
			<div class="floatleft editor"><input type="text" id="bottomimgurl" name="bottomimgurl" value="${content.bottomimgurl }" placeholder="请输入广告链接..."/><div style=" color: red; margin-top: 5px; float: right; ">*</div></div>
			<div class="floatleft message">请在此输入广告链接！</div>
			<div class="clear"></div>
		</div>
		
		<div class="itempanel">
			<div class="floatleft title">有效时间：</div>
			<div class="floatleft editor">
				<input type="text" id="starttime" maxlength="20" value="${content.startdate }" style="width: 180px;" onFocus="WdatePicker({isShowClear:true,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"   placeholder="请点击选择时间"/>
				至
				<input type="text" id="endtime" maxlength="20" value="${content.enddate }" style="width: 180px;" onFocus="WdatePicker({isShowClear:true,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"    placeholder="请点击选择时间"/>
				<div style=" color: red; margin-top: 5px; float: right; ">*</div>
			</div>
			<div class="floatleft message">请在此选择有效时间！</div>
			<div class="clear"></div>
		</div>
		
		<div class="itempanel">
			<div class="floatleft title">推广总价：</div>
			<div class="floatleft editor"><input type="number" id="totalprice" name="totalprice" value="${content.totalprice }" placeholder="请输入推广总价"/><div style=" color: red; margin-top: 5px; float: right; ">*</div></div>
			<div class="floatleft message">请在此输入推广总价!</div>
			<div class="clear"></div>
		</div>
		
		<div class="itempanel">
			<div class="floatleft title">CPM单价：</div>
			<div class="floatleft editor"><input type="number" id="cpmprice" name="cpmprice" value="${content.cpmprice }" placeholder="请输入CPM单价"/><div style=" color: red; margin-top: 5px; float: right; ">*</div></div>
			<div class="floatleft message">请在此输入CPM单价！</div>
			<div class="clear"></div>
		</div>
		
		<div class="itempanel">
			<div class="floatleft title">CPC单价：</div>
			<div class="floatleft editor"><input type="number" id="cpcprice" name="cpcprice" value="${content.cpcprice }" placeholder="请输入CPC单价"/><div style=" color: red; margin-top: 5px; float: right; ">*</div></div>
			<div class="floatleft message">请在此输入CPC单价！</div>
			<div class="clear"></div>
		</div>
		
		
<!-- 		<div class="itempanel">
			<div class="floatleft title">忌食人群：</div>
			<div class="floatleft editor" style="color: #666666; line-height: 0px;">
			    <input name="medicalhistory" id="" type="radio" value="601,602" />以上两者
			    <input name="medicalhistory"  type="radio" value="0" checked="checked" />无
			<div style=" color: red; float: right; "></div></div>
			<div class="floatleft message">请在此勾选忌食人群！</div>
			<div class="clear"></div>
		</div> -->
		
		<div class="itempanel">
			<div class="floatleft message" style="color:red;color: red; margin-left: 10%; font-family: 微软雅黑; font-weight: bold;">注：带*均为必填项！</div>
			<div class="clear"></div>
		</div>
		
		<input type="hidden" id="cpm" name="cpm" value="${content.cpm }"/> <!-- cpm数-->
		<input type="hidden" id="cpc" name="cpc" value="${content.cpc }"/> <!-- cpc数-->
		
		<input type="hidden" id="province1" name="province" value="${content.province }"/> 
		<input type="hidden" id="city1" name="city" value="${content.city }"/>
		
		<input type="hidden" id="id" name="id" value="${content.id }"/>
		
		<input type="hidden" id="article_title" name="article_title" value="${content.articleTitle }"/>
		<input type="hidden" id="article_contents" name="article_contents" value="${content.articleContents }"/>
		<input type="hidden" id="checkstatus" name="checkstatus" value="${content.checkstatus }"/>
		<input type="hidden" id="proceedstatus" name="proceedstatus" value="${content.proceedstatus }"/>
		<input type="hidden" id="userid" name="userid" value="${content.userid }"/>
		<input type="hidden" id="article_userid" name="article_userid" value="${content.articleUserid }"/>
		<input type="hidden" id="createtime" name="createtime" value="${content.createtime }"/>
		<input type="hidden" id="edittime" name="edittime" value="${content.edittime }"/>
		
		<input type="hidden" id="starttime1" name="starttime1" value="">
		<input type="hidden" id="endtime1" name="endtime1" value="">
		
		<input id="phototype" type="hidden" value=".jpg|.png"/>
		<input id="photosize" type="hidden"  value="1000KB"/>
		<input id="photowidth" type="hidden"  value="2000"/>
		<input id="photoheight" type="hidden"  value="2000"/>
		<div class="actionbar">
<!-- 		    <input id="submit_btn"  class="greenbutton2" style="margin-left: 55px;width: 97px;" onclick="gotoUrl(1)" type="button" value="提交审核"/> -->
<!-- 		    <input id="submit_btn"  class="greenbutton2" style="margin-left: 29px; width: 129px;" onclick="gotoUrl(2)" type="button" value="保存到素材库"/> -->
		    <input id="cancel_btn" class="greenbutton2" style="margin-left: 29px;" type="button" value="返回" onclick="history.back()">
		</div><br/>
	</div>
 </form>
 <script type="text/javascript">
 //验证食物名称是否相同
 function selectSame()
 {
 	
	var foodname=document.getElementById("name").value;
 	foodname.replace(/\s/g, "");
 	$.ajax(
 	{
 		url:'<%=basePath%>foods/validateFoodname',
 		type:'POST',
 		data:{foodname:foodname.replace(/(^\s*)|(\s*$)/g,'')},
 		success: function(data)
         {
 				var jsonData = eval('(' + decodeURIComponent(data) + ')');
 				if(jsonData.data.length>0){
 					alert('食物名称已存在，请重新输入！！！');
 					document.getElementById("name").value='';
 					return;
 				}
         }
 	});
 }
</script>
