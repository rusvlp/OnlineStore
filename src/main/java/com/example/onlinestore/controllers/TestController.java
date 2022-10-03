package com.example.onlinestore.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Slf4j
public class TestController {
    @GetMapping("/test")
    public String test(){
        return "test";
    }

    @GetMapping("/testCsrfFetch")
    public String csrf(){
        return "csrfTest";
    }

    @ResponseBody
    @PostMapping("/testCsrfPost")
    public String testPost(String text){
        log.info("Got POST request with text: " + text);
        return "success";
    }
}
