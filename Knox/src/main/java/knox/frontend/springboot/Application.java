package knox.frontend.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {
    public static void main (String[] args){
        System.out.println("Main");
        SpringApplication.run(Application.class, args);
    }
}
