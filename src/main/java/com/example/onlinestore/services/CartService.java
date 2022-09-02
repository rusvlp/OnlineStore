package com.example.onlinestore.services;

import com.example.onlinestore.entites.Cart;
import com.example.onlinestore.entites.User;
import com.example.onlinestore.repositories.CartRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CartService {
    private final CartRepository cartRepository;

    public void createCart(User user){
        Cart cart = new Cart();
        cartRepository.save(cart);
        cart.setUser(user);
        cartRepository.save(cart);
    }

    public void saveCart(Cart cart){
        cartRepository.save(cart);
    }

    public void flushCart(){
        cartRepository.flush();
    }

    public void setUserId(Long cartId, Long userId){
        //cartRepository.setUserId(cartId, userId);
    }
}
