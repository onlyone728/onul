package com.onul;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

// @EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
@ComponentScan(basePackages = "com.onul")
@SpringBootApplication
public class OnulApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(OnulApplication.class, args);
	}

}
