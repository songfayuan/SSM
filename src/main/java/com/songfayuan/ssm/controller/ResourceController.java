/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.controller
 * 创建时间：2017年6月21日上午10:56:08
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.controller;

import java.net.URLDecoder;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.songfayuan.ssm.entity.Resource;
import com.songfayuan.ssm.entity.ResourceEx;
import com.songfayuan.ssm.entity.Role;
import com.songfayuan.ssm.entity.Roleresource;
import com.songfayuan.ssm.entity.User;
import com.songfayuan.ssm.entity.UserRole;
import com.songfayuan.ssm.service.ResourceService;
import com.songfayuan.ssm.service.RoleResourceService;
import com.songfayuan.ssm.service.RoleService;
import com.songfayuan.ssm.service.UserRoleService;
import com.songfayuan.ssm.service.UserService;
import com.songfayuan.ssm.util.ValidateUtil;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月21日上午10:56:08
 */
@Controller
@RequestMapping(value = "/resource")
public class ResourceController {

	Logger logger = LoggerFactory.getLogger(ResourceController.class);
	
	@Autowired
	private UserService userService;
	@Autowired
	private ResourceService resourceService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private UserRoleService userRoleService;
	@Autowired
	private RoleResourceService roleResourceService;
	
	/**
	 * 描述：角色列表
	 * @param model
	 * @return
	 * @author songfayuan
	 * 2017年6月21日上午10:58:01
	 */
	@SystemControllerLog(description="获取角色列表")
	@RequestMapping(value="rolelist", method=RequestMethod.GET)
	public String rolelist(Model model){
		
		List<UserRole> userroleList = this.userRoleService.getList();	//用户角色列表
		List<Role> roleList = this.roleService.getList();	//角色列表
		
		for (Role role : roleList) {
			int i = 0;
			for (UserRole userrole : userroleList) {
				if(userrole.getRoleid() == role.getRoleid()){
					role.setRolepeoples(++i);
				}
			}
			
		}
		
		model.addAttribute("roleList", roleList);
		
		return "resource/rolelist";
	}
	
	/**
	 * 描述：删除角色
	 * @param roleid
	 * @param redirect
	 * @return
	 * @author songfayuan
	 * 2017年6月21日上午11:41:26
	 */
	@SystemControllerLog(description="删除角色")
	@RequestMapping("delrole")
	public String delRole(@RequestParam("roleid")Integer roleid, RedirectAttributes redirect){
		
		this.roleService.delete(roleid);
		this.roleResourceService.deleteByRoleId(roleid);
		
		return "redirect:/resource/rolelist";
	}
	
	/**
	 * 描述：权限列表
	 * @param roleid
	 * @param model
	 * @return
	 * @author songfayuan
	 * 2017年6月21日上午11:57:26
	 */
	@SystemControllerLog(description="获取权限列表")
	@RequestMapping(value="givenresource", method=RequestMethod.GET)
	public String givenresource(
			@RequestParam("roleid")Integer roleid,
			Model model){
		
		LinkedList<ResourceEx> resource = new LinkedList<ResourceEx>();
		for(Resource r: this.resourceService.findByParentResourceId(0))
		{
			ResourceEx rex = new ResourceEx();
			rex.setResource(r);
			rex.setSubResource(this.resourceService.findByParentResourceId(r.getResourceid()));
			
			resource.add(rex);
		}
		
		List<Roleresource> roleresourcelist = this.roleResourceService.getRoleResource(roleid);	//角色拥有的权限
		String roleresources = "";
		for (Roleresource roleresource : roleresourcelist) {
			roleresources += roleresource.getResourceid().toString() + ",";
		}
		
		model.addAttribute("role", this.roleService.get(roleid));
		model.addAttribute("roleresources", roleresources);
		model.addAttribute("resource", resource);
 		
		return "resource/givenresource";
	}
	
	/**
	 * 描述：保存权限
	 * @param role
	 * @param selectresource
	 * @param request
	 * @param response
	 * @return
	 * @author songfayuan
	 * 2017年6月21日下午1:25:58
	 */
	@SystemControllerLog(description="保存权限")
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("role") Role role, @RequestParam("selectresource") String selectresource, HttpServletRequest request, HttpServletResponse response)
	{
//		this.roleService.save(role);
//		Role r = role;
		System.out.println("id="+role.getRoleid()+"name:"+role.getName());
		if(selectresource != null && selectresource.trim().length() > 0)
		{
			this.roleResourceService.deleteByRoleId(role.getRoleid());
			
			String[] temp = selectresource.split(",");
			for(String resourceid : temp)
			{
				if(resourceid.trim().length() == 0)
				{
					continue;
				}
				
				Roleresource roleResource  = new Roleresource();
				roleResource.setRoleid(role.getRoleid());
				roleResource.setResourceid(Integer.parseInt(resourceid));
				this.roleResourceService.save(roleResource);
			}
		}
		
		
		//重新加载权限信息
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
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
			session.setAttribute("user", user);
			session.setAttribute("resourceid", resourcesString);
		}
		
		return "redirect:/resource/rolelist";
	}
	
	/**
	 * 描述：创建角色
	 * @param role
	 * @param redirect
	 * @return
	 * @author songfayuan
	 * 2017年6月21日下午1:35:40
	 */
	@SystemControllerLog(description="创建角色")
	@RequestMapping("createrole")
	public String createrole(Role role, RedirectAttributes redirect){
		
		if(!ValidateUtil.isObjectNotnull(role.getRoleid())){
			String decodename = URLDecoder.decode(role.getName());
			role.setName(decodename);
		}
		this.roleService.save(role);
		redirect.addFlashAttribute("message", "角色创建成功");
		return "redirect:/resource/rolelist";
	}
	

}
