package com.example.naverai;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication //spring boot app 실행 tomcat 내장 실행 - 8080
@ComponentScan(basePackages = "chatbot")
@ComponentScan(basePackages = "test")
@ComponentScan(basePackages = "ocr")
@ComponentScan(basePackages = "voice")
@ComponentScan(basePackages = "csr")
@ComponentScan(basePackages = "object")
@ComponentScan(basePackages = "pose")
@ComponentScan(basePackages = "cfr")
@ComponentScan
public class NaveraiApplication {

	public static void main(String[] args) {
		SpringApplication.run(NaveraiApplication.class, args);
		System.out.println("프로젝트 팀장이 추가하는 라인");
		System.out.println("프로젝트 팀원이 추가하는 라인");
		System.out.println("프로젝트 팀장이 동시에 추가하는 라인");
	}

}
