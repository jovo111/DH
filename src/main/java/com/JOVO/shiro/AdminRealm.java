package com.JOVO.shiro;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.SubjectContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.JOVO.model.Admin;
import com.JOVO.service.AdminService;

//查询数据库
public class AdminRealm extends AuthorizingRealm {
	private static Logger LOGGER = LoggerFactory.getLogger(AdminRealm.class);
	
	@Autowired
	AdminService adminService;

	@Override
	public String getName() {
		return UserType.Admin;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		Subject current = SecurityUtils.getSubject();
		String adminName = upToken.getUsername();

		Admin admin = adminService.getOne(adminName);

		SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(admin, admin.getApwd(),
				this.getName());
//		
//		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(admin);
//        //通过源码分析在调用subject.login(token)后，会通过SubjectContext来保存到session，所以就直接复用了源码（DefaultSecurityManager类中）
//        SubjectContext subjectContext = new DefaultSubjectContext();
//        subjectContext.setAuthenticated(true);
//        subjectContext.setAuthenticationToken(token);
//        subjectContext.setAuthenticationInfo(info);

		
		return authenticationInfo;
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.addRole(UserType.Admin);
		return info;
	}

}
