<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=basePath %>js/dateControl.js"></script>


<div class="navigation">当前位置：接单人管理&nbsp;>&nbsp;查看接单人信息&nbsp;>&nbsp;<a href="javascript: history.go(-1);">返回</a></div>
<form id="inputForm" name="inputForm" action="${ctx}/user/editsave" method="post"> 
		<div class="detail" style="margin-top: 40px;margin-left: 40px;">
		
		<table class="list" border="1" bordercolor="#ccc" cellspacing="10" cellpadding="10">
			<tr>
				<td style="width: 50%;text-align: left;">用户头像：<img src="../images/zhifulogo.png" style="width:100px;"/></td>
				<td style="width: 50%;text-align: left;">用户注册时间：${userdetail.createDate }</td>
			</tr>
			<tr> 
				<td style="width: 50%;text-align: left;">昵称：${userdetail.name }</td>
				<td style="width: 50%;text-align: left;">openid：${userdetail.username }</td>
			</tr>	
			<tr>
				<td style="width: 50%;text-align: left;">用户手机号：${userdetail.phone }</td>
				<td style="width: 50%;text-align: left;">用户微信号：${userdetail.wechat }</td>
			</tr>
			<tr>
				<td style="width: 50%;text-align: left;">性别：<c:if test="${userdetail.sex==801}">男</c:if> <c:if test="${userdetail.sex==802}">女</c:if></td>
				<td style="width: 50%;text-align: left;">年龄：${userdetail.age }</td>
			</tr>
			<tr>
				<td style="width: 50%;text-align: left;">身高：${userdetail.bodyheight }</td>
				<td style="width: 50%;text-align: left;">体重：${userdetail.bodyweight }</td>
			</tr>
			<tr>
				<td style="width: 50%;text-align: left;">账户余额：${userdetail.balance }</td>
				<td style="width: 50%;text-align: left;">累计收入：${userdetail.totalmoney }</td>
			</tr>
			<tr>
				<td colspan="2" style="width: 50%;text-align: left;">今日收入：${userdetail.todaymoney }</td>
			</tr>
			
		</table>
			
		<input type="hidden" id="id" name="id" value="${userdetail.id}"/>
			
		<div class="">
<!-- 				<input id="submit_btn" class="greenbutton2" style="margin-left: -80px;" onclick="gotoUrl()" type="button" value="保存"/> -->
			<input id="cancel_btn" class="greenbutton" style="margin-left: 30px; margin-top: 10px; padding-left: 21px; padding-right: 21px;" type="button" value="返回" onclick="window.location.href='javascript: history.go(-1);'">
		</div>
	</div>
</form>
		
<script type="text/javascript">
		
</script>