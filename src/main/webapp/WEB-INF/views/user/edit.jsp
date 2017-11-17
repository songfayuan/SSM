<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=basePath %>js/dateControl.js"></script>


<div class="navigation">当前位置：客户管理&nbsp;>&nbsp;编辑客户信息</div>
<form id="inputForm" name="inputForm" action="${ctx}/user/editsave" method="post"> 
		<div class="detail" style="margin-top: 40px;margin-left: 40px;">
			<div class="itempanel">
				<div class="floatleft title" style="text-align: left;">用户名：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;">${puser.username}</div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title" style="text-align: left;">出生日期：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;"><input type="text" id="birthday" name="birthday"  value="${puser.birthdayTime}" onclick="SelectDate(this);" placeholder="请点击选择出生日期..."/></div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title" style="text-align: left;">身高：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;"><input type="text" id="bodyheight" name="bodyheight" value="${puser.bodyheight}"/>cm</div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title" style="text-align: left;">体重：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;"><input type="text" id="bodyweight" name="bodyweight" value="${puser.bodyweight}"/>kg</div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title" style="text-align: left;">性别：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;">
					<select name="sex" id="sex" onchange="changeSex()" style="width: 346px; height: 28px; border-color: rgb(221, 221, 221);">
						<option <c:if test="${puser.sex!=801&&puser.sex!=802}"> selected="selected"</c:if> value="0">请选择...</option>
						<option <c:if test="${puser.sex==801}"> selected="selected"</c:if> value="801">男</option>
						<option <c:if test="${puser.sex==802}"> selected="selected"</c:if> value="802">女</option>
            		</select>
				</div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title" style="text-align: left;">所属人群：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;">
					<select name="population" id="population" onchange="changeGroup()" style="width: 346px; height: 28px; border-color: rgb(221, 221, 221);">
						<option <c:if test="${puser.population!=403}"> selected="selected"</c:if> value="0">其他</option>
						<option <c:if test="${puser.population==403}"> selected="selected"</c:if> value="403">孕妇</option>
            		</select>
				</div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title" style="text-align: left;">慢病：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;">
					<select name="medicalhistory" id="medicalhistory" style="width: 346px; height: 28px; border-color: rgb(221, 221, 221);">
						<option <c:if test="${puser.medicalhistory==0}"> selected="selected"</c:if> value="0">无</option>
						<option <c:if test="${puser.medicalhistory==601}"> selected="selected"</c:if> value="601">糖尿病</option>
						<option <c:if test="${puser.medicalhistory==602}"> selected="selected"</c:if> value="602">高血压</option>
            		</select>
				</div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			<div class="itempanel" id="pregnancyweightdiv">
				<div class="floatleft title" style="text-align: left;">孕前体重：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;"><input type="text" id="pregnancyweight" name="pregnancyweight" value="${puser.pregnancyweight}"/>kg</div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			<div class="itempanel" id="date1div">
				<div class="floatleft title" style="text-align: left;">预产期：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;"><input type="text" id="date1" name="date1"  value="${puser.dueTime}" onclick="SelectDate(this);" placeholder="请点击选择时间..."/></div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title" style="text-align: left;">计量单位：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;">
						克
				</div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			<div class="itempanel">
				<div class="floatleft title" style="text-align: left;">营养师：</div>
				<div class="floatleft editor" style="font-size:16px;height: 24px;line-height: 24px;">
					<select name="dietitianid" id="dietitianid" style="width: 346px; height: 28px; border-color: rgb(221, 221, 221);">
            		</select>
				</div>
				<div class="floatleft message"></div>
				<div class="clear"></div>
			</div>
			
			<input type="hidden" id="id" name="id" value="${puser.id}"/>
			<input type="hidden" id="age" name="age"/>
			<input type="hidden" id="populations" name="populations"/>
			
			<div class="actionbar">
				<input id="submit_btn" class="greenbutton2" style="margin-left: -80px;" onclick="gotoUrl()" type="button" value="保存"/>
				<input id="cancel_btn" class="greenbutton2" style="margin-left: 50px;" type="button" value="返回" onclick="window.location.href='<%=basePath%>user/inspect?id=${puser.id}'">
			</div>
	</div>
</form>
		
