package com.example.onlinestore.controllers;

import com.example.onlinestore.entites.Product;
import com.example.onlinestore.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {
    private final ProductService ps;

    @GetMapping("/")
    public String main(Model m){
        List<Product> lst = ps.getProducts();
        if (lst.size() > 0){
            m.addAttribute("products", ps.getProducts());
        }

        return "main";
    }
}
