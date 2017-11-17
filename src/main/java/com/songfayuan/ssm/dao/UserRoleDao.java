/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.dao
 * 创建时间：2017年6月17日上午1:57:29
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.songfayuan.ssm.entity.UserRole;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月17日上午1:57:29
 */
public interface UserRoleDao {

	//获取用户角色
	List<UserRole> findUserRoleByUserId(@Param("userid") Integer userid);

	//用户角色列表
	List<UserRole> getList();

	//查询角色
	List<UserRole> getRoleByUserId(@Param("userid") Integer userid);

	void save(UserRole userrole);

	UserRole getUserRoleById(@Param("userid") Integer userid);

	void deleteByUserId(@Param("userid") Integer userid);

}
