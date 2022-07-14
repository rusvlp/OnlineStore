package com.example.onlinestore.services;

import com.example.onlinestore.entites.Product;
import com.example.onlinestore.repositories.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository pr;

    public List<Product> getProducts(){
        return pr.findAll();
    }

}
