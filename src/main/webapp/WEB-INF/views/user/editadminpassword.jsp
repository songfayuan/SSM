<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="navigation">当前位置：密码更改&nbsp;>&nbsp;修改登录密码</div>
<form id="inputForm" name="inputForm" action="${ctx}/user/updateadminpassword" method="post" >
	<div class="detail" style="margin-top: 40px;margin-left: 40px;">
			<div class="itempanel">
				<div class="floatleft title">请输入原密码：</div>
				<div class="floatleft editor"><input type="password" id="oldpassword" name="aldpassword" placeholder="******" maxlength="20"/></div>
				<div class="floatleft message">请输入一个长度为5-20的字符串</div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title">请输入新密码：</div>
				<div class="floatleft editor"><input type="password" id="password" name="password" placeholder="******"  maxlength="20"/></div>
				<div class="floatleft message">请输入一个长度为5-20的字符串</div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title">请再次输入新密码：</div>
				<div class="floatleft editor"><input type="password" id="confirmPassword" name="confirmPassword"  placeholder="******" maxlength="20" /></div>
				<div class="floatleft message">请输入一个长度为5-20的字符串</div>
				<div class="clear"></div>
			</div>
			<input type="hidden" id="id" name="id" value="${user.id}">
			<div class="actionbar">
				<input id="submit_btn" class="greenbutton2"  onclick="gotoUrl()" type="button" value="保存"/>
				<input id="cancel_btn" class="greenbutton2" style="margin-left: 29px;" type="button" value="返回" onclick="history.back()">
			</div>
	</div>
</form>
<script type="text/javascript">		
		function gotoUrl(){
			var oldpassword1='${user.password}';
			var oldpassword = md5(document.inputForm.oldpassword.value);
			var password = document.inputForm.password.value;
			var confirmPassword = document.inputForm.confirmPassword.value;
			if(oldpassword!=oldpassword1){
				alert("原密码错误，请重新输入！");
				document.inputForm.username.focus();
				return false;
			}if(password.length==0){
				alert("新密码不能为空");
				document.inputForm.password.focus();
				return false;
			}if(password.length<5 || password.length>20){
				alert("密码长度必须为5-20");
				document.inputForm.password.focus();
				return false;
			}if(confirmPassword.length==0){
				alert("再次输入密码");
				document.inputForm.confirmPassword.focus();
				return false;
			}if(password!=confirmPassword){
				alert("两次输入的密码不一样！请重新输入");
				document.inputForm.confirmPassword.focus();
				return false;
			} 
		    var user=document.getElementById("inputForm");
		    user.submit();
		}
</script>