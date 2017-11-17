<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
com.thinker.jkzp.management.web.CheckUserRight checkUserRight = new  com.thinker.jkzp.management.web.CheckUserRight(request);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="<%=basePath %>js/My97DatePicker/WdatePicker.js"></script>
<script>
/* var starttimedata = '${starttime}';
var endtimedata = '${endtime}';

if(starttimedata>0){
	$("#starttime1").val(starttimedata);
	var st = formatDate(parseInt(starttimedata));
// 	alert(st);  
// 	document.getElementById("starttime").value=st;
	$("#starttime").val(st);
}
if(endtimedata>0){
	$("#endtime1").val(endtimedata);
	var et = formatDate(parseInt(endtimedata));
// 	alert(et);
	$("#endtime").val(et);
}
//将时间戳转换成时间
function   formatDate(now){
	var sdata = new Date(now)
    var year=sdata.getFullYear(); 
    var   month=sdata.getMonth()+1;     
    var   date=sdata.getDate();     
    var   hour=sdata.getHours();     
    var   minute=sdata.getMinutes();     
    var   second=sdata.getSeconds();  
    return   year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second;     
} 
 */
//提交查询表单
function submitForm(){
	var startage=$("#startage").val();
	var endage=$("#endage").val();
	
	//=============判断输入的年龄======================
	if(startage != null && startage != "" && startage != undefined){
		if(endage != null && endage != "" && endage != undefined){
			if(endage-startage<0){
				alert('结束年龄必须大于开始年龄，请重新输入!!');
				return;
			}
		}else{
			alert('结束年龄不能为空！');
			return;
		}
	}else{
		alert('开始年龄不能为空！');
		return;
	}

	var startdate=0;
	var enddate=0;
	if($("#starttime").val()!=null&&$("#starttime").val()!=""&&$("#starttime").val()!=undefined){
		startdate = new Date($("#starttime").val());
		$("#starttime1").val(startdate.getTime())
	}else{
		alert('开始时间不能为空！');
		return;
	}
	if($("#endtime").val()!=null&&$("#endtime").val()!=""&&$("#endtime").val()!=undefined){
		enddate = new Date($("#endtime").val());
		$("#endtime1").val(enddate.getTime());
		if(enddate-startdate<0){
			alert('时间有误 ,请重新选择!!');
			return;
		}
	}else{
		alert('结束时间不能为空！');
		return;
	}
	
	$('#findForm').submit();
}

//分页显示
function gotoForm(url,pageno)
{   
	document.getElementById("pageno").value=pageno;
	$('#findForm').submit();
}
</script>
<style>
<!--
table {
	width: 100%;
	text-align: left;
	border-collapse: collapse;
	border-spacing: 1;
	border-spacing: 0;
}

table td {
	word-break: break-all;
	word-wrap: break-word;
	border-right: 1px solid #E7E5E5;
	border-bottom: 1px solid #E7E5E5;
/* 	font: 500 14px Arial; */
	color: #666666;
	font-size: 16px;
/*     font-family: 微软雅黑; */
}
-->
</style>
<div class="navigation">当前位置：客户管理&nbsp;>&nbsp;客户列表&nbsp;>&nbsp;<a href="javascript: history.go(-1);">返回</a></div>
<form name="findForm" id="findForm" action="<%=basePath %>user/finduserinfo" method="post" style="margin-top: 40px;">
	<table class="table_border">
		<tr>
			<td class="td_1">用 户 名:</td>
			<td class="td_2"><input id="username" type="text" name="username" style="width: 346px;" value="${username}" placeholder="请输入手机号"></td>
			<td class="td_2">性  &nbsp; 别:</td>
			<td class="td_2">
				<select name="sex" id="sex" style="width: 165px;height: 28px; border-color: rgb(221, 221, 221);">
					<option value="800">全部</option>
					<option value="801">男</option>
					<option value="802">女</option>
           		</select>
			</td>
		</tr>
		<tr>
			<td class="td_1">注册时间:</td>
			<td class="td_2">
				<input type="text" id="starttime" name="starttime" maxlength="20" style="width: 161px;" onFocus="WdatePicker({isShowClear:true,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"   placeholder="请点击选择时间"/>
				至
				<input type="text" id="endtime" name="endtime" maxlength="20" style="width: 161px;" onFocus="WdatePicker({isShowClear:true,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"    placeholder="请点击选择时间"/>
			</td>
