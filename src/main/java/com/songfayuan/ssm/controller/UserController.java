/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.controller
 * 创建时间：2017年6月14日上午11:22:36
 * 创建者：Administrator-宋发元
 * 创建地点：北京清科科技股份有限公司
 */
package com.songfayuan.ssm.controller;

import java.io.IOException;
import java.lang.management.ManagementFactory;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.InetAddress;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.songfayuan.ssm.entity.Role;
import com.songfayuan.ssm.entity.Roleresource;
import com.songfayuan.ssm.entity.User;
import com.songfayuan.ssm.entity.UserRole;
import com.songfayuan.ssm.service.RoleResourceService;
import com.songfayuan.ssm.service.RoleService;
import com.songfayuan.ssm.service.UserRoleService;
import com.songfayuan.ssm.service.UserService;
import com.songfayuan.ssm.util.ExcelUtil;
import com.songfayuan.ssm.util.PageInfomation;
import com.sun.management.OperatingSystemMXBean;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月14日上午11:22:36
 */
@Controller
@RequestMapping("/user")
public class UserController {
	
	Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Resource
	private UserService userService;
	
	@Resource
	private RoleService roleService;
	
	@Resource
	private UserRoleService userRoleService;
	
	@Resource
	private RoleResourceService roleResourceService;
	
	/**
	 * 描述：跳转到登录页面
	 * @param model
	 * @return
	 * @author songfayuan
	 * 2017年6月14日下午6:59:26
	 */
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginForm(Model model)
	{
		List<Role> rlist = this.roleService.getRoleList();  //获取角色
		model.addAttribute("rolelist", rlist);
		logger.info("【操作】：跳转到登录页面...");
		return "user/login";
	}
	
