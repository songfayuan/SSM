<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
com.youyu.admin.web.CheckUserRight checkUserRight = new  com.youyu.admin.web.CheckUserRight(request);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<script type="text/javascript" src="<%=basePath %>js/My97DatePicker/WdatePicker.js"></script>
<script>
//提交查询表单
function submitForm(){
	var title=$("#title").val();

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

function publish(content,id){
// 	alert(content);
	if(content==null || content=="" || content==undefined){
		alert("文章内容为空，请先编辑文章内容再发布！");
		return;
	}else{
		if(confirm('确认发布吗?')){
// 			return true;
			window.location.href="<%=basePath %>content/publish?id="+id;
		}else return false;
	}
}

</script>
<div class="navigation">当前位置：（管理员）订单管理&nbsp;>&nbsp;订单详情&nbsp;>&nbsp;<a href="javascript: history.go(-1);">返回</a></div>
<form name="findForm" id="findForm" action="<%=basePath %>content/adminfindcontentinfo" method="post" style="margin-left: 26px;">
	<table style="height:70px">
		<tr>
			<td>标题名:</td>
			<td><input id="title" type="text" style="width: 139px;" name="title" value="${title}" placeholder="请输入标题关键字查询"></td>
		<%-- =============================================================================================================== --%>
			<td width="60px" style="text-align: right">时间段:</td>
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
		<th>序号</th>
		<th>标题</th>
		<th>发布者</th>
		<th>时间段</th>
		<th>总价</th>
		<th>CPM单价</th>
		<th>CPC单价</th>
		<th>CPM</th>
		<th>CPC</th>
		<th>审核状态</th>
<!-- 		<th>进行状态</th> -->
		<th style="width: 336px;">操作</th>
	</tr>
	<c:if test="${contentList.size()<=0}">
		<td colspan="11" style="height: 100px;">该条件搜索下为空，请更换条件重试！<a class="greenbutton" href="javascript: history.go(-1);">返回</a></td>
	</c:if>
	<c:forEach items="${contentList}" var="clist" varStatus="status">
	<tr> 
		<td>${(pageno-1)*10+status.index+1}</td>
<%-- 		<td>${fn:substring(list.content, 0, 30)}...</td> --%>
		<td>${clist.title}</td>
		<td style="color: #31a3ff; font-weight: bold;">${clist.username}</td>
		<td>${clist.startdate} 至 ${clist.enddate }</td>
		<td>${clist.totalprice}</td>
		<td>${clist.cpmprice}</td>
		<td>${clist.cpcprice}</td>
		<td>${clist.cpm}</td>
		<td>${clist.cpc}</td>

		<c:if test="${clist.checkstatus == 303}">
			<c:if test="${clist.proceedstatus == 403}">
				<td style="color: #31a3ff;">进行中</td>
			</c:if>
		</c:if>
		<c:if test="${clist.checkstatus == 303}">
			<c:if test="${clist.proceedstatus == 404}">
				<td>已结束</td>
			</c:if>
		</c:if>
		<c:if test="${clist.checkstatus == 303}">
			<c:if test="${clist.proceedstatus == 406}">
				<td>待发布</td>
			</c:if>
		</c:if>
		
		<td>
<%-- 		<%if(checkUserRight.check(101004)){ %> --%>
			
<!-- 			审核中-审核中 -->
			<c:if test="${clist.checkstatus == 303}">
				<a class="button border-green button-little" href="<%=basePath%>content/adminshowdetail?id=${clist.id}">订单详情</a>
				<a class="button border-green button-little" href="<%=basePath%>orderdetail/list?contentid=${clist.id}">接单详情</a>
<%-- 				<a class="button border-green button-little" href="<%=basePath%>content/admin_edit?id=${clist.id}">统计</a> --%>
					
				<c:if test="${clist.proceedstatus == 403}">
					<a class="button border-yellow button-little" href="<%=basePath%>content/adminfinish?id=${clist.id}" onclick="{if(confirm('确认结束吗?')){return true;}else return false;}">结束</a>
				</c:if>
				<c:if test="${clist.proceedstatus == 404}">
<%-- 					<a class="button border-green button-little" href="<%=basePath%>content/admin_edit?id=${clist.id}">查看</a> --%>
				</c:if>
				<c:if test="${clist.proceedstatus == 406}">
					<a class="button border-other button-little" href="<%=basePath%>content/publish?id=${clist.id}">发布</a>
				</c:if>
					
<%-- 					<button class="button border-sfy button-little" onclick="publish('${clist.articleContents}',${clist.id});">订单详情</button> --%>
					
<%-- 					<a class="button border-other button-little" href="<%=basePath%>content/publish?id=${clist.id}" onclick="{if(confirm('确认发布吗?')){return true;}else return false;}">发布</a> --%>
<%-- 					<a class="button border-yellow button-little" href="<%=basePath%>content/delete?id=${clist.id}" onclick="{if(confirm('确认驳回吗?')){return true;}else return false;}">驳回</a> --%>
			</c:if>
			
<!-- 			未通过-审核被驳回 -->
<%-- 			<c:if test="${clist.checkstatus == 303}"> --%>
<%-- 					<a class="button border-yellow button-little" href="<%=basePath%>content/delete?id=${clist.id}" onclick="{if(confirm('确认删除吗?')){return true;}else return false;}">删除</a> --%>
<%-- 					<a class="button border-green button-little" href="<%=basePath%>content/admin_edit?id=${clist.id}">编辑</a> --%>
<%-- 					<a class="button border-other button-little" href="<%=basePath%>content/audit?id=${clist.id}" onclick="{if(confirm('确认发起审核吗?')){return true;}else return false;}">发起审核</a> --%>
<%-- 			</c:if> --%>
			
			
<%-- 		<%} %> --%>
		</td> 
	</tr>	
	</c:forEach>
</table>
<div class="pagestart">
	<div class="pagebar">
		共<span>${totalpages}</span>页，每页<span>${pagesize}</span>条，当前是第<span>${pageno}</span>页
	</div>
	<div class="pageinfo">
		<button onclick="gotoForm('${ctx}/',1)"
			<c:if test="${pageno == 1}"> class="button3"  disabled</c:if>
			<c:if test="${pageno > 1}"> class="button3"</c:if>>首页</button>
		<button onclick="gotoForm('${ctx}/',${pageno-1 })"
			<c:if test="${pageno == 1}"> class="button3"  disabled</c:if>
			<c:if test="${pageno > 1}"> class="button3"</c:if>>上页</button>
		<button onclick="gotoForm('${ctx}/',${pageno+1 })"
			<c:if test="${pageno == totalpages}"> class="button3"  disabled</c:if>
			<c:if test="${pageno < totalpages}"> class="button3"</c:if>>下页</button>
		<button onclick="gotoForm('${ctx}/',${totalpages })"
			<c:if test="${pageno == totalpages}"> class="button3"  disabled</c:if>
			<c:if test="${pageno < totalpages}"> class="button3"</c:if>>末页</button>
	</div> 
</div>
<br/><br/>