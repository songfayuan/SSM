/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.entity
 * 创建时间：2017年6月17日上午2:07:47
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.entity;

import java.io.Serializable;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月17日上午2:07:47
 */
public class Roleresource implements Serializable {

	private static final long serialVersionUID = 6726489919094244187L;

	private int roleresourceid;

	private Integer resourceid;

	private int roleid;

	public int getRoleresourceid() {
		return roleresourceid;
	}

	public void setRoleresourceid(int roleresourceid) {
		this.roleresourceid = roleresourceid;
	}

	public Integer getResourceid() {
		return resourceid;
	}

	public void setResourceid(Integer resourceid) {
		this.resourceid = resourceid;
	}

	public int getRoleid() {
		return roleid;
	}

	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}
	
}
