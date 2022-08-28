package com.example.onlinestore.services;

import com.example.onlinestore.entites.Image;
import com.example.onlinestore.entites.Product;
import com.example.onlinestore.entites.ProductWithImageAddRequest;
import com.example.onlinestore.exceptions.NotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductWithImageAddRequestService {
    private final List<ProductWithImageAddRequest> pool = new ArrayList<>();
    private final ProductService productService;

    public List<ProductWithImageAddRequest> getPool(){
        return this.pool;
    }

    public void addImage(Image image, Long id){
        for (ProductWithImageAddRequest pw : pool){
            System.out.println(pw.getId());
        }
        ProductWithImageAddRequest pwi = pool
                .stream()
                .filter(p -> p.getId() == id)
                .findFirst()
                .orElseThrow(()-> new NotFoundException());
        Product product = pwi.getProduct();
        if (product.getImages().size() > pwi.getNoi()){
            throw new RuntimeException("Unable to save image, because maximum amount of images is reached");
        }
        product.addImageToProduct(image);
        log.info("image added to product with id + " + product.getId());
        if (product.getImages().size() == pwi.getNoi()){
            log.info("Uploading images for product with id + " + product.getId() + " is completed");
            productService.addProduct(product);
        }
    }

    public ProductWithImageAddRequest getById(Long id){
        return pool.stream()
                .filter((p) -> p.getId().equals(id))
                .findFirst()
                .orElseThrow(() -> new NotFoundException());
    }
}
