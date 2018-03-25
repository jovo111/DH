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

import com.JOVO.model.Student;
import com.JOVO.model.StudentDetail;
import com.JOVO.service.face.qtStudentService;

public class StudentRealm extends AuthorizingRealm{
	@Autowired
	qtStudentService studentService;
	
	@Override
	public String getName() {
		return UserType.Student;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		String studentID = upToken.getUsername();

		Student student = studentService.getOne(studentID);

		SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(student, student.getSpwd(),
				this.getName());
		return authenticationInfo;
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.addRole(UserType.Student);
		return info;
	}
}
