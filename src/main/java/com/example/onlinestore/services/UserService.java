package com.example.onlinestore.services;

import com.example.onlinestore.entites.Cart;
import com.example.onlinestore.entites.User;
import com.example.onlinestore.enums.Role;
import com.example.onlinestore.exceptions.UserExistException;
import com.example.onlinestore.repositories.CartRepository;
import com.example.onlinestore.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.Principal;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {
    private final PasswordEncoder passwordEncoder;
    private final UserRepository userRepository;
    private final CartService cartService;
    private final CartRepository cartRepository;

    public void registerUser(User user){

        user.setPassword(passwordEncoder.encode(user.getPassword()));
        log.info("saved user " + user.getEmail());
        user.getRoles().add(Role.ROLE_USER);
        Cart cart = new Cart();

        cartService.saveCart(cart);
        user.setCart(cart);

        userRepository.save(user);
        cart.setUser(user);
        cartService.setUserId(cart.getId(), user.getId());





    }

    public boolean isUserExist(User user){
        if (userRepository.findByEmail(user.getEmail()) == null){
            return false;
        }
        return true;

    }

    public User getUserByPrincipal(Principal p){
        if (p == null) return new User();
        return userRepository.findByEmail(p.getName());
    }
}
