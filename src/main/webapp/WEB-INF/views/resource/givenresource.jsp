<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="navigation">当前位置：权限管理&nbsp;>&nbsp;分配权限&nbsp;>&nbsp;<a href="javascript: history.go(-1);">返回</a></div>
<form id="inputForm" name="inputForm" action="${ctx}/resource/update" method="post" style="margin-top: 40px;">
	<div class="detail">
		<div class="itempanel">
			<div class="floatleft title">请选择权限：</div>
			<div class="floatleft">
				<c:forEach items="${resource}" var="resource">
					<div class="resourcepanel">
						<c:set var="checkid" value="${resource.resource.resourceid}"/>
						<c:if test="${fn:indexOf(roleresources, checkid) > -1}">
							<div class="parent" style="background-color: #eee;"><label><input name="selectresource" id="right_${resource.resource.resourceid }" type="checkbox" value="${resource.resource.resourceid }" checked />${resource.resource.title }</label></div>
						</c:if>
						<c:if test="${fn:indexOf(roleresources, checkid) == -1}">
							<div class="parent" style="background-color: #eee;"><label><input name="selectresource" id="right_${resource.resource.resourceid }" type="checkbox" value="${resource.resource.resourceid }" />${resource.resource.title }</label></div>
						</c:if>
						
						<div>
							<c:forEach items="${resource.subResource}" var="subresource">
								<c:set var="checkid" value="${subresource.resourceid}"/>
								<c:if test="${fn:indexOf(roleresources, checkid) > -1}">
									<div class="floatleft item" style="margin-left:50px;"><label><input onclick="check(this, ${resource.resource.resourceid })" name="selectresource" type="checkbox" value="${subresource.resourceid }" checked />${subresource.title }</label></div>
								</c:if>
								<c:if test="${fn:indexOf(roleresources, checkid) == -1}">
									<div class="floatleft item" style="margin-left:50px;"><label><input onclick="check(this, ${resource.resource.resourceid })" name="selectresource" id="selectresource" type="checkbox" value="${subresource.resourceid }" />${subresource.title }</label></div>
								</c:if>
							</c:forEach>
							<div class="clear"></div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="clear"></div>
		</div>
		<div class="actionbar">
			<input id="submit_btn" class="greenbutton2" style="margin-left: 57px;" type="button"  onclick="tijiao();"value="提交"/>
			<input id="cancel_btn" class="greenbutton" style="margin-left: 30px; margin-top: 10px; padding-left: 21px; padding-right: 21px;" type="button" value="返回" onclick="window.location.href='javascript: history.go(-1);'">
		</div>
	</div><br/><br/>
	<input type="hidden" name="roleid" value="${role.roleid }"/>		
	<input type="hidden" name="name" value="${role.name }"/>		
</form>
<script type="text/javascript">
	
function check(obj, parentId)
{
	
	var parentElement = document.getElementById("right_" + parentId);
	if(obj.checked)
	{
		parentElement.checked = true;
	}
}
function tijiao()
{
	if($("input[name=selectresource]:checked").length==0){
		alert("权限不能为空！");
		return ;
	}
	var inputForm=document.getElementById("inputForm");
	inputForm.submit();
}

</script>
	