<script type="text/javascript">
	//alert('${user.usertype}');
	//alert('${user.id}'+"========="+'${puser.dietitianid}');
	if('${user.usertype}'==202&&'${user.id}'!='${puser.dietitianid}'){
		$("#dietitianid").attr("disabled",true);
	}

	initFunction();
	//初始化的操作
	function initFunction(){
		
		var yuserLists = '${yuserLists}';
		var yUserid = '${puser.yUser.id}';
		var yuserList=eval('(' + yuserLists + ')');
		var htm = '';
		if(yuserList != null){
			 for(var i=0;i<yuserList.data.length;i++){
				 htm +='<option value="'+yuserList.data[i].id+'">'+yuserList.data[i].username+'</option>';
			 }
		}
		$("#dietitianid").html(htm);
		$("#dietitianid option[value='"+yUserid+"']").attr("selected",true);
		
		var sex = document.getElementById("sex");
		var sexvalue = sex.options[sex.selectedIndex].value;
		if(sexvalue==801){
			$("#population option[value='"+0+"']").attr("selected",true);
			$("#population").attr("disabled",true);
			$("#pregnancyweightdiv").css("display","none");
			$("#date1div").css("display","none");
		}
		if(sexvalue==802){
			$("#population").attr("disabled",false);
		}
		
		var population = document.getElementById("population");
		var populationvalue = population.options[population.selectedIndex].value;
		if(populationvalue==403){
			$("#pregnancyweightdiv").css("display","block");
			$("#date1div").css("display","block");
		}else{
			$("#pregnancyweightdiv").css("display","none");
			$("#date1div").css("display","none");
		}
	}
	
	
	//改变性别
	function changeSex(){//如果是男性，群体固定其他；如果是女性，群体出现孕妇
		var sex = document.getElementById("sex");
		var sexvalue = sex.options[sex.selectedIndex].value;
		if(sexvalue==801){
			$("#population option[value='"+0+"']").attr("selected",true);
			$("#population").attr("disabled",true);
			$("#pregnancyweightdiv").css("display","none");
			$("#date1div").css("display","none");
		}
		if(sexvalue==802){
			$("#population").attr("disabled",false);
		}
	}

	//改变群体
	function changeGroup(){//如果是其他，没有孕前体重和预产期；如果是孕妇，则出现孕前体重和预产期
		var population = document.getElementById("population");
		var populationvalue = population.options[population.selectedIndex].value;
		if(populationvalue==403){
			$("#pregnancyweightdiv").css("display","block");
			$("#date1div").css("display","block");
		}else{
			$("#pregnancyweightdiv").css("display","none");
			$("#date1div").css("display","none");
		}
	}

	function gotoUrl(){
		
		var birthday = $("#birthday").val();//出生日期
		if(isNull(birthday)){
			alert("请填写出生日期！");
			return;
		}
		var birthdaytime = Date.parse(new Date(birthday));
		var now = new Date().getTime();
		var birthdayhours = (now - birthdaytime)/1000/60/60;
		var age =  Math.floor(birthdayhours / (24 * 30 * 12));
		$("#age").val(age);
		
		var bodyheight = $("#bodyheight").val();//身高
		if(isNull(bodyheight)){
			alert("请填写用户的身高！");
			return;
		}
		var bodyweight = $("#bodyweight").val();//体重
		if(isNull(bodyweight)){
			alert("请填写用户的体重！");
			return;
		}
		
		var sex = document.getElementById("sex");
		var sexvalue = sex.options[sex.selectedIndex].value;
		if(sexvalue==0){
			alert("请选择用户的性别！");
			return;
		}
		
		var population = document.getElementById("population");
		var populationvalue = population.options[population.selectedIndex].value;
		if(populationvalue==403){
			var pregnancyweight = $("#pregnancyweight").val();//孕前体重
			if(isNull(pregnancyweight)){
				alert("请填写用户的孕前体重！");
				return;
			}
			var date1 = $("#date1").val();//预产期
			if(isNull(date1)){
				alert("请填写用户的预产期！");
				return;
			}
		}
		
		var pregnancyweight = $("#pregnancyweight").val();//孕前体重
		if(isNull(pregnancyweight)){
			$("#pregnancyweight").val(null);
		}
		var date1 = $("#date1").val();//预产期
		if(isNull(date1)){
			$("#date1").val(null);
		}
		
		//var sex = $("#sex").val();//性别
		var population = $("#population").val();//所属人群
		$("#populations").val(population);
		//alert($("#populations").val());
		//var medicalhistory = $("#medicalhistory").val();
		//var dietitianid = $("#dietitianid").val();//营养师
		//alert("出生日期="+birthday+"---身高="+bodyheight+"---体重="+bodyweight+"---性别="+sex+"---所属人群="+population+"---慢病="+medicalhistory+"---孕前体重="+pregnancyweight+"---预产期="+date1+"---营养师="+dietitianid);
	    //return;
	    
		var inputForm=document.getElementById("inputForm");
	    inputForm.submit();
	};
		
		
</script>