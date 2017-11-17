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

<div class="navigation">当前位置：运行日志&nbsp;>&nbsp;日志详情&nbsp;>&nbsp;<a href="javascript: history.go(-1);">返回</a></div>
<table class="list" border="1" bordercolor="#ccc" cellspacing="10" cellpadding="10" style="margin-top: 40px;">
	<tr>
		<th>日志详情</th>
	</tr>
	<tr> 
		<td>${log.content}</td>
	</tr>	
</table>
