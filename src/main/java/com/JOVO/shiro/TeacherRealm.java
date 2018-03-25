package com.JOVO.shiro;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.JOVO.model.Admin;
import com.JOVO.model.Teacher;
import com.JOVO.model.TeacherDetail;
import com.JOVO.service.AdminService;
import com.JOVO.service.face.qtTeacherService;

public class TeacherRealm extends AuthorizingRealm  {
	@Autowired
	qtTeacherService teacherService;

	@Override
	public String getName() {
		return UserType.Teacher;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		String teacherName = upToken.getUsername();
		
		Teacher teacher = teacherService.getOne(teacherName);

		SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(teacher, teacher.getTpwd(), this.getName());

		return authenticationInfo;
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.addRole(UserType.Teacher);
		return info;
	}

}
