package com.example.onlinestore.entites;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Slf4j
public class ProductWithImageAddRequest {
    private Long id;
    private Product product;
    private User user;
    private int noi;

    public ProductWithImageAddRequest(Product p, int noi, User user, List<ProductWithImageAddRequest> pool){
        this.product = p;
        this.user = user;
        this.noi = noi;
        this.setUniqueId(pool);
        pool.add(this);
    }

    private void setUniqueId(List<ProductWithImageAddRequest> pool){
        if (pool.size() == 0){
            this.id = 0l;
            return;
        }

        long maxId = pool
                .stream()
                .mapToLong(o -> o.id)
                .max()
                .orElseThrow(() -> new RuntimeException("No element with max id"));
        this.id = ++maxId;
        return;

    }

    public Long getId(){
        return this.id;
    }

    public Product getProduct(){
        return this.product;
    }

    public int getNoi(){
        return this.noi;
    }
}
