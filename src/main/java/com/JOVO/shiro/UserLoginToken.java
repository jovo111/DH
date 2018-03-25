package com.JOVO.shiro;

import org.apache.shiro.authc.UsernamePasswordToken;

public class UserLoginToken extends UsernamePasswordToken{
	private static final long serialVersionUID = -2505524772633476867L;
	
	private String loginType;
	
	public UserLoginToken(){}
	
	public UserLoginToken(final String username,final String password,final String loginType){
		super(username,password);
		this.loginType=loginType;
	}

	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}
	
	
}
