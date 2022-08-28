package com.example.onlinestore.controllers;

import com.example.onlinestore.entites.Product;
import com.example.onlinestore.services.ProductService;
import com.example.onlinestore.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class MainController {
    @Value("${mainpage.pagesize}")
    private int pageSize;

    private final ProductService ps;
    private final UserService us;

    @GetMapping("/")
    public String main(Model m, Principal p, @RequestParam(required = false) Integer page, Map<String, String> filterParams){
        System.out.println(filterParams.get("searchQuery"));

        m.addAttribute("user", us.getUserByPrincipal(p));

        List<Product> lst = ps.getProducts();
        if(lst.size() == 0){
            return "main";
        }

        if (page == null){
            page = 1;
        }

        int numberOfPages = (lst.size()-1)/pageSize + 1;
        m.addAttribute("numberOfPages", numberOfPages);


        List<Product> resultSet = new ArrayList<>();
        for (int i = page * pageSize - pageSize; i < lst.size() && i < page * pageSize   ; i++){

            resultSet.add(lst.get(i));
        }

        m.addAttribute("products", resultSet);
        return "main";
    }
}
