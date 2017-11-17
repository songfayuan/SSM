<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
com.songfayuan.ssm.controller.CheckUserRight checkUserRight = new  com.songfayuan.ssm.controller.CheckUserRight(request);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="navigation">当前位置：权限管理&nbsp;>&nbsp;权限管理&nbsp;>&nbsp;<a href="javascript: history.go(-1);">返回</a></div>
<div style="">
	<table class="list" border="1" bordercolor="#ccc" cellspacing="10" cellpadding="10" style="margin-top: 15px;">
		<tr>
			<th>角色名称</th>
			<th>用户人数</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${roleList }" var="list" varStatus="i">
		<tr>
			<td>${list.name}</td>
			<td>
				<c:if test="${list.rolepeoples == null }">
					0
				</c:if>
				<c:if test="${list.rolepeoples != null }">
					${list.rolepeoples }
				</c:if>
				
			</td>
			<td>
				<%if(checkUserRight.check(600004)){ %>
					<a style="color:#54bc2d;" href="javascript:void(0);" onclick='givenresource(${list.roleid});'>分配权限</a>
				<%} %>
				<%if(checkUserRight.check(600005)){ %>
				   <c:if test="${list.roleid != 1 && list.roleid != 2 && list.roleid != 3}">
					   <a style="color:#54bc2d;" href='javascript:void(0);' onclick='delrole(${list.roleid});'>删除角色</a>
				   </c:if>
				<%} %>
			</td>
		</tr>
		</c:forEach>
	</table>
	
	<div>
		<%if(checkUserRight.check(600003)){ %>
			<input class="greenbutton" style="margin: 10px 30px;" type="button" value="创建角色" onclick="createrole();"/>
		<%} %>
	</div>
</div>
<style>
.xdsoft_dialog_overlay .xdsoft_dialog .xdsoft_dialog_buttons .xdsoft_btn.xdsoft_primary:hover
{
   background-color: #56BE2D;
}


</style>
<script>

	//分配权限
	function givenresource(roleid){
		location.href = '<%=basePath %>resource/givenresource?roleid='+roleid;
	}
	
	//删除角色
	function delrole(roleid){
		if(confirm("你确定要删除这个角色吗？")){
			location.href = '<%=basePath %>resource/delrole?roleid='+roleid;
		}
	}
	
	//创建角色
	function createrole(){
		jPrompt('','',function(event,val){
			if(isNull(val)){
				alert("角色名称不能为空！");
			}else{
				var inv = encodeURI(encodeURI(val));
				location.href = '<%=basePath %>resource/createrole?name='+inv;
			}
		},"创建角色");
	}
</script>