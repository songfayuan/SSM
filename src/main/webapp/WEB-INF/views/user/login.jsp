<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
	function doChange(){
		document.getElementById("code").src="${ctx}/validateCodeServlet?"+Math.random();
	}
</script>
<style>

	body
	{
		background: url('../images/loginbg.png');
		background-repeat: no-repeat;
		background-size:100% 100%;
/* 		background-size:auto 100%; */
	}

</style>
<form id="loginForm" name="loginForm" action="${ctx}/user/login" method="post" class="form-horizontal" onsubmit="return checkForm(loginForm)">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
	if(error != null){
%>
	<div class="alert alert-error input-medium controls">
		<button class="close" data-dismiss="alert">×</button>登录失败，请重试.
	</div>
<%
    }
%>
<div class="login-view" style="">
	<div style="height: 70px; width: 100%;height: 100%">
	    <div style="height: 70px; font-size: 18px;font-weight: bold; line-height: 65px;">
<!-- 		   <img src="../images/logo.png" style="height:60px;margin-left:10px;margin-top:2px;float: left;" /> -->
<!-- 		    <div style="font-size:36px;font-weight:bold;color:#333;width:60%;height: 70px;float: left;margin-left:20px;">【游鱼圈】管理后台</div> -->
			<div style="font-size: 36px; font-weight: bold; color: #fff; width: 100%; height: 70px; float: left; text-align: center; margin-top: 11.5%;">『游鱼圈』推广系统管理后台</div>
		</div>
	</div>
	<div class="form" style="">
		<div style="text-align: center; margin-top: 18px; font-size: 18px;font-weight: 600;">
			<img src="../images/logo.png" style="height:100%;" />
		</div>
		
		<div style="background-color: #fff; height: 1.5px; width: 100%; margin-top: 2px;"></div>
		<div class="inner">
			<div class="item">
				<div class="floatleft title" style="">用户名：</div>
				<input class="" type="text" id="username" name="username"  maxlength="20" />
				<div class="clear"></div>
			</div>
			<div class="item">
				<div class="floatleft title" style="">密 <label style="margin-left:9px;">码</label>：</div>
				<input class="" type="password" id="password" name="password"  maxlength="20" />
				<div class="clear"></div>
			</div>
			<div class="item">
				<div class="floatleft title" style="">验证码：</div>
				<input class="floatleft" type="text" id="validcode" name="validcode"  maxlength="4" />
    			<img class="floatleft validcodetext" style="margin-top:2px;" src="<%=basePath %>validateCodeServlet" id="code" onclick="doChange();" />
    			<div class="floatleft validcoderefresh"><a href="javascript:doChange();">看不清</a></div>
				<div class="clear"></div>
			</div>
			<div class="item">
				<div class="floatleft title" style="">权 <label style="margin-left:9px;">限</label>：</div>
				<select name="usertype" id="usertype" style="width:276px;height:32px;border:1px solid #ddd;">
				  <option value="202">客户</option>
				  <option value="203">管理员</option>
				</select>
				<div class="clear"></div>
			</div>
			<div class="item" style="margin-left: -3px;">
				<input id="submit_btn" class="greenbutton loginbutton" style="width:100px;" type="submit" value="登录"/>
				<input id="submit_btn2" class="greenbutton loginbutton" style="width:100px;" type="reset" value="重置"/>
			</div>
	</div>
</div>
</form>

<script type="text/javascript"> 

function checkForm(form){
	var username = document.loginForm.username.value;
	var password = document.loginForm.password.value;
	var validcode = document.loginForm.validcode.value;
	if(username.length==0){
		alert("用户名不能为空");
		document.loginForm.username.focus();
		return false;
	}
	if(password.length==0){
		alert("密码不能为空");
		document.loginForm.password.focus();
		return false;
	}
	if(validcode.length==0){
		alert("验证码不能为空");
		document.loginForm.validcode.focus();
		return false;
	}
	document.loginForm.password.value = md5(password);
}
</script>