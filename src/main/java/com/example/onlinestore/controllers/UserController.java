package com.example.onlinestore.controllers;

import com.example.onlinestore.entites.User;
import com.example.onlinestore.services.UserService;
import com.example.onlinestore.util.UserValidator;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class UserController{
    private final UserService us;
    private final UserValidator validator;
    @GetMapping("/login")
    public String loginPage(){
        return "login";
    }

    @GetMapping("/registration")
    public String registrationPage(){
        return "registration";
    }

    @PostMapping("/registration")
    public String registration(User user, Model m, BindingResult result){
        System.out.println(user);
        validator.validate(user, result);
        if (result.hasErrors()){
            Map<String, String> errors = ControllerUtils.getErrors(result);

            m.mergeAttributes(errors);
            System.out.println(errors);
            return "registration";
        }

        us.registerUser(user);
        return "redirect:/`";



    }



    @GetMapping("/logout/success")
    public String successLogout(Model m, Principal p){
        m.addAttribute(us.getUserByPrincipal(p));
        return "successLogout";
    }
}
