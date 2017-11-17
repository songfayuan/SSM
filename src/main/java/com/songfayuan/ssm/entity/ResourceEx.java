package com.songfayuan.ssm.entity;

import java.util.List;



public class ResourceEx {
	
	private Resource resource;
	private List<Resource> subResource;
	
	public Resource getResource()
	{
		return resource;
	}
	
	public void setResource(Resource resource)
	{
		this.resource = resource;
	}

	public List<Resource> getSubResource()
	{
		return subResource;
	}

	public void setSubResource(List<Resource> subResource)
	{
		this.subResource = subResource;
	}
}