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
<script>
//提交查询表单
function submitForm(){
	var keyword=$("#keyword").val();

	var startdate=0;
	var enddate=0;
	if($("#starttime").val()!=null&&$("#starttime").val()!=""&&$("#starttime").val()!=undefined){
		
		startdate = new Date($("#starttime").val());
		$("#starttime1").val(startdate.getTime());
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
</script>
<div class="navigation">当前位置：运行日志&nbsp;>&nbsp;展示列表&nbsp;>&nbsp;<a href="javascript: history.go(-1);">返回</a></div>
<form name="findForm" id="findForm" action="<%=basePath %>log/list" method="get" style="margin-left: 26px;">
	<table style="height:70px">
		<tr>
			<td>关键字:</td>
			<td><input id="keyword" type="text" style="width: 100px;" name="keyword" value="${keyword}" placeholder="请输入关键字查询"></td>
			<td width="60px" style="text-align: right">类型:</td>
			<td>
			<!-- 			日志类型（1601信息，1602异常） -->
				<select name="logtype" id="logtype" style="width: 100px; height: 32px; border-color: rgb(221, 221, 221);">
					<option value="0">全部</option>
					<option value="1601">信息</option>
					<option value="1602">异常</option>
           		</select>
			</td>
		<%-- =============================================================================================================== --%>
			<td width="60px" style="text-align: right">日期:</td>
			<td><input type="text" id="starttime" name="starttime" maxlength="20"  onFocus="WdatePicker({isShowClear:true,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px;"  placeholder="请点击选择时间"/></td>
			<td>至</td>
			<td><input type="text" id="endtime" name="endtime" maxlength="20"  onFocus="WdatePicker({isShowClear:true,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px;"  placeholder="请点击选择时间"/></td>
		<%-- =============================================================================================================== --%>
<%-- 			<input type="hidden" id="pageno" name="pageno" value="${pageno}">	 --%>
			<td><input type="button" class="greenbutton" onclick="javasrcipt:submitForm()" value="查询" style="margin-left: 50px; width: 130px; height: 36px;"></td>
		</tr>
		<input type="hidden" id="starttime1" name="starttime1" value="${starttime}">
		<input type="hidden" id="endtime1" name="endtime1" value="${endtime}">
	</table>
</form>
<table class="list" border="1" bordercolor="#ccc" cellspacing="10" cellpadding="10">
	<tr>
		<th>日期</th>
		<th>摘要</th>
		<th>类型</th>
		<th>操作人</th>
		<th>操作</th>
	</tr>
	<c:forEach items="${list.content}" var="list">
	<tr> 
		<td>${list.timedate}</td>
		<td>${fn:substring(list.content, 0, 30)}...</td>
		<c:if test="${list.logtype == 1601}">
			<td>信息</td>
		</c:if>
		<c:if test="${list.logtype == 1602}">
			<td>异常</td>
		</c:if>
		<td>${list.username}</td>
		
		
		<td>
<%-- 		<%if(checkUserRight.check(101004)){ %> --%>
			<a style="color:#54bc2d;" href="<%=basePath%>log/edit?id=${list.id}">查看详情</a>
<%-- 			<a class="button border-yellow button-little" href="<%=basePath%>foods/delete?id=${list.id}" onclick="{if(confirm('确认删除吗?')){return true;}else return false;}">删除</a> --%>
<%-- 		<%} %> --%>
		</td> 
	</tr>	
	</c:forEach>
</table>
<div class="pagestart">
	<div class="pagebar" style="margin-right: 10px; height: 20px; line-height: 20px;">
		共<span>${list.totalpages}</span>页，每页<span>${list.pagesize}</span>条，当前是第<span>${list.pageno}</span>页
	</div>
	<div class="pageinfo">
		<button
			onclick="gotopage('<%=basePath%>log/list', '1')"
			<c:if test="${list.pageno == 1}"> class="button3"  disabled</c:if>
			<c:if test="${list.pageno > 1}"> class="button3"</c:if>>首页</button>
		<button
			onclick="gotopage('<%=basePath%>log/list', '${list.pageno-1 }')"
			<c:if test="${list.pageno == 1}"> class="button3"  disabled</c:if>
			<c:if test="${list.pageno > 1}"> class="button3"</c:if>>上页</button>
		<button
			onclick="gotopage('<%=basePath%>log/list', '${list.pageno+1 }')"
			<c:if test="${list.pageno == list.totalpages}"> class="button3"  disabled</c:if>
			<c:if test="${list.pageno < list.totalpages}"> class="button3"</c:if>>下页</button>
		<button
			onclick="gotopage('<%=basePath%>log/list', '${list.totalpages }')"
			<c:if test="${list.pageno == list.totalpages}"> class="button3"  disabled</c:if>
			<c:if test="${list.pageno < list.totalpages}"> class="button3"</c:if>>末页</button>
	</div>
	<div class="clear"></div>
</div>
<br/><br/>