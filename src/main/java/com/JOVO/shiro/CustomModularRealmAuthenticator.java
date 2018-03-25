package com.JOVO.shiro;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.pam.ModularRealmAuthenticator;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.ShiroException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.util.CollectionUtils;

public class CustomModularRealmAuthenticator extends ModularRealmAuthenticator {
	private Map<String, Object> definedRealms;

    @Override
    protected AuthenticationInfo doAuthenticate(AuthenticationToken authenticationToken)
            throws AuthenticationException {
        // �ж�getRealms()�Ƿ񷵻�Ϊ��
        assertRealmsConfigured();
        // ǿ��ת�����Զ����CustomizedToken
        UserLoginToken token = (UserLoginToken) authenticationToken;
        // �ҵ���ǰ��¼�˵ĵ�¼����
        String loginType = token.getLoginType();
        // ����Realm
        Collection<Realm> realms = getRealms();
        // �ҵ���¼���Ͷ�Ӧ��ָ��Realm
        Collection<Realm> typeRealms = new ArrayList<Realm>();
        for (Realm realm : realms) {
            if (realm.getName().toLowerCase().contains(loginType))
                typeRealms.add(realm);
        }

        // �ж��ǵ�Realm���Ƕ�Realm
        if (typeRealms.size() == 1)
            return doSingleRealmAuthentication(typeRealms.iterator().next(), token);
        else
            return doMultiRealmAuthentication(typeRealms, token);
    }


    /** 
     * �ж�realm�Ƿ�Ϊ�� 
     */  
    @Override  
    protected void assertRealmsConfigured() throws IllegalStateException {  
        this.definedRealms = this.getDefinedRealms();  
        if (CollectionUtils.isEmpty(this.definedRealms)) {  
            throw new ShiroException("ֵ���ݴ���!");  
        }  
    }  

    public Map<String, Object> getDefinedRealms() {  
        return this.definedRealms;  
    }  

    public void setDefinedRealms(Map<String, Object> definedRealms) {  
        this.definedRealms = definedRealms;  
    }  

}
