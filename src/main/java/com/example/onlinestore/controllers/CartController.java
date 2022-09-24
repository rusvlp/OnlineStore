package com.example.onlinestore.controllers;

import com.example.onlinestore.entites.Cart;
import com.example.onlinestore.entites.Product;
import com.example.onlinestore.entites.User;
import com.example.onlinestore.services.CartService;
import com.example.onlinestore.services.ProductService;
import com.example.onlinestore.services.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.Principal;

@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
@Slf4j
public class CartController {
    private final UserService userService;
    private final CartService cartService;
    private final ProductService productService;
    @GetMapping()
    public String cartInfo(Model model, Principal principal){
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("cart", user.getCart());
        return "cart";
    }

    @PostMapping("/addProduct")
    public String addProduct(Long productId, Principal p){
        User user = userService.getUserByPrincipal(p);
        Product product = productService.getProductById(productId);
        cartService.addProduct(product, user);
        log.info("called addProduct() method from controller");
        return "redirect:/cart";
    }

    @ResponseBody
    @PostMapping("/clean")
    public String clean(Principal p){
        Cart cart = userService.getUserByPrincipal(p).getCart();
        cart.clean();
        cartService.saveCart(cart);
        return "cleand";
    }

    @ResponseBody
    @PostMapping("/increase")
    public String increase(Principal p, Long productId){
        Product product = productService.getProductById(productId);
        User user = userService.getUserByPrincipal(p);
        cartService.increaseQuantity(product, user);
        log.info("Value of product with id " + productId + " INCREASED to user with email" + user.getEmail());
        return "increased";
    }

    @ResponseBody
    @PostMapping("/decrease")
    public String decrease(Principal p, Long productId){
        Product product = productService.getProductById(productId);
        User user = userService.getUserByPrincipal(p);
        cartService.decreaseQuantity(product, user);
        log.info("Value of product with id " + productId + " DECREASED to user with email" + user.getEmail());
        return "decreased";
    }
    @ResponseBody
    @PostMapping("/remove")
    public String remove(Principal p, Long productId){
        Product product = productService.getProductById(productId);
        User user = userService.getUserByPrincipal(p);
        cartService.removeProduct(product, user);
        return "removed"; //"redirect:cart";
    }
}
