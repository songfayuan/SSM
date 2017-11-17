<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	com.thinker.jkzp.management.web.CheckUserRight checkUserRight = new  com.thinker.jkzp.management.web.CheckUserRight(request);
%>
<script type="text/javascript" src="<%=basePath %>js/dateControl.js"></script>
<div class="navigation">当前位置：客户管理&nbsp;>&nbsp;查看客户信息</div>
		<div class="detail" style="margin-top: 40px;margin-left: 40px;">
			<div class="itempanel">
				<div class="floatleft title" style="text-align: left;">用户名：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;">${puser.username}</div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			
				<div class="itempanel">
				<div class="floatleft title" style="text-align: left;">年龄：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;">
				<c:if test="${empty  puser.age}">
					暂无
				</c:if>
				<c:if test="${!empty  puser.age}">
					${puser.age}
				</c:if>
				</div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title" style="text-align: left;">身高：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;">
				<c:if test="${empty  puser.bodyheight}">
					暂无
				</c:if>
				<c:if test="${!empty  puser.bodyheight}">
					${puser.bodyheight}cm
				</c:if>
				</div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title" style="text-align: left;">体重：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;">
				<c:if test="${empty  puser.bodyweight}">
					暂无
				</c:if>
				<c:if test="${!empty  puser.bodyweight}">
					${puser.bodyweight}kg
				</c:if>
				</div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title" style="text-align: left;">BMI：</div>   <!-- 体质指数（BMI）=体重（kg）÷身高^2（m） -->
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;">
				<c:if test="${empty  puser.bmino}">
					暂无
				</c:if>
				<c:if test="${!empty  puser.bmino}">
					${puser.bmino}（kg/㎡）
				</c:if>
				</div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title" style="text-align: left;">性别：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;">
					<c:if test="${empty  puser.sex}">
						暂无
					</c:if>
					<c:if test="${!empty  puser.sex}">
						<c:if test="${puser.sex==801}">男</c:if>
						<c:if test="${puser.sex==802}">女</c:if>
					</c:if>
				</div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title" style="text-align: left;">所属人群：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;">
					<c:if test="${empty  puser.population}">
						暂无
					</c:if>
					<c:if test="${!empty  puser.population}">
						<c:if test="${puser.population==401}">成人</c:if>
						<c:if test="${puser.population==402}">儿童</c:if>
						<c:if test="${puser.population==403}">孕妇</c:if>
					</c:if>
				</div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title" style="text-align: left;">慢病：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;">
					<c:if test="${empty  puser.medicalhistory}">
						暂无
					</c:if>
					<c:if test="${!empty  puser.medicalhistory}">
						<c:if test="${puser.medicalhistory==0}">无</c:if>
						<c:if test="${puser.medicalhistory==601}">糖尿病</c:if>
						<c:if test="${puser.medicalhistory==602}">高血压</c:if>
					</c:if>
				</div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			<c:if test="${puser.population==403}">
				<div class="itempanel">
				<div class="floatleft title" style="text-align: left;">孕前体重：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;">${puser.pregnancyweight}kg</div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title" style="text-align: left;">预产期：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;">${puser.dueTime}</div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			</c:if>
			<div class="itempanel">
				<div class="floatleft title" style="text-align: left;">计量单位：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;">克</div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title" style="text-align: left;">营养师：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;">${puser.yUser.username}</div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			
			<input type="hidden" id="id" name="id" value="${puser.id}"/>
			<input type="hidden" id="name" name="name" value="${puser.name}"/>
			<input type="hidden" id="password" name="password" value="${puser.password}"/>
			<input type="hidden" id="img" name="img" value="${puser.img}"/>
			<input type="hidden" id="token" name="token" value="${puser.token}"/>
			<input type="hidden" id="registtime" name="registtime" value="${puser.registtime}"/>
			<input type="hidden" id="dietitianid" name="dietitianid" value="${puser.dietitianid}"/>
			<input type="hidden" id="birthday" name="birthday" value="${puser.birthday}"/>
			
			<div class="actionbar">
				<%if(checkUserRight.check(201006)){ %>
					<button class="greenbutton2" style="margin-left: -80px;"><a class="greenbutton2" href="<%=basePath%>user/edit?id=${puser.id}">编辑</a></button>
				<% }else{ %>
					<c:if test="${(user.id==puser.dietitianid&&user.usertype==202)||user.usertype==203}">
						<button class="greenbutton2" style="margin-left: -80px;"><a class="greenbutton2" href="<%=basePath%>user/edit?id=${puser.id}">编辑</a></button>
					</c:if>
				<% } %>
				<input id="cancel_btn" class="greenbutton2" style="margin-left: 50px;" type="button" value="返回" onclick="window.location.href='<%=basePath%>user/userlist'">
			</div>
	</div>
