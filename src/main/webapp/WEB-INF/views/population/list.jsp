<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
com.songfayuan.ssm.controller.CheckUserRight checkUserRight = new  com.songfayuan.ssm.controller.CheckUserRight(request);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<script type="text/javascript" src="<%=basePath %>js/My97DatePicker/WdatePicker.js"></script>

<style>
/* ===================================弹框css部分 start by:songfayuan========================================= */
.black_overlay{
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index:1001;
	-moz-opacity: 0.8;
	opacity:.50;
	filter: alpha(opacity=50);
}
.white_content {
    display: none;
    position: absolute;
    top: 35%;
    left: 36%;
    width: 33%;
    border: 2px solid #d3d3d3;
    background-color: white;
    z-index: 1002;
	/* overflow: auto; */
}
.white_content_small {
	display: none;
	position: absolute;
	top: 20%;
	left: 30%;
	width: 40%;
	height: 50%;
	border: 16px solid lightblue;
	background-color: white;
	z-index:1002;
	overflow: auto;
}
/* ===================================弹框css部分 end by:songfayuan========================================= */
</style>
<script>
//提交查询表单
function submitForm(){
	var keyword=$("#keyword").val();

	var startdate=0;
	var enddate=0;
	if($("#starttime").val()!=null&&$("#starttime").val()!=""&&$("#starttime").val()!=undefined){
		
		startdate = new Date($("#starttime").val());
		$("#starttime1").val(startdate.getTime())
	}
	else{
		$("#starttime1").val(0)
	}
	if($("#endtime").val()!=null&&$("#endtime").val()!=""&&$("#endtime").val()!=undefined){
		enddate = new Date($("#endtime").val());
		$("#endtime1").val(enddate.getTime());
		if(enddate-startdate<0){
			alert('时间有误 ,请重新选择!!');
			return;
		}
	}else{
		$("#endtime1").val(0)
	}

	$('#findForm').submit();
}

function goToAdd(){
	var type_name = document.getElementById("type_name").innerText;  //获取div的值
	var label = document.getElementById("label").value;
	
	if(type_name=='一级分类名称：'){
		  var id = 0;
		  if(label==null || label=="" || label==undefined){
		    	alert("一级分类名称不能为空！");
		    	return;
		    }
		  window.location.href = '${ctx}/population/addfirst?id='+id+'&label='+label;
	}
	if(type_name=='二级分类名称：'){
		  var id = document.getElementById("pid").value;
		  if(label==null || label=="" || label==undefined){
		    	alert("二级分类名称不能为空！");
		    	return;
		    }
		  window.location.href = '${ctx}/population/addsecond?id='+id+'&label='+label;
	}
  
	
}

function del(id){
	$.ajax(
		{
			url:'<%=basePath%>population/selectlist',
			type:'GET',
			data:'id='+id,
			success: function(jsonData)
            {
				var dataObj = eval('(' + jsonData + ')');
				var num = dataObj.data.length;
				if(num>0){
					alert('该一级分类含有二级分类，请先删除二级分类！');
					return;
				}else{
					window.location.href="<%=basePath%>population/delete?id="+id;
				}
            }
        }); 
}

//===================================弹框js部分 start by:songfayuan=========================================
//弹出隐藏层
function ShowDiv(show_div,bg_div,pid){
	document.getElementById("pid").value = pid;
	if(pid=='0000'){
		document.getElementById("type_name").innerHTML  = "一级分类名称：";
	}else{
		document.getElementById("type_name").innerHTML  = "二级分类名称：";
	}
	
	var scrollHeight = document.body.scrollHeight; //文档高度
	document.getElementById(bg_div).style.height=scrollHeight+'px';
	
	document.getElementById(show_div).style.display='block';
	document.getElementById(bg_div).style.display='block';
};
//关闭弹出层
function CloseDiv(show_div,bg_div)
{
	document.getElementById("label").value = '';
	document.getElementById(show_div).style.display='none';
	document.getElementById(bg_div).style.display='none';
};
//关闭弹出层
function CloseDiv2()
{
	document.getElementById("MyDiv").style.display='none';
	document.getElementById("fade").style.display='none';
};
//===================================弹框js部分 end by:songfayuan=========================================
</script>

