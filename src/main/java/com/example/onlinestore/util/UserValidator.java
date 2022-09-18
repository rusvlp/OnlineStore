package com.example.onlinestore.util;

import com.example.onlinestore.entites.User;
import com.example.onlinestore.exceptions.UserExistException;
import com.example.onlinestore.services.UserService;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
@RequiredArgsConstructor
public class UserValidator implements Validator {
    private final UserService userService;


    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;

        if (userService.isUserExist(user)){
            errors.rejectValue("email", "", "this email is already in use");
        }
    }
}
