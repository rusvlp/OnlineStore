package com.example.onlinestore.controllers;

import com.example.onlinestore.entites.Category;
import com.example.onlinestore.services.CategoryService;
import com.example.onlinestore.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private UserService userService;


    @PostMapping("/add")
    private String add(Category category, Principal p, Model m){
        m.addAttribute("user", userService.getUserByPrincipal(p));
        m.addAttribute("message", "Категория успешно добавлена");
        categoryService.addCategory(category);
        return "succeedAdd";
    }


}
