package com.example.onlinestore.controllers;

import com.example.onlinestore.entites.User;
import com.example.onlinestore.exceptions.UserExistException;
import com.example.onlinestore.repositories.UserRepository;
import com.example.onlinestore.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@RequiredArgsConstructor
public class UserController{
    private final UserService us;

    @GetMapping("/login")
    public String loginPage(){
        return "login";
    }

    @GetMapping("/registration")
    public String registrationPage(){
        return "registration";
    }

    @PostMapping("/registration")
    public String registration(User user, Model m){
        System.out.println(user);
        try{
            us.registerUser(user);
            return "redirect:/";
        } catch (UserExistException ues) {
            m.addAttribute("userExistError", "Пользователь с таким E-Mail уже зарегистрирован");
            return "registration";
        }

    }
}
