package com.example.onlinestore.services;

import com.example.onlinestore.entites.Image;
import com.example.onlinestore.exceptions.NotFoundException;
import com.example.onlinestore.repositories.ImageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Service
@RequiredArgsConstructor
public class ImageService {
    private final ImageRepository imageRepository;


    public Image getImageById(Long id){
        return imageRepository.findById(id).orElseThrow(() -> new NotFoundException());
    }

    public void addImage(Image i){
        imageRepository.save(i);
    }

    public Image toImage(MultipartFile file){
        try {
            Image image = new Image();
            image.setName(file.getName());
            image.setOriginalFileName(file.getOriginalFilename());
            image.setContentType(file.getContentType());
            image.setSize(file.getSize());
            image.setBytes(file.getBytes());
            return image;
        } catch (IOException e){
            throw new RuntimeException(e);
        }

    }

    public boolean deleteById(Long id){
        try{
            imageRepository.deleteById(id);
            return true;
        } catch (Exception e){
            return false;
        }

    }
}
