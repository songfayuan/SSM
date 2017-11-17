/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.service
 * 创建时间：2017年6月17日上午2:10:40
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.service;

import java.util.List;

import com.songfayuan.ssm.entity.Roleresource;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月17日上午2:10:40
 */
public interface RoleResourceService {

	// 获取权限内容
	public List<Roleresource> getRoleResource(Integer roleid);

	public void deleteByRoleId(Integer roleid);

	public void save(Roleresource roleResource);

}
