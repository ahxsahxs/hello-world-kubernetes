package br.com.dev_antonio.helloworld.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CHelloWorld {
    
    @GetMapping("/")
    public String helloWorld() {
        return "Hello World!";
    }
}
