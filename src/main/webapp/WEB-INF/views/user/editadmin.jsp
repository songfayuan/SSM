<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=basePath %>js/My97DatePicker/WdatePicker.js"></script>
<script>
	function checkusername(input)
	{
		$.ajax(
		{
			url:'<%=basePath%>user/checkusername?username=' + encodeURIComponent(input.value),
			type:'GET',
			success:function(data)
            {
				if(data=="yes"){
				}
				if(data=="no"){
					alert("用户名已被使用！");
					document.inputForm.username.value="";
				}
            }
        });
	}
</script>
<div class="navigation">当前位置：权限管理&nbsp;>&nbsp;管理员管理&nbsp;>&nbsp;编辑管理员&nbsp;>&nbsp;<a href="javascript: history.go(-1);">返回</a></div>
	<form id="inputForm" name="inputForm" action="${ctx}/user/saveedit" method="post" onsubmit="return checkForm(inputForm)"  style="margin-top: 40px;">
		<div class="detail">
			<div class="itempanel">
				<div class="floatleft title">用户名：</div>
				<div class="floatleft editor"><input type="text" id="username" name="username" value="${admin.username }" maxlength="20" placeholder="admin" onblur="checkusername(this)"/><div style=" color: red; margin-top: -7px; float: right; ">*</div></div>
				<div class="floatleft message">请输入一个长度为5-20的字符串</div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title">密码：</div>
				<div class="floatleft editor"><input type="password" id="plainPassword" name="password"  value="${admin.password }" placeholder="******" maxlength="20"/><div style=" color: red; margin-top: -7px; float: right; ">*</div></div>
				<div class="floatleft message">请输入一个长度为5-20的字符串</div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title">确认密码：</div>
				<div class="floatleft editor"><input type="password" id="confirmPassword" name="confirmPassword"  value="${admin.password}" placeholder="******" maxlength="20" /><div style=" color: red; margin-top: -7px; float: right; ">*</div></div>
				<div class="floatleft message">请输入一个长度为5-20的字符串</div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title">姓名：</div>
				<div class="floatleft editor"><input type="text" id="name" name="name" value='${admin.name}'  placeholder="请再次输入姓名..." maxlength="20" /><div style=" color: red; margin-top: -7px; float: right; ">*</div></div>
				<div class="floatleft message">请输入姓名</div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title">出生日期：</div>
				<div class="floatleft editor"><input type="text" id="dates" name="dates" value="${admin.birthdayTime}"  onFocus="WdatePicker({isShowClear:true,readOnly:true,dateFmt:'yyyy-MM-dd'})"   placeholder="请点击选择出生日期..."/><div style=" color: red; margin-top: -7px; float: right; ">*</div></div>
				<div class="floatleft message">请输入出生日期</div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title">选择角色：</div>
				<div class="floatleft editor">
					<select name="roleid" id="roleid" onchange='changeEditRole()' style="height: 32px;width:230px;border: 1px solid #ddd;" onchange="fistlist()";>
							<c:forEach items="${rolelist}" var="list">
								<option <c:if test="${userrole.roleid == list.roleid}">selected="selected"</c:if> value="${list.roleid}">${list.name}</option>
							</c:forEach>         
		            </select>
		            <div style=" color: red; margin-top: -35px; float: right; ">*</div>
				</div>
				<div class="floatleft message">请选择角色！</div>
				<div class="clear"></div>
			</div>
			<input type="hidden" id="usertype" name="usertype"  value="${admin.usertype}"/>   <!-- 203为管理员状态 -->		
			<input type="hidden" id="id" name="id"  value="${admin.id }"/>   	
			<input type="hidden" id="registtime" name="registtime"  value="${admin.registtime }"/>   	
			<div class="itempanel">
				<div class="floatleft message" style="color:red;color: red; margin-left: 10%; font-family: 微软雅黑; font-weight: bold;">注：带*均为必填项！</div>
				<div class="clear"></div>
			</div>
			<div class="actionbar" style="margin-left:50px;">
				<input id="submit_btn" class="greenbutton2" type="submit" value="提交"/>
				<input id="cancel_btn" class="greenbutton2" type="button" value="返回" onclick="history.back()">
			</div>
	</div>
</form>
<script type="text/javascript">		

		function changeEditRole()
		{   
			var rolevalue=$('#roleid option:selected').text();
			if(rolevalue=='营养师')
			{
				
				document.getElementById("usertype").value=202;
			}else{
				
				document.getElementById("usertype").value=203;
			}
		}
		function checkForm(form){
			var oldpassword='${admin.password}';
			var username = document.inputForm.username.value;
			var plainPassword = document.inputForm.password.value;
			var confirmPassword = document.inputForm.confirmPassword.value;
			var roleid = document.inputForm.roleid.value;
 			var name = document.inputForm.name.value;
 			var dates =document.inputForm.dates.value;
			if(username.length==0 || username.trim().length==0){
				alert("用户名不能为空");
				document.inputForm.username.focus();
				return false;
			}if(username.length<5 || username.length>20){
				alert("用户名长度必须为5-20");
				document.inputForm.username.focus();
				return false;
			}if(plainPassword.length==0 || plainPassword.trim().length==0){
				alert("密码不能为空");
				document.inputForm.password.focus();
				return false;
			}if(plainPassword.length<5 || plainPassword.length>20){
				alert("密码长度必须为5-20");
				document.inputForm.password.focus();
				return false;
			}if(confirmPassword.length==0 || confirmPassword.trim().length==0){
				alert("再次输入密码");
				document.inputForm.confirmPassword.focus();
				return false;
			}if(plainPassword!=confirmPassword){
				alert("两次输入的密码不一样！请重新输入");
				document.inputForm.confirmPassword.focus();
				return false;
			}
			if(name.length==0 || name.trim().length==0){
				
				alert("请输入姓名");
				document.inputForm.confirmPassword.focus();
				return false;
			}
			if(dates.length==0 || dates.trim().length==0){
				
				alert("请输入出生日期");
				document.inputForm.confirmPassword.focus();
				return false;
			}
			if(roleid.length==0 || roleid.trim().length==0){
				alert("角色不能为空");
				document.inputForm.phone.focus();
				return false;
			}
			if(plainPassword !=oldpassword)
			{
				document.inputForm.password.value=md5(plainPassword);
				document.inputForm.confirmPassword.value=md5(confirmPassword);
				return true;
			}
		}
</script>