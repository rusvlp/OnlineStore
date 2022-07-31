package com.example.onlinestore.controllers;

import com.example.onlinestore.entites.Product;
import com.example.onlinestore.services.CategoryService;
import com.example.onlinestore.services.ProductService;
import com.example.onlinestore.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
@RequestMapping("/product")
public class ProductController {
    private final ProductService productService;
    private final UserService userService;
    private final CategoryService categoryService;

    @PostMapping("/add")
    public String add(Product p, Principal prn, Model m, @RequestParam String categoryName){
        m.addAttribute("message", "Товар успешно добавлен");
        m.addAttribute("user", userService.getUserByPrincipal(prn));
        p.setCategory(categoryService.getCategoryByTitle(categoryName));
        productService.addProduct(p);
        return "succeedAdd";
    }

    @GetMapping("/{id}")
    public String getInfo(@PathVariable Long id, Principal p, Model m){
        m.addAttribute("user", userService.getUserByPrincipal(p));
        m.addAttribute("product", productService.getProductById(id));
        m.addAttribute("categories", categoryService.getAllCategories());
        return "productInfo";
    }

    @PostMapping("/{id}/delete")
    public String deleteProduct(@PathVariable Long id, Principal p, Model m){
        m.addAttribute("user", userService.getUserByPrincipal(p));
        m.addAttribute("message", "Удалено!");
        productService.deleteProductById(id);
        return "succeedAdd";
    }

    @PostMapping("/{id}/edit")
    public String edit(Product newProduct, Principal p, Model m, @RequestParam String categoryName){
        m.addAttribute("user", userService.getUserByPrincipal(p));
        newProduct.setCategory(categoryService.getCategoryByTitle(categoryName));
        productService.updateProduct(newProduct);
        m.addAttribute("product", newProduct);
        m.addAttribute("message", "Товар успешно добавлен");
        return "succeedAdd";
    }
}
