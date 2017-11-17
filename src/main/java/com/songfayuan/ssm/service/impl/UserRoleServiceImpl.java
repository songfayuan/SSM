/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.service.impl
 * 创建时间：2017年6月17日上午1:55:28
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.songfayuan.ssm.dao.UserDao;
import com.songfayuan.ssm.dao.UserRoleDao;
import com.songfayuan.ssm.entity.UserRole;
import com.songfayuan.ssm.service.UserRoleService;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月17日上午1:55:28
 */
@Service
public class UserRoleServiceImpl implements UserRoleService{
	
	@Resource
	private UserRoleDao userRoleDao;

	//获取用户角色
	public List<UserRole> getUserRole(Integer userid) {
		return this.userRoleDao.findUserRoleByUserId(userid);
	}

	//用户角色列表
	public List<UserRole> getList() {
		return this.userRoleDao.getList();
	}

	//查询角色
	public List<UserRole> getRoleByUserId(Integer userid) {
		return this.userRoleDao.getRoleByUserId(userid);
	}

	public void save(UserRole userrole) {
		this.userRoleDao.save(userrole);
	}

	public UserRole getUserRoleById(Integer userid) {
		return this.userRoleDao.getUserRoleById(userid);
	}

	public void deleteByUserId(Integer userid) {
		this.userRoleDao.deleteByUserId(userid);
	}
	
}
