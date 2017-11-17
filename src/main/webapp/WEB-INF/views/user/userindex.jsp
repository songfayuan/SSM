<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="index_main" style="width: 100%; height: 100%;">

<table class="list" border="1" bordercolor="#ccc" cellspacing="10" cellpadding="10">
<tr>
		<td style="text-align: left;">【游鱼圈】运营播报：</td>
	</tr>
	<tr>
		<td style="text-align: left;">
			<div style="float: left;"><img src="../images/map.jpg" style="width: 339px;padding-right: 8px;"/></div>
			<div style="float: left;">
				<div class="index_line"></div>
				<div class="index_line">截止到昨天23:59：</div>
<%-- 				<div class="index_line">1、注册用户达${fn:length(registuserlist)}人，本月新增用户${fn:length(monthAddList)}人；</div> --%>
				<div class="index_line">1、您当前账户余额为：<span style="color: #ff6600; font-size: 30px;">${totalmoney}</span>元；</div>
				<div class="index_line">2、您当前【进行中】订单数为：<span style="color: #ff6600; font-size: 30px;">${ordernum }</span>；</div>
				<div class="index_line">2、您当前【已结束】订单数为：<span style="color: #ff6600; font-size: 30px;">${over_ordernum }</span>。</div>
				<div class="index_line">我们共同的未来，源自你我的一份努力！</div>
			</div>
			<div class="clear"></div>
		</td>
	</tr>
</table>	


<!-- <table class="list" border="1" bordercolor="#ccc" cellspacing="10" cellpadding="10">
	<tr>
		<td>
			<div>©杭州数娱信息科技有限公司版权所有</div>
		</td>
	</tr>
</table> -->

</div>

