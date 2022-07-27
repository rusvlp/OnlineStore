package com.example.onlinestore.controllers;

import com.example.onlinestore.entites.Product;
import com.example.onlinestore.services.ProductService;
import com.example.onlinestore.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {
    private final ProductService ps;
    private final UserService us;

    @GetMapping("/")
    public String main(Model m, Principal p){
        if (p != null){
            m.addAttribute("user", us.getUserByPrincipal(p));
        }


        List<Product> lst = ps.getProducts();
        if (lst.size() > 0){
            m.addAttribute("products", ps.getProducts());
        }

        return "main";
    }
}
