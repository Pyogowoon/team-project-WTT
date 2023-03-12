package com.prec;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@SpringBootApplication
@EnableAspectJAutoProxy
public class FProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(FProjectApplication.class, args);
	}

}
