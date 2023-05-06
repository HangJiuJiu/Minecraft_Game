package com.ssm.bean;

/**
 * 用户信息Entity
 */
public class User{
	
	private Integer id;
	private String name;		// 账号
	private String phone;		// 电话
	private String auth;		// 用户类型;0管理员；1普通用户
	private String password;		// 密码
	

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
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}