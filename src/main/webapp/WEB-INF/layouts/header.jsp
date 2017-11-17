<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div>
    <div style="width:75%;;float:left;">
         <div style="height: 70px; font-size: 18px;font-weight: bold; line-height: 65px;">
         	<div style="width: 15%;background: #34485b;">
		   		<img src="../images/logobg.png" style="height: 44px; margin-left: 44px; margin-top: 12px; float: left;" />
		   	</div>
		    <div style="font-size:20px;font-weight:bold;color:#e6e6e6;width:60%;height: 70px;float: left;margin-left:20px;line-height: 71px;">『游鱼圈』推广系统管理后台</div>
		</div>
    </div>
	<div style="font-weight: bold;float:left;width: 16%;height:70px;line-height:70px;font-size: 18px;color: #e6e6e6;">欢迎您，${user.username }! &nbsp;<label style="color: #f59700;"><c:if test="${user.usertype == 203}">管理员</c:if><c:if test="${user.usertype == 202}">客户</c:if></label></div>
	<div style="float: left;width:9%; margin-top:11px;">
<%-- 		<button class="greybutton" style="width:80px;" onclick="if(window.confirm('确定要退出？')) window.location.href='${ctx}/user/logout';">退出</button> --%>
		<div style="width: 80px; font-size: 18px; font-weight: bold; color: #ff6600; cursor: pointer; margin-top: 7px;" onclick="if(window.confirm('确定要退出？')) window.location.href='${ctx}/user/logout';">『退出』</div>
	</div>
	<div class="clear"></div>
</div>
<div class="spacer"></div>
