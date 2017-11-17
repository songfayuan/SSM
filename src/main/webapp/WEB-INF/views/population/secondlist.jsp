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
<script type="text/javascript" src="<%=basePath %>js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">

	function toedit(id, pid)
	{
		$("#label_"+id+"").css("border-color", "#ddd");   //设置样式
		$("#label_"+id+"").removeAttr("readonly");  //删除属性
		$("#label_"+id+"").focus();   //获取焦点
		
		$("#label_"+id+"").blur(function(){
			  $("#label_"+id+"").css("border-color","white");
			  $("#label_"+id+"").attr("readonly","readonly") // 设置属性  
		});
	}
	
	function getInfo(id, pid){
		var name = $("#label_"+id+"").val();
		var bln=confirm("系统检测到数据已更改，需要修改吗？")
		if (bln==true)
		{
// 	 		alert("你点击了确定按钮！");
			$.ajax(
			{
				url:'<%=basePath%>population/editlabel',
						type:'POST',
						data:'id='+id+'&name='+name+'&pid='+pid,
						success: function(data)
				        {
							if(data=="OK"){
								alert('您已成功修改数据！');
								return;
							} 
							
				        }
			});
			
		}else{
// 	 		alert("你点击了取消按钮！");
			window.location.href = '${ctx}/population/secondlist?id='+pid;
			return;
		}
	}
	
	function gotopage(url, pageno)
	{
		window.location.href = url + '?pageno=' + pageno + '&id=' + ${id };
	}
</script>
	
<div class="navigation">当前位置：运行日志&nbsp;>&nbsp;展示列表&nbsp;>&nbsp;二级列表&nbsp;>&nbsp;<a href="javascript: history.go(-1);">返回</a></div>
<table class="list" border="1" bordercolor="#ccc" cellspacing="10" cellpadding="10" style="margin-top: 40px;">
	<tr>
		<th>二级分类</th>
		<th>操作</th>
	</tr>
	<c:forEach items="${list.content}" var="list">
	<tr> 
		<td><input type="text" id="label_${list.id }" value="${list.label}" onchange="getInfo(${list.id},${list.pid});" style="width: 20%; text-align: center; border-color: white;" readonly="readonly"/></td>
<%-- 		<td>${fn:substring(list.content, 0, 30)}...</td> --%>
		<td>
<%-- 		<%if(checkUserRight.check(101004)){ %> --%>
<%-- 			<a style="color:#54bc2d;" href="<%=basePath%>population/edit?id=${list.id}&pid=${list.pid}" onclick="toedit(${list.id},${list.pid});">编辑</a> --%>
			<a class="button border-green button-little" onclick="toedit(${list.id},${list.pid});">编辑</a>
			<a class="button border-yellow button-little" href="<%=basePath%>population/seconddelete?id=${list.id}&pid=${list.pid}" onclick="{if(confirm('确认删除吗?')){return true;}else return false;}">删除</a>
<%-- 		<%} %> --%>
		</td> 
	</tr>	
	</c:forEach>
</table>
<div class="pagestart">
	<div class="pagebar" style="margin-right: 10px; height: 20px; line-height: 20px;">
		共<span>${list.totalpages}</span>页，每页<span>${list.pagesize}</span>条，当前是第<span>${list.pageno}</span>页
	</div>
	<div class="pageinfo">
		<button
			onclick="gotopage('<%=basePath%>population/secondlist', '1')"
			<c:if test="${list.pageno == 1}"> class="button3"  disabled</c:if>
			<c:if test="${list.pageno > 1}"> class="button3"</c:if>>首页</button>
		<button
			onclick="gotopage('<%=basePath%>population/secondlist', '${list.pageno-1 }')"
			<c:if test="${list.pageno == 1}"> class="button3"  disabled</c:if>
			<c:if test="${list.pageno > 1}"> class="button3"</c:if>>上页</button>
		<button
			onclick="gotopage('<%=basePath%>population/secondlist', '${list.pageno+1 }')"
			<c:if test="${list.pageno == list.totalpages}"> class="button3"  disabled</c:if>
			<c:if test="${list.pageno < list.totalpages}"> class="button3"</c:if>>下页</button>
		<button
			onclick="gotopage('<%=basePath%>population/secondlist', '${list.totalpages }')"
			<c:if test="${list.pageno == list.totalpages}"> class="button3"  disabled</c:if>
			<c:if test="${list.pageno < list.totalpages}"> class="button3"</c:if>>末页</button>
	</div>
	<div class="clear"></div>
</div>
<br/><br/>