	/**
	 * 描述：登录操作
	 * @param request
	 * @param response
	 * @param username
	 * @param password
	 * @param usertype
	 * @param validcode
	 * @param redirect
	 * @param model
	 * @return
	 * @author songfayuan
	 * 2017年6月17日上午2:32:36
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response, 
			@RequestParam("username") String username, 
			@RequestParam("password") String password,
			@RequestParam("usertype") String usertype,
			@RequestParam("validcode") String validcode,
			RedirectAttributes redirect,
			Model model)
	{
		User user = this.userService.findByUsernameAndPassword(username, password,Integer.parseInt(usertype));  //根据用户名，用户密码，用户类型查询用户
		HttpSession session = request.getSession();
		int yusertype=0;
		if(user != null)
		{
			yusertype=user.getUsertype();
		}
		String val = session.getAttribute("validatecode").toString().toLowerCase();		//验证码
		if (user == null)
		{
			return "user/error1";
		}else if (!validcode.toLowerCase().equals(val))
		{
			return "user/error2";
		}else if(!user.getUsername().equals(username))
		{
			return "user/error3";
		}
		else if(!user.getPassword().equals(password))
		{
			return "user/error4";
		}else if(yusertype==0 || yusertype != Integer.parseInt(usertype))
		{
			return "user/error5";
		}else
		{
			int userid = user.getId();
			// 获取角色ID
			String resourcesString = ",";
			List<UserRole> userRoleList = this.userRoleService.getUserRole(userid);
			if (userRoleList != null && userRoleList.size() > 0)
			{
				for (UserRole userRole : userRoleList)
				{
					Integer roleid = userRole.getRoleid();
					
					// 获取权限内容
					List<Roleresource> rr = roleResourceService.getRoleResource(roleid);
					int length = rr.size();
					for (int i = 0; i < length; i++)
					{
						resourcesString += rr.get(i).getResourceid() + ",";
					}
				}
			}
			logger.info("【操作】：{}登录成功...", user.getUsername());
			session.setAttribute("user", user);
			session.setAttribute("resourceid", resourcesString);
		}
		if(Integer.parseInt(usertype)==202){  //客户
			return "redirect:/user/userindex";
		}else{
			return "redirect:/user/index";
		}
			
	}
	
	/**
	 * 描述：【管理员】首页显示数据统计
	 * @param model
	 * @return
	 * @author songfayuan
	 * 2017年6月17日上午10:37:18
	 */
	@RequestMapping(value = "index", method = RequestMethod.GET)
	//此处为记录AOP拦截Controller记录用户操作    
	@SystemControllerLog(description = "访问首页") 
	public String index(Model model){
		try{
			//注册用户列表
			List<User> registuserlist = this.userService.getRegistUserslist();
			//当月注册用户列表
			List<User> monthAddList = this.userService.getUserAddList("month");
			
			try {
	            InetAddress addr = InetAddress.getLocalHost();
	            String ip = addr.getHostAddress().toString(); //获取本机ip
	            String hostName = addr.getHostName().toString(); //获取本机计算机名称
	            System.out.println("本机IP：" + ip + "\n本机名称:" + hostName);
	            Properties props = System.getProperties();
	            System.out.println("操作系统的名称：" + props.getProperty("os.name") + " " + props.getProperty("os.arch"));
	            System.out.println("操作系统的版本：" + props.getProperty("os.version"));
	            
	            OperatingSystemMXBean osmb = (OperatingSystemMXBean) ManagementFactory.getOperatingSystemMXBean();

	            System.out.println("系统物理内存总计：" + osmb.getTotalPhysicalMemorySize() / 1024 / 1024 + "MB");

	            System.out.println("系统物理可用内存总计：" + osmb.getFreePhysicalMemorySize() / 1024 / 1024 + "MB");
	          
	            model.addAttribute("computer_id", ip);
	            model.addAttribute("computer_hostName", hostName);																																																																			
	            model.addAttribute("computer_os_Name", props.getProperty("os.name") + " " + props.getProperty("os.arch"));
	            model.addAttribute("computer_os_version", props.getProperty("os.version"));
	            model.addAttribute("totalphysicalmemorysize", osmb.getTotalPhysicalMemorySize() / 1024 / 1024 + "MB");
	            model.addAttribute("freephysicalmemorysize", osmb.getFreePhysicalMemorySize() / 1024 / 1024 + "MB");
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
			logger.info("【操作】：管理员访问首页...");
			model.addAttribute("registuserlist", registuserlist);
			model.addAttribute("monthAddList", monthAddList);
			
		 }catch (Exception e) {    
			 new RuntimeException("首页出现异常！！！");
	     }  
		return "user/index";
	}
	
	/**
	 * 描述：客户首页
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @author songfayuan
	 * 2017年6月17日上午10:37:04
	 */
	@RequestMapping(value = "userindex", method = RequestMethod.GET)
	//此处为记录AOP拦截Controller记录用户操作    
	@SystemControllerLog(description = "访问客户首页") 
	public String userIndex(HttpServletRequest request,HttpServletResponse response,Model model){
		try{
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			Integer userid = user.getId();  //操作者id
			if(user!=null){
				model.addAttribute("totalmoney", user.getBalance());//客户余额
			}
			logger.info("【操作】：客户{}访问首页...", user.getUsername());
		}catch (Exception e) {    
			new RuntimeException("首页出现异常！！！");
		}  
		return "user/userindex";
	}
	
	/**
	 * 描述：客户管理-客户列表
	 * @param request
	 * @param response
	 * @param pageno
	 * @param pagesize
	 * @param model
	 * @return
	 * @author songfayuan
	 * 2017年6月17日上午10:37:45
	 */
	@SystemControllerLog(description = "查询所有的用户列表")
	@RequestMapping(value = "userlist",method = RequestMethod.GET)
	public String getList(User userModel,HttpServletRequest request,
			@RequestParam(value = "pageno",defaultValue = "1") Integer pageno,
			@RequestParam(value = "pagesize",defaultValue = "10") Integer pagesize,Model model)
	{
		PageInfomation<User> userList = this.userService.getUserList(userModel,pageno, pagesize);  //查询所有的用户列表
		//处理时间格式问题
		for(Integer i =0;i<userList.getContent().size();i++){
			User userInfo = userList.getContent().get(i);
			/*//处理显示名称
			String showusername = user.getUsername();
			String hideusername = showusername.substring(0,3) + "****" + showusername.substring(7, showusername.length());
			user.setHideusername(hideusername);*/
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			if(userInfo.getRegisttime()!=null){
				String createtime=formatter.format( userInfo.getRegisttime() );
				userInfo.setCreateDate(createtime);
			}
		}
		//登录者信息
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
		
		logger.info("【操作】：查询所有的用户列表...");
		model.addAttribute("userList", userList);
		return "user/userlist";
	}
	
	/**
	 * 描述：导出用户列表
	 * @param response
	 * @throws Exception
	 * @author songfayuan
	 * 2017年6月19日下午4:26:32
	 */
	@SystemControllerLog(description="导出操作：导出全部用户列表信息...")
	@RequestMapping(value = "exuserlist", method = RequestMethod.POST)
	public void exportExcelUserList(HttpServletResponse response) throws Exception{
		List<User> list = this.userService.getExportExcelUserList();  //获取所以的用户数据列表
		Workbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet();
		Row row = sheet.createRow(0);
		row.createCell(0).setCellValue("昵称");
		row.createCell(1).setCellValue("用户名");
		row.createCell(2).setCellValue("手机号");
		row.createCell(3).setCellValue("注册时间");
		row.createCell(4).setCellValue("账户余额");
		row.createCell(5).setCellValue("累计收入");
		row.createCell(6).setCellValue("今日收入");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (int i = 0; i < list.size(); i++) {
			row = sheet.createRow(i + 1);
			row.createCell(0).setCellValue(list.get(i).getName());
			row.createCell(1).setCellValue(list.get(i).getUsername());
			row.createCell(2).setCellValue(list.get(i).getPhone());
			row.createCell(3).setCellValue(dateFormat.format(list.get(i).getRegisttime()));
			row.createCell(4).setCellValue(list.get(i).getBalance().toString());
			row.createCell(5).setCellValue(list.get(i).getTotalmoney().toString());
			row.createCell(6).setCellValue(list.get(i).getTodaymoney().toString());
		}
		ExcelUtil.write("用户列表", workbook, response);	
		logger.info("【操作】：导出全部用户列表信息...");
	}
	
	
	 /**
	  * MD5
	 * @param strSrc
	 * @param md
	 * @return
	 */
	public static String MD5(String strSrc,MessageDigest md) {  
	        byte[] bt = strSrc.getBytes();  
	        md.update(bt);  
	        String strDes = bytes2Hex(md.digest());  
	        return strDes;  
	    }  
	    private static String bytes2Hex(byte[] bts) {  
	        StringBuffer des = new StringBuffer();  
	        String tmp = null;  
	        for (int i = 0; i < bts.length; i++) {  
	            tmp = (Integer.toHexString(bts[i] & 0xFF));  
	            if (tmp.length() == 1) {  
	                des.append("0");  
	            }  
	            des.append(tmp);  
	        }  
	        return des.toString();  
	    } 
	    
	    /**
	     * 描述：根据ID获取用户详情
	     * @param id
	     * @param model
	     * @return
	     * @author songfayuan
	     * 2017年6月20日下午8:13:37
	     */
	    @SystemControllerLog(description="根据ID查询用户详情...")
	    @RequestMapping("userdetail")
	    public String getUserDetail(@Param("id") Integer id, Model model){
	    	User userdetail = this.userService.findDetailById(id);  //根据ID获取用户详情
	    	//处理时间格式
	    	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    	if (userdetail.getRegisttime()!=null) {
				String createtime = formatter.format(userdetail.getRegisttime());
				userdetail.setCreateDate(createtime);
			}
	    	model.addAttribute("userdetail", userdetail);
	    	logger.info("【操作】：根据ID查询用户详情...");
	    	return "user/userdetail";
	    }
	    
	    /**
	     * 描述：根据id删除接用户列表信息
	     * @param idlist
	     * @return
	     * @author songfayuan
	     * 2017年6月20日下午8:30:38
	     */
	    @SystemControllerLog(description="删除操作：根据id删除用户列表信息...")
		@RequestMapping(value="deleteUserById",method=RequestMethod.POST)
		public String deleteUserById(@RequestParam("idlist") String idlist)
		{
			String[] strArray = null;   
			strArray = idlist.split(",");
			for(int i = 0; i < strArray.length; i++){
				this.userService.delete(Integer.parseInt(strArray[i]));  //根据id进行删除
				logger.info("ID为{}的用户被删除...", strArray[i]);
			}
			return "redirect:/user/userlist";
		}

	    /**
	     * 描述：退出登录
	     * @param request
	     * @param response
	     * @return
	     * @author songfayuan
	     * 2017年6月17日上午11:09:54
	     */
	    @SystemControllerLog(description="退出登录")
		@RequestMapping(value = "logout", method = RequestMethod.GET)
		public String logout(HttpServletRequest request, HttpServletResponse response)
		{
			HttpSession session = request.getSession();
			session.setAttribute("user", null);
			session.removeAttribute("user");
			session.setAttribute("resourceid", null);
			session.removeAttribute("resourceid");
			logger.info("用户退出登录...");
			return "redirect:/user/login";
		}
	    
	    /**
	     * 描述：查询管理员列表
	     * @param pageno
	     * @param pagesize
	     * @param model
	     * @return
	     * @author songfayuan
	     * 2017年6月21日下午3:13:15
	     */
	    @SystemControllerLog(description="查询管理员列表")
		@RequestMapping(value = "adminlist",method = RequestMethod.GET)
		public String getAdminList(User userModel,HttpServletRequest request,
				@RequestParam(value = "pageno",defaultValue = "1") Integer pageno,
				@RequestParam(value = "pagesize",defaultValue = "10") Integer pagesize,Model model){
			PageInfomation<User> userList = this.userService.getAdminList(userModel,pageno, pagesize);
			//处理时间格式问题
			for(Integer i =0;i<userList.getContent().size();i++){
				User user = userList.getContent().get(i);
				DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			    String createtime=formatter.format( user.getRegisttime() );
			    user.setCreateDate(createtime);
			    
			    List<UserRole> rolelist = this.userRoleService.getRoleByUserId(user.getId()); //查询角色
			    StringBuffer str = new StringBuffer();
			    if( rolelist.size()>0 && rolelist!=null){
				    for(int j = 0; j < rolelist.size(); j++){
				    	UserRole userrole = rolelist.get(j);
				    	
				    	List<Role> role = this.roleService.getRoleById(userrole.getRoleid());  //根据角色id查询角色名称
				    	for(int k=0; k<role.size(); k++){
				    		Role ro = role.get(k);
					    	str.append(ro.getName()+",");   //追加权限名称
				    	}
				    }
			    }
			    if(str.length()>0)
			    {
			    	 user.setUserrole(str.toString().substring(0, str.toString().length()-1));   //设置权限名称
			    }
			}
			List<Role> rolelist = this.roleService.getList();  //获取权限名称
			model.addAttribute("rolelist", rolelist);
			model.addAttribute("userList", userList);
			model.addAttribute("roleid", 1);
			
			//登录者信息
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			model.addAttribute("user", user);
			return "user/adminlist";
		}
	    
	    /**
	     * 描述：跳转到管理员添加页面
	     * @param model
	     * @return
	     * @author songfayuan
	     * 2017年6月21日下午3:51:27
	     */
	    @SystemControllerLog(description="页面跳转操作：跳转到管理员添加页面...")
		@RequestMapping(value = "/goadminadd", method = RequestMethod.GET)
		public String goToAdd(Model model) {
			List<Role> rolelist = this.roleService.getList();  //获取权限名称
			
			for (int i = 0; i < rolelist.size(); i++) { 
				if ("接单人".equals(rolelist.get(i).getName())) { 
					rolelist.remove(i); 
					i--; 
				}
			} 
			model.addAttribute("rolelist", rolelist);
			return "user/adminadd";
		}
		
		/**
		 * 描述：保存添加的管理员/客户
		 * @param roleid
		 * @param dates
		 * @param user
		 * @param model
		 * @return
		 * @throws NoSuchAlgorithmException
		 * @throws ParseException
		 * @author songfayuan
		 * 2017年6月21日下午3:51:41
		 */
		@SystemControllerLog(description="保存添加的管理员")
		@RequestMapping(value = "saveadmin", method = RequestMethod.POST)
		public String save(@RequestParam("roleid") Integer roleid,@RequestParam("dates") String dates,User user,Model model) throws Exception{
			MessageDigest md = MessageDigest.getInstance("MD5");
			String md5Pass = MD5(user.getPassword(),md);
			user.setPassword(md5Pass);
			//======================创建时间============================
			Long timeStemp = System.currentTimeMillis();
			BigInteger time = new BigInteger(timeStemp.toString());
			user.setRegisttime(time);   //创建时间
			
			//====================保存用户出生日期====================
			 SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyy-MM-dd");
			 Date date=simpleDateFormat.parse(dates);
			 Long birthdaystemp = date.getTime();
			 BigInteger time1 = new BigInteger(birthdaystemp.toString());
			 user.setBirthday(time1);//出生日期
			//金额初始化 ===  不用可以删除  
				user.setBalance(new BigDecimal(0));
				user.setTodaymoney(new BigDecimal(0));
				user.setTotalmoney(new BigDecimal(0));
			 this.userService.save(user);
			 
			//====================保存角色========================
			UserRole userrole = new UserRole();
			userrole.setUserid(user.getId());//用户
			userrole.setRoleid(roleid);//角色
			this.userRoleService.save(userrole);
			return "redirect:/user/adminlist";
		}
		
		/**
		 * 描述：检查管理员用户名是否可以注册
		 * @param request
		 * @param username
		 * @return
		 * @throws IOException
		 * @author songfayuan
		 * 2017年6月21日下午4:49:27
		 */
		@SystemControllerLog(description="检查管理员用户名是否可以注册")
		@RequestMapping(value = "checkusername")
		@ResponseBody
		public String checkUsername(HttpServletRequest request, @RequestParam(value="username") String username) throws IOException
		{
			List<User> list = userService.findUserByUsername(username);
			String result="";
			if (list.isEmpty()) {
				result="yes";
			}
			if(!list.isEmpty()){
				result="no";
			}
			return result;
		}
		
		/**
		 * 描述：跳转到管理员编辑页面
		 * @param id
		 * @param model
		 * @return
		 * @author songfayuan
		 * 2017年6月21日下午4:54:20
		 */
		@SystemControllerLog(description="页面跳转操作：跳转到管理员信息编辑页面...")
		@RequestMapping(value="/editadmin",method = RequestMethod.GET)
		public String editUser(@Param("id") Integer id,Model model)
		{
			
			User admin = this.userService.findById(id);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String date = sdf.format(new Date(Long.valueOf(admin.getBirthday().toString())));
			admin.setBirthdayTime(date);
			model.addAttribute("admin",admin);
			
			UserRole userrole = this.userRoleService.getUserRoleById(id); //查询管理员角色
			List<Role> rolelist = this.roleService.getList();  //获取权限名称
			model.addAttribute("rolelist", rolelist);
			model.addAttribute("userrole", userrole);
			return "user/editadmin";
		}
		
		/**
		 * 描述：更新编辑过的管理员的数据
		 * @param roleid
		 * @param dates
		 * @param user
		 * @param model
		 * @return
		 * @throws ParseException
		 * @author songfayuan
		 * 2017年6月21日下午5:00:51
		 */
		@SystemControllerLog(description="保存操作：更新编辑过的管理员的数据")
		@RequestMapping(value = "saveedit", method = RequestMethod.POST)
		public String saveedit(@RequestParam("roleid") Integer roleid,@RequestParam("dates") String dates,User user,Model model) throws Exception{
			
			SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyy-MM-dd");
			 Date date=simpleDateFormat.parse(dates);
			 Long birthdaystemp = date.getTime();
			 BigInteger time1 = new BigInteger(birthdaystemp.toString());
			 user.setBirthday(time1);//创建时间
			 
			this.userService.update(user);
			//====================保存角色========================
			this.userRoleService.deleteByUserId(user.getId());   //删除原有角色
			
			UserRole userrole = new UserRole();
			userrole.setUserid(user.getId());//用户
			userrole.setRoleid(roleid);//新增新的角色
			this.userRoleService.save(userrole);
			return "redirect:/user/adminlist";
		}
		
		/**
		 * 描述：根据id删除管理员数据
		 * @param id
		 * @return
		 * @author songfayuan
		 * 2017年6月21日下午5:05:45
		 */
		@SystemControllerLog(description="删除操作：根据id删除管理员数据")
		@RequestMapping(value="/deleteadmin",method = RequestMethod.GET)
		public String deleteAdminById(@RequestParam("id") Integer id){
			this.userService.delete(id); 
			this.userRoleService.deleteByUserId(id);  //删除角色表数据
			return "redirect:/user/adminlist";
		}
		
		/**
		 * 描述：重置用户密码
		 * @param request
		 * @param redirectAttributes
		 * @param user
		 * @return
		 * @throws NoSuchAlgorithmException
		 * @author songfayuan
		 * 2017年6月21日下午10:29:57
		 */
		@RequestMapping(value="resetpassword",method = RequestMethod.GET)
		public String resetUserPassword(HttpServletRequest request,RedirectAttributes redirectAttributes, User user) throws NoSuchAlgorithmException
		{
			MessageDigest md = MessageDigest.getInstance("MD5");
			String md5Pass = MD5("123456",md);
			User users = this.userService.findById(user.getId());
			users.setPassword(md5Pass);
			this.userService.update(users);
			return "redirect:/user/adminlist";
		}
		
		/**
		 * 描述：跳转到修改密码页面
		 * @param request
		 * @param response
		 * @param model
		 * @return
		 * @author songfayuan
		 * 2017年6月21日下午10:43:13
		 */
		@RequestMapping(value = "toeidtadminpw", method = RequestMethod.GET)
		public String toeidtadminpw(HttpServletRequest request, HttpServletResponse response,Model model) {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			model.addAttribute("user", user);
			return "user/editadminpassword";
		}
		
		/**
		 * 描述：更新修改管理员密码
		 * @param request
		 * @param redirectAttributes
		 * @param user
		 * @return
		 * @throws NoSuchAlgorithmException
		 * @author songfayuan
		 * 2017年6月21日下午10:44:43
		 */
		@RequestMapping(value="updateadminpassword",method = RequestMethod.POST)
		public String updateadminpassword(HttpServletRequest request,RedirectAttributes redirectAttributes,User user) throws NoSuchAlgorithmException
		{   
			HttpSession session = request.getSession();
			MessageDigest md = MessageDigest.getInstance("MD5");
			String md5Pass = MD5(user.getPassword(),md);
			User users = this.userService.findById(user.getId());
			users.setPassword(md5Pass);
			this.userService.update(users);
		
			session.setAttribute("user", null);
			session.removeAttribute("user");
			session.setAttribute("resourceid", null);
			session.removeAttribute("resourceid");
			
			return "redirect:/user/login";
		}
	
}
