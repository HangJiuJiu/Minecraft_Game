package com.ssm.bean;

/**
 * 管理信息Entity
 */
public class Game{
	
	private Integer id;
	private String name;		// 模组名称
	private String edition;		// 模组版本
	private String type;		// 模组类型
	private String url;		// 下载链接
	private String createtime;		// 发布时间
	private Integer createid;		// 开发者
	private String createname;		// 开发者
	private String state;		// 审核状态：0-未审核；1-通过；2-驳回
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getEdition() {
		return edition;
	}

	public void setEdition(String edition) {
		this.edition = edition;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	
	public Integer getCreateid() {
		return createid;
	}

	public void setCreateid(Integer createid) {
		this.createid = createid;
	}
	
	public String getCreatename() {
		return createname;
	}

	public void setCreatename(String createname) {
		this.createname = createname;
	}
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
}