package com.kitri.shop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages= {"com.kitri.shop"})
public class BestShopApplication {

	public static void main(String[] args) {
		SpringApplication.run(BestShopApplication.class, args);
	}

}
