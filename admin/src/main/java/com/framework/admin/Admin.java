package com.framework.admin;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;


@MapperScan("com.framework.core.modules.sys.mapper*")
@SpringBootApplication
@ComponentScan("com.framework")
public class Admin {
	public static void main(String[] args) {
		SpringApplication.run(Admin.class, args);
	}

}
