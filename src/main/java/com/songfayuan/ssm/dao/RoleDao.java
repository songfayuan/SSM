/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.dao
 * 创建时间：2017年6月14日下午6:58:05
 * 创建者：Administrator-宋发元
 * 创建地点：北京清科科技股份有限公司
 */
package com.songfayuan.ssm.dao;

import java.util.List;

import com.songfayuan.ssm.entity.Role;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月14日下午6:58:05
 */
public interface RoleDao {

	//获取角色
	public List<Role> getRoleList();

	//角色列表
	public List<Role> getList();

	public void delete(Integer roleid);

	//根据id得到一个角色
	public Role get(Integer roleid);

	public void save(Role role);

	//根据角色id查询角色名称
	public List<Role> getRoleById(Integer roleid);

}
