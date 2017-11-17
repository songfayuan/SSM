/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.service.impl
 * 创建时间：2017年6月14日下午6:57:03
 * 创建者：Administrator-宋发元
 * 创建地点：北京清科科技股份有限公司
 */
package com.songfayuan.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.songfayuan.ssm.dao.RoleDao;
import com.songfayuan.ssm.entity.Role;
import com.songfayuan.ssm.service.RoleService;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月14日下午6:57:03
 */
@Service
public class RoleServiceImpl implements RoleService {
	
	@Resource
	private RoleDao roleServiceDao;

	//获取角色
	public List<Role> getRoleList() {
		return this.roleServiceDao.getRoleList();
	}

	//角色列表
	public List<Role> getList() {
		return this.roleServiceDao.getList();
	}

	public void delete(Integer roleid) {
		this.roleServiceDao.delete(roleid);
	}

	public Role get(Integer roleid) {
		return this.roleServiceDao.get(roleid);
	}

	public void save(Role role) {
		this.roleServiceDao.save(role);
	}

	//根据角色id查询角色名称
	public List<Role> getRoleById(Integer roleid) {
		return this.roleServiceDao.getRoleById(roleid);
	}
	
}
