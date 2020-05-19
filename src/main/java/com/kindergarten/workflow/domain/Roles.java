package com.kindergarten.workflow.domain;

import org.springframework.security.core.GrantedAuthority;

public enum Roles implements GrantedAuthority {
    User,
    Executor,
    Supervisor,
    Admin,
    Clerk;


    @Override
    public String getAuthority(){
        return name();
    }
}
