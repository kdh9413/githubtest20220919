package com.example.naverai;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration // xml 파일 대신 설정
public class MyWebConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/upload/**").addResourceLocations("file:///Users/dhk/Downloads/ai_images");
		registry.addResourceHandler("/naverai/**").addResourceLocations("file:///" + NaverInform.path);
	}

	
}
