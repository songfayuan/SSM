/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.service.impl
 * 创建时间：2017年6月17日上午2:10:57
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.songfayuan.ssm.dao.RoleResourceDao;
import com.songfayuan.ssm.entity.Roleresource;
import com.songfayuan.ssm.service.RoleResourceService;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月17日上午2:10:57
 */
@Service
public class RoleResourceServiceImpl implements RoleResourceService {
	
	@Resource
	private RoleResourceDao roleResourceDao;

	// 获取权限内容
	public List<Roleresource> getRoleResource(Integer roleid) {
		return this.roleResourceDao.findByRoleId(roleid);
	}

	public void deleteByRoleId(Integer roleid) {
		this.roleResourceDao.deleteByRoleId(roleid);
	}

	public void save(Roleresource roleResource) {
		this.roleResourceDao.save(roleResource);
	}
	
}
