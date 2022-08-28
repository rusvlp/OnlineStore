package com.example.onlinestore.controllers;

import com.example.onlinestore.entites.Image;
import com.example.onlinestore.entites.Product;
import com.example.onlinestore.services.ImageService;
import com.example.onlinestore.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.ByteArrayInputStream;
import java.security.Principal;

@Controller
@RequestMapping("/images")
@RequiredArgsConstructor
public class ImageController {
    private final ImageService imageService;
    private final UserService userService;

    @GetMapping("/{id}")
    private ResponseEntity<?> getImageById(@PathVariable Long id){
        Image image = imageService.getImageById(id);
        return ResponseEntity.ok().
                header("fileName", image.getOriginalFileName())
                .contentType(MediaType.valueOf(image.getContentType()))
                .contentLength(image.getSize())
                .body(new InputStreamResource(new ByteArrayInputStream(image.getBytes())));
    }

    @PostMapping("/delete/{id}")
    @ResponseBody
    public Boolean delete(@PathVariable Long id/*, Model m, Principal p*/){
        return imageService.deleteById(id);
        /*if (imageService.deleteById(id)){
            m.addAttribute("message", "Успешно удалено");
        } else {
            m.addAttribute("message", "Не удалось удалить");
        }
        return "success"; */
    }

}
