package com.onul;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

// @EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
@ComponentScan(basePackages = "com.onul")
@SpringBootApplication
public class OnulApplication {

	public static void main(String[] args) {
		SpringApplication.run(OnulApplication.class, args);
	}

}
