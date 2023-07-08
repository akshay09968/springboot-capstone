package coms.Medicare;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Medicare {

	public static void main(String[] args) {
		SpringApplication.run(Medicare.class, args);
		System.out.println("Server Started....");
	}
}
