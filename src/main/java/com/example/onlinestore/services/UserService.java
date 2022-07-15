package com.example.onlinestore.services;

import com.example.onlinestore.entites.User;
import com.example.onlinestore.exceptions.UserExistException;
import com.example.onlinestore.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {
    private final PasswordEncoder passwordEncoder;
    private final UserRepository userRepository;

    public void registerUser(User user){
        if (userRepository.findByEmail(user.getEmail()) != null){
            throw new UserExistException();
        }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }
}
