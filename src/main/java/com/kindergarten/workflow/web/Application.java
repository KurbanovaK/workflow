package com.kindergarten.workflow.web;

import com.kindergarten.workflow.web.config.EncriptionConfig;
import com.kindergarten.workflow.web.config.MvcConfig;
import com.kindergarten.workflow.web.config.WebSecurityConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

@SpringBootApplication
@EnableJpaRepositories("com.kindergarten.workflow.data")
@EntityScan("com.kindergarten.workflow.domain")
@ComponentScan({"com.kindergarten.workflow.web.controllers", "com.kindergarten.workflow.services"})
@Import({WebSecurityConfig.class, MvcConfig.class, EncriptionConfig.class})
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}