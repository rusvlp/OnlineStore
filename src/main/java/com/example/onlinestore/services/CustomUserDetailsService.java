package com.example.onlinestore.services;

import com.example.onlinestore.entites.User;
import com.example.onlinestore.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {
    private final UserRepository ur;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User u = ur.findByEmail(username);
        if (u == null){
            throw new UsernameNotFoundException("user not found");
        }
        System.out.println("loaded user " + u.getEmail() + ", pwd: " + u.getPassword() + ", role: " + u.getRoles());
        return u;
    }

}
