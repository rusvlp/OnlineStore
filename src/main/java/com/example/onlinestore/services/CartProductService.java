package com.example.onlinestore.services;

import com.example.onlinestore.entites.CartProduct;
import com.example.onlinestore.repositories.CartProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CartProductService {
    private final CartProductRepository cartProductRepository;

    public void save(CartProduct cartProduct){
        cartProductRepository.save(cartProduct);
        return;
    }

}
