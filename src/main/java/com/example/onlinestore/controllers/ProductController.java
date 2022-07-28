package com.example.onlinestore.controllers;

import com.example.onlinestore.entites.Product;
import com.example.onlinestore.services.CategoryService;
import com.example.onlinestore.services.ProductService;
import com.example.onlinestore.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class ProductController {
    private final ProductService productService;
    private final UserService userService;
    private final CategoryService categoryService;

    @PostMapping("/product/add")
    public String add(Product p, Principal prn, Model m, @RequestParam String categoryName){
        m.addAttribute("message", "Товар успешно добавлен");
        m.addAttribute("user", userService.getUserByPrincipal(prn));
        p.setCategory(categoryService.getCategoryByTitle(categoryName));
        productService.addProduct(p);
        return "succeedAdd";
    }
}
