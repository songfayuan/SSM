/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.entity
 * 创建时间：2017年6月14日下午6:53:38
 * 创建者：Administrator-宋发元
 * 创建地点：北京清科科技股份有限公司
 */
package com.songfayuan.ssm.entity;

import java.io.Serializable;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月14日下午6:53:38
 */
public class Role implements Serializable {

	private static final long serialVersionUID = 7607543823254977689L;

	private int roleid;

	private String name;
	
	private Integer rolepeoples;	//角色人数
	
	public int getRoleid() {
		return roleid;
	}

	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getRolepeoples() {
		return rolepeoples;
	}

	public void setRolepeoples(Integer rolepeoples) {
		this.rolepeoples = rolepeoples;
	}
	
}
