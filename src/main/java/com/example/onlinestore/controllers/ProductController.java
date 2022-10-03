package com.example.onlinestore.controllers;

import com.example.onlinestore.entites.Image;
import com.example.onlinestore.entites.Product;
import com.example.onlinestore.entites.ProductWithImageAddRequest;
import com.example.onlinestore.services.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/product")
public class ProductController {
    private final ProductService productService;
    private final UserService userService;
    private final CategoryService categoryService;
    private final ProductWithImageAddRequestService productWithImageAddRequestService;
    private final ImageService imageService;
    private final CartProductService cartProductService;
    @PostMapping("/add")
    @ResponseBody
    public Long add(Product p, Principal prn, Model m, @RequestParam String categoryName, @RequestParam int noi){
        m.addAttribute("message", "Товар успешно добавлен");
        m.addAttribute("user", userService.getUserByPrincipal(prn));
        p.setCategory(categoryService.getCategoryByTitle(categoryName));
        p.setAuthor(userService.getUserByPrincipal(prn));
        if (noi == 0) {
            productService.addProduct(p);

        } else {
            ProductWithImageAddRequest pr = new ProductWithImageAddRequest(p, noi, userService.getUserByPrincipal(prn), productWithImageAddRequestService.getPool());
            return pr.getId();
        }

        return -1L;
    }


    @PostMapping("/{id}/addImageToExist")
    public void addImage(@RequestParam(name = "file") MultipartFile file, @PathVariable Long id){
        System.out.println("called");
        Product p = productService.getProductById(id);
        Image image = imageService.toImage(file);
        p.addImageToProduct(image);
        productService.updateProduct(p);
    }


    @GetMapping("/{id}")
    public String getInfo(@PathVariable Long id, Principal p, Model m){
        m.addAttribute("user", userService.getUserByPrincipal(p));
        m.addAttribute("product", productService.getProductById(id));
        m.addAttribute("categories", categoryService.getAllCategories());
        System.out.println(productService.getProductById(id).getImages());
        return "productInfo";
    }

    @PostMapping("/{id}/delete")
    public String deleteProduct(@PathVariable Long id, Principal p, Model m){
        m.addAttribute("user", userService.getUserByPrincipal(p));

        if (cartProductService.getCartProductByProduct(id).size() > 0){
            Map<String, String> inlineStyle = new HashMap<>(){
                {
                    this.put("display", "inline");
                }
            };
            m.addAttribute("message", "Внимание! Этот товар находится в корзине у одного или более пользователей. Вы действительно хотите продолжить?");
            m.addAttribute("productId", id);
            return "confirm";
        }

        m.addAttribute("message", "Удалено!");
        productService.deleteProductById(id);
        return "success";
    }

    @PostMapping("/{id}/delete/confirm")
    public String confirmProductDelete(@PathVariable Long id, Principal p, Model m){
        m.addAttribute("user", userService.getUserByPrincipal(p));
        m.addAttribute("message", "Удалено!");
        productService.deleteProductById(id);
        return "success";
    }

    @PostMapping("/{id}/edit")
    public String edit(Product newProduct, Principal p, Model m, @RequestParam String categoryName){
        m.addAttribute("user", userService.getUserByPrincipal(p));
        newProduct.setCategory(categoryService.getCategoryByTitle(categoryName));
        productService.updateProduct(newProduct);
        m.addAttribute("product", newProduct);
        m.addAttribute("message", "Товар успешно добавлен");
        return "success";
    }

    @PostMapping("/{pwiId}/addImage")
    public void addImage(@PathVariable Long pwiId, @RequestParam(name = "file") MultipartFile file){
        Image i = imageService.toImage(file);
        productWithImageAddRequestService.addImage(i, pwiId);
    }
}
