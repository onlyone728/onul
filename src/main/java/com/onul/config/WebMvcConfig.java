package com.onul.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.onul.common.FileManagerService;
import com.onul.intercepter.PermissionInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Autowired
	private PermissionInterceptor interceptor;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		.addResourceHandler("/images/**")
<<<<<<< HEAD
		.addResourceLocations("file://" + FileManagerService.FILE_UPLOAD_PATH);
=======
		.addResourceLocations("file:/Users/wonny/Desktop/workspace/workspace_onul/images/");
>>>>>>> develop
	}
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor)
		.addPathPatterns("/**")
		.excludePathPatterns("/css/**", "/js/**", "/image/**", "/error", "/user/sign_out");
	}
	
	
}
