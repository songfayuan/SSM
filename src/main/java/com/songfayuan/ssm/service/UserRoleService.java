/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.service
 * 创建时间：2017年6月17日上午1:54:57
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.service;

import java.util.List;

import com.songfayuan.ssm.entity.UserRole;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月17日上午1:54:57
 */
public interface UserRoleService {

	//获取用户角色
	List<UserRole> getUserRole(Integer userid);

	//用户角色列表
	List<UserRole> getList();

	//查询角色
	List<UserRole> getRoleByUserId(Integer userid);

	void save(UserRole userrole);

	UserRole getUserRoleById(Integer userid);

	void deleteByUserId(Integer userid);

}