<%-- 			<input type="hidden" id="pageno" name="pageno" value="${pageno}">	 --%>
			<td class="td_2">慢  &nbsp; 病:</td><!-- 病史（是否糖尿病）（是601，否0） -->
			<td class="td_2">
				<select name="medicalhistory" id="medicalhistory" style="width: 165px;height: 28px; border-color: rgb(221, 221, 221);">
					<option value="0">无</option>
					<option value="601">糖尿病</option>
           		</select>
			</td>
		</tr>
		<tr>
			<td class="td_1">年  &nbsp; 龄:</td>
			<td class="td_2"><input id="startage" type="number" style="width: 161px;" min="0" max="200" value="1" name="startage" style="width: 200px;" value="${startage}" placeholder="请输入开始年龄">
			至
			<input id="endage" type="number" style="width: 161px;" min="0" max="200" value="100" name="endage" style="width: 200px;" value="${endage}" placeholder="请输入结束年龄"></td>
			<td class="td_2">所属人群:</td>
			<td class="td_2">
				<select name="population" id="population" style="width: 165px;height: 28px; border-color: rgb(221, 221, 221);">
					<option value="400">全部</option>
					<option value="401">成人</option>
					<option value="402">儿童</option>
					<option value="403">孕妇</option>
           		</select>
			</td>
		</tr>
		<tr>
			<td class="td_1">营 养 师:</td>
			<td class="td_2">
				<select name="dietitianid" id="dietitianid" style="width: 165px;height: 28px; border-color: rgb(221, 221, 221);">
					<option value="10086">全部</option>
					<option value="0">待完成中...</option>
					<option value="0">待完成中...</option>
					<option value="0">待完成中...</option>
           		</select>
			</td>
			<td colspan="2"><input type="button" class="greenbutton" onclick="javasrcipt:submitForm()" value="搜&nbsp;&nbsp;&nbsp;索" style="width: 85px;margin-left: 235px; height: 36px;"></td>
		</tr>
		<tr>
		
		<input type="hidden" id="starttime1" name="starttime1" value="${starttime}">
		<input type="hidden" id="endtime1" name="endtime1" value="${endtime}">
	</table><br/>
</form>
<table class="list" border="1" bordercolor="#ccc" cellspacing="10" cellpadding="10">
	<tr>
		<th>序号</th>
		<th>手机号</th>
		<th>性别</th>
		<th>年龄</th>
		<th>所属人群</th>
		<th>慢病</th>
		<th>注册时间</th>
		<th>营养师</th>
		<th>操作</th>
	</tr>
	<c:if test="${userList.size()<=0}">
		<tr> 
			<td colspan="9" style="height: 121px;">查询结果为空！<input id="cancel_btn" class="button1" type="button" value="返回" onclick="history.back()"></td>
		</tr>
	</c:if>
	<c:forEach items="${userList}" var="list">
	<tr> 
		<td>${list.id}</td>
		<td>${list.username}</td>
		<td>
		<c:if test="${list.sex==802 }">
			女
		</c:if>
		<c:if test="${list.sex==801 }">
			男
		</c:if>
		</td>
		<td>${list.age}</td>
		<c:if test="${list.population==401}">
			<td>成人</td>
		</c:if>
		<c:if test="${list.population==402}">
			<td>儿童</td>
		</c:if>
		<c:if test="${list.population==403}">
			<td>孕妇</td>
		</c:if>
		<c:if test="${list.medicalhistory==601}">
			<td>糖尿病</td>
		</c:if>
		<c:if test="${list.medicalhistory==602}">
			<td>否</td>
		</c:if>
		
		<td>${list.createDate}</td>
		<c:if test="${list.usertype==201}"> 
			<td>用户</td>
		</c:if>
		<c:if test="${list.usertype==202}"> 
			<td>营养师</td>
		</c:if>
		<td>
<%-- 		<%if(checkUserRight.check(101004)){ %> --%>
			<a style="color:#54bc2d;" href="<%=basePath%>user/inspect?id=${list.id}">查看详情</a>
<%-- 		<%} %> --%>
		</td> 
	</tr>	
	</c:forEach>
</table>
<!-- <div class="pageinfo"> -->
<%-- 	共<span>${totalpages}</span>页，每页<span>${pagesize}</span>条，当前是第<span>${pageno}</span>页 --%>
<!-- </div> -->
<!-- <div class="pagebar"> -->
<%-- 	<button onclick="gotoForm('${ctx}/returngoods/returngoodssearch',1)"<c:if test="${pageno == 1}"> class="button3"  disabled</c:if><c:if test="${pageno > 1}"> class="button2"</c:if>>首页</button> --%>
<%-- 	<button onclick="gotoForm('${ctx}/returngoods/returngoodssearch',${pageno-1 })"<c:if test="${pageno == 1}"> class="button3"  disabled</c:if><c:if test="${pageno > 1}"> class="button2"</c:if>>上页</button> --%>
<%-- 	<button onclick="gotoForm('${ctx}/returngoods/returngoodssearch',${pageno+1 })"<c:if test="${pageno == totalpages}"> class="button3"  disabled</c:if><c:if test="${pageno < totalpages}"> class="button2"</c:if>>下页</button> --%>
<%-- 	<button onclick="gotoForm('${ctx}/returngoods/returngoodssearch',${totalpages })"<c:if test="${pageno == totalpages}"> class="button3"  disabled</c:if><c:if test="${pageno < totalpages}"> class="button2"</c:if>>末页</button> --%>
<!-- </div>  -->
