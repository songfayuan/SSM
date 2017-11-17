<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
com.songfayuan.ssm.controller.CheckUserRight checkUserRight = new  com.songfayuan.ssm.controller.CheckUserRight(request);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="navigation">当前位置：权限管理&nbsp;>&nbsp;管理员管理&nbsp;>&nbsp;<a href="javascript: history.go(-1);">返回</a></div>
<form name="findForm" id="findForm" action="<%=basePath %>user/adminlist" method="GET">
	<table style="height:70px;margin-left: 27px">
		<tr>
			<td>用户名:</td>
			<td><input id="username" style="width: 200px;" type="text" name="username" value="" placeholder="请输入用户名"></td>
			<td>角色:</td>
			<td>
				<select name="roleid" id="roleid" onchange="changeRoleList()" style="width: 200px; height: 32px; border-color: rgb(221, 221, 221);">
						<option value="1" selected="selected">管理员</option>
						<option value="3">客户</option>
           		</select>
			</td>
 			<%-- <input type="hidden" id="pageno" name="pageno" value="${pageno}"> --%>
 			 <input type="hidden" id="usertype" name="usertype" value=""> 
			<td><input type="button" style="width: 84px; height: 31px;" class="greenbutton" onclick="javasrcipt:submitForm()" value="查询"></td>
		</tr>
	</table>
</form>
<table class="list" border="1" bordercolor="#ccc" cellspacing="10" cellpadding="10">
	<tr>
		<th>用户名</th>
		<th>联系电话</th>
		<th>创建日期</th>
		<th>角色名称</th>
		<th>操作</th>
	</tr>
	<c:forEach items="${userList.content}" var="list">
	<tr> 
		<td>${list.username}</td>
		<td>${list.phone}</td>
		<td>${list.createDate}</td>
		<td>${list.userrole}</td>
		<td>
			<a style="color:#54bc2d;" href="<%=basePath%>user/editadmin?id=${list.id}">编辑</a>
			<a style="color:#54bc2d;" href="<%=basePath%>user/deleteadmin?id=${list.id}" onclick="{if(confirm('确认删除吗?')){return true;}else return false;}">删除</a>
			<a style="color:#54bc2d;" href="<%=basePath%>user/resetpassword?id=${list.id}" onclick="{confirm('重置密码成功，默认为123456')}">重置密码</a>
		</td> 
	</tr>	
	</c:forEach>
</table><br/>
<input type="button" class="greenbutton2" style="width: 123px;margin-left: 30px;" onclick="javasrcipt:goToAdd()" value="添加管理员" style="width: 99px; height: 33px;">
<div class="pagestart">
	<div class="pagebar" style="margin-right: 10px; height: 20px; line-height: 20px;">
		共<span>${userList.totalpages}</span>页，每页<span>${userList.pagesize}</span>条，当前是第<span>${userList.pageno}</span>页
	</div>
	<div class="pageinfo">
		<button
			onclick="gotopage('<%=basePath%>user/adminlist', '1')"
			<c:if test="${userList.pageno == 1}"> class="button3"  disabled</c:if>
			<c:if test="${userList.pageno > 1}"> class="button2"</c:if>>首页</button>
		<button
			onclick="gotopage('<%=basePath%>user/adminlist', '${userList.pageno-1 }')"
			<c:if test="${userList.pageno == 1}"> class="button3"  disabled</c:if>
			<c:if test="${userList.pageno > 1}"> class="button2"</c:if>>上页</button>
		<button
			onclick="gotopage('<%=basePath%>user/adminlist', '${userList.pageno+1 }')"
			<c:if test="${userList.pageno == userList.totalpages}"> class="button3"  disabled</c:if>
			<c:if test="${userList.pageno < userList.totalpages}"> class="button2"</c:if>>下页</button>
		<button
			onclick="gotopage('<%=basePath%>user/adminlist', '${userList.totalpages }')"
			<c:if test="${userList.pageno == userList.totalpages}"> class="button3"  disabled</c:if>
			<c:if test="${userList.pageno < userList.totalpages}"> class="button2"</c:if>>末页</button>
	</div>
	<div class="clear"></div>
</div>
<script>

//跳转到添加页面
function goToAdd(){
	window.location.href="<%=basePath%>user/goadminadd";
}

//提交查询表单
function submitForm(){
	var username=$("#username").val();
	var roleid=$("#roleid").val();
	
	if(username==null || username=="" || username==undefined){
		
		$("#username").val('0');
    }
    if(roleid==null || roleid=="" || roleid==undefined){
    	alert("角色不能为空！");
    	return;
    }

	$('#findForm').submit();
}

var rolevalue=$('#roleid option:selected').text();
if(rolevalue=='客户')
{
	document.getElementById("usertype").value=202;
}else{
	document.getElementById("usertype").value=203;
}

function changeRoleList()
{   
	var rolevalues=$('#roleid option:selected').text();
	if(rolevalues=='客户')
	{
		document.getElementById("usertype").value=202;
	}else{
		document.getElementById("usertype").value=203;
	}
}

</script>