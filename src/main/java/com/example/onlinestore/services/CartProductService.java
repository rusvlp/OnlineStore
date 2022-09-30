package com.example.onlinestore.services;

import com.example.onlinestore.entites.CartProduct;
import com.example.onlinestore.entites.Product;
import com.example.onlinestore.repositories.CartProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CartProductService {
    private final CartProductRepository cartProductRepository;

    public void save(CartProduct cartProduct){
        cartProductRepository.save(cartProduct);
        return;
    }

    public List<CartProduct> getCartProductByProduct(Long id){
        return cartProductRepository.getCartProductByProductId(id);
    }

}
