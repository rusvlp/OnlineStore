package com.example.onlinestore.controllers;

import com.example.onlinestore.services.CategoryService;
import com.example.onlinestore.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class AdminController {
    private final UserService userService;
    private final CategoryService categoryService;

    @GetMapping("/adminPanel")
    public String add(Model m, Principal p){
        m.addAttribute("categories", categoryService.getAllCategories());
        m.addAttribute("user", userService.getUserByPrincipal(p));
        m.addAttribute("message", "Товар успешно добавлен");
        return "adminPanel";
    }
}
