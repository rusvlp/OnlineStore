package com.example.onlinestore.services;

import com.example.onlinestore.entites.Product;
import com.example.onlinestore.exceptions.NotFoundException;
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

    public void addProduct(Product p){
        pr.save(p);
    }

    public void updateProduct(Product p){
        pr.save(p);
    }

    public Product getProductById(Long id){
        Product found = pr.findById(id).get();
        if (found == null){
            throw new NotFoundException();
        }

        return found;
    }

    public void deleteProductById(Long id){
        Product found = pr.findById(id).get();
        if(found == null){
            throw new NotFoundException();
        }
        pr.delete(found);
    }
}
