package com.example.onlinestore.controllers;

import com.example.onlinestore.entites.Category;
import com.example.onlinestore.entites.Product;
import com.example.onlinestore.filtering.ProductFilterSet;
import com.example.onlinestore.services.CategoryService;
import com.example.onlinestore.services.ProductService;
import com.example.onlinestore.services.UserService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
public class MainController {
    @Value("${mainpage.pagesize}")
    private int pageSize;

    private final ProductService ps;
    private final UserService us;
    private final CategoryService categoryService;

    @GetMapping("/")
    public String main(Model m, Principal p, @RequestParam(required = false) Integer page,  ProductFilterSet filterSet){
        System.out.println(p);

        filterSet.filters = (params, entities) -> {
            int size = params.containsKey("categoriesSize") ? Integer.parseInt(params.get("categoriesSize")) : 0;
            List<String> categories = new ArrayList<>();
            for (int i = 0; i<size; i++){
                categories.add(params.get("category"+i));
            }




            System.out.println(categories);
            List<Product> lst = new ArrayList<>(entities);

            // фильтр по категориям
            if(size != 0) {
                lst = lst.stream()
                        .filter((obj) -> {
                            for (String cat : categories) {
                                if (obj.getCategory().getTitle().equals(cat)) {
                                    return true;
                                }
                            }
                            return false;
                        }).collect(Collectors.toList());
            }
            if (params.get("priceSort")!=null && (params.get("priceSort").equals("increasing")|| params.get("priceSort").equals("decreasing"))){
                int sortValue = params.get("priceSort").equals("increasing") ? 1 : -1;
                System.out.println(sortValue);
                Collections.sort(lst, (a,b) -> {


                    if (a.getPrice() > b.getPrice()){
                        return sortValue;
                    }
                    if (a.getPrice() < b.getPrice()){
                        return sortValue * -1;
                    }
                    return 1;
                });
            }


            //Фильтр по нижней границе

            //if (params.get("priceFrom") != null || params.get("priceTo")!=null){
                boolean b1From = params.get("priceFrom") !=null;
                boolean b2From = params.get("priceFrom") != "";
                if (b1From && b2From){
                    System.out.println("bottom layer");
                    int priceFrom = Integer.parseInt(params.get("priceFrom"));
                    lst = lst.stream()
                            .filter((obj) -> {
                                return obj.getPrice() >= priceFrom ? true : false;
                            }).collect(Collectors.toList());
                }

                // Фильтр по верхней границе
                if (params.get("priceTo")!=null && params.get("priceTo") != ""){
                    System.out.println("top layer");
                    int priceTo = Integer.parseInt(params.get("priceTo"));
                    lst = lst.stream()
                            .filter((obj) -> obj.getPrice() <= priceTo ? true : false).collect(Collectors.toList());
                }
           // }


            System.out.println(lst);
            return lst;

        };

        m.addAttribute("user", us.getUserByPrincipal(p));

        // Поисковый запрос через JPQL
        List<Product> lst;
        if (filterSet.getSearchQuery() != null){
            lst = ps.getProducts(filterSet.getSearchQuery());
        } else {
            lst = ps.getProducts();
        }

        lst = filterSet.executeFilters(lst);

        if (page == null){
            page = 1;
        }

        int numberOfPages = (lst.size()-1)/pageSize + 1;
        m.addAttribute("numberOfPages", numberOfPages);


        List<Product> resultSet = new ArrayList<>();
        for (int i = page * pageSize - pageSize; i < lst.size() && i < page * pageSize   ; i++){
            resultSet.add(lst.get(i));
        }

        List<CheckedCategory> catLst = new ArrayList<>();
        for (Category c: categoryService.getAllCategories()){
            boolean isChecked = false;
            if (filterSet.getCategory()!=null){
                for(String s: filterSet.getCategory()){
                    if (c.getTitle().equals(s)){
                        isChecked = true;
                    }
                }
            }

            catLst.add(new CheckedCategory(c, isChecked));
        }
        System.out.println(catLst);
        m.addAttribute("categories", catLst);
        m.addAttribute("currentPage", page);
        m.addAttribute("filters", filterSet);
        m.addAttribute("products", resultSet);
        return "main";
    }

    @ToString
    public class CheckedCategory{
        @Getter
        public Category cat;
        @Getter
        public boolean isChecked;

        public CheckedCategory(Category cat, boolean isC){
            this.cat = cat;
            this.isChecked = isC;
        }
    }
}