<!--弹出层时背景层DIV---start-->
<div id="fade" class="black_overlay"></div>
<div id="MyDiv" class="white_content">
	<div style="text-align: right; cursor: default; margin-top:10px;margin-bottom:10px;">
		<span style="font-size: 16px; margin-right: 17px; color: #56BE2D; font-weight: 600;cursor:pointer;"  onclick="CloseDiv('MyDiv','fade')">关闭</span>
	</div>
	<div class="itempanel" style="    margin-left: 13%;">
		<div class="floatleft title" id="type_name" style="text-align: left;"></div>
		<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;"><input type="text" id="label" name="label" placeholder="请输入分类名称"/></div>
		<div class="floatleft message"></div>
		<div class="clear"></div>
	</div>
	<input type="hidden" id="pid" name="pid" value=""/>
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3); margin-top: 39px;" width="90%" color=#ddd SIZE=2>
	<div style="margin-bottom: 23px; margin-top: 23px; margin-left: 23%;">
		<input type="button" class="greenbutton2" style="width: 123px;margin-left: 30px;" onclick="javasrcipt:goToAdd();" value="添加" style="width: 123px; margin-left: 20%; ">
		<input type="button" class="greenbutton2" style="width: 123px;margin-left: 30px;" onclick="CloseDiv('MyDiv','fade')" value="取消" style="width: 123px; margin-left: 20%; ">
	</div>
</div>
<!--弹出层时背景层DIV---end-->



<div class="navigation">当前位置：人群标志管理&nbsp;>&nbsp;人群标志列表&nbsp;>&nbsp;<a href="javascript: history.go(-1);">返回</a></div>
<table class="list" border="1" bordercolor="#ccc" cellspacing="10" cellpadding="10" style="margin-top: 40px;">
	<tr>
		<th>一级分类</th>
		<th>操作</th>
	</tr>
	<c:forEach items="${list.content}" var="list">
	<tr> 
		<td>${list.label}</td>
<%-- 		<td>${fn:substring(list.content, 0, 30)}...</td> --%>
		<td>
<%-- 		<%if(checkUserRight.check(101004)){ %> --%>
			<a class="button border-yellow button-little" href="javascript:del(${list.id})" onclick="{if(confirm('确认删除吗?')){return true;}else return false;}">删除</a>
			<a class="button border-green button-little" onclick="javasrcipt:ShowDiv('MyDiv','fade',${list.id} )" >新增二级分类</a>
			<a class="button border-green button-little" href="<%=basePath%>population/secondlist?id=${list.id}">二级分类</a>
<%-- 			<a class="button border-yellow button-little" href="<%=basePath%>foods/delete?id=${list.id}" onclick="{if(confirm('确认删除吗?')){return true;}else return false;}">删除</a> --%>
<%-- 		<%} %> --%>
		</td> 
	</tr>	
	</c:forEach>
</table><br/>
<div style="margin-left: 29px;">
	<input type="hidden" name="idlist" id="idlist"/>
	<input id="daochu" style="width: 127px;" class="greenbutton" type="button" value="新增一级分类"  onclick="javasrcipt:ShowDiv('MyDiv','fade','0000')"/>
	<input id="shanchu" style="width: 80px;" class="greenbutton" type="button" value="删除" onclick="goToUrl2()"/>
</div>
<div class="pagestart">
	<div class="pagebar" style="margin-right: 10px; height: 20px; line-height: 20px;">
		共<span>${list.totalpages}</span>页，每页<span>${list.pagesize}</span>条，当前是第<span>${list.pageno}</span>页
	</div>
	<div class="pageinfo">
		<button
			onclick="gotopage('<%=basePath%>population/list', '1')"
			<c:if test="${list.pageno == 1}"> class="button3"  disabled</c:if>
			<c:if test="${list.pageno > 1}"> class="button3"</c:if>>首页</button>
		<button
			onclick="gotopage('<%=basePath%>population/list', '${list.pageno-1 }')"
			<c:if test="${list.pageno == 1}"> class="button3"  disabled</c:if>
			<c:if test="${list.pageno > 1}"> class="button3"</c:if>>上页</button>
		<button
			onclick="gotopage('<%=basePath%>population/list', '${list.pageno+1 }')"
			<c:if test="${list.pageno == list.totalpages}"> class="button3"  disabled</c:if>
			<c:if test="${list.pageno < list.totalpages}"> class="button3"</c:if>>下页</button>
		<button
			onclick="gotopage('<%=basePath%>population/list', '${list.totalpages }')"
			<c:if test="${list.pageno == list.totalpages}"> class="button3"  disabled</c:if>
			<c:if test="${list.pageno < list.totalpages}"> class="button3"</c:if>>末页</button>
	</div>
	<div class="clear"></div>
</div>

<br/><br/>