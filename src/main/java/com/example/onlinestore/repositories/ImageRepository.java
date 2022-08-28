package com.example.onlinestore.repositories;

import com.example.onlinestore.entites.Image;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImageRepository extends JpaRepository<Image, Long> {
}
