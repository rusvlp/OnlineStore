package com.example.onlinestore.util;


import com.example.onlinestore.entites.User;
import com.example.onlinestore.services.UserService;
import lombok.RequiredArgsConstructor;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.springframework.validation.Errors;

import static org.mockito.Mockito.*;


@RequiredArgsConstructor
public class UserValidatorTest {

    public UserService userService(){
        return mock(UserService.class);
    }

    public UserValidator userValidator(){
        return new UserValidator(userService());
    }

    private static final String userEmail = "test@test.com";
    private static final User user = mock(User.class);

    @BeforeAll
    public static void setup(){
        when(user.getEmail()).thenReturn(userEmail);
    }

    @Test
    public void validateShouldAcceptUserWithNewEmail(){
        when(userService().isUserExist(user)).thenReturn(false);
        Errors errors = mock(Errors.class);
        userValidator().validate(user, errors);
        verify(errors, never()).rejectValue(eq("email"), any(), any());
    }


}
