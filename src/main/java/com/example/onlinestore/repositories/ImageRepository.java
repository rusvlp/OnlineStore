package com.example.onlinestore.repositories;

import com.example.onlinestore.entites.Image;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

public interface ImageRepository extends JpaRepository<Long, Image> {
}
