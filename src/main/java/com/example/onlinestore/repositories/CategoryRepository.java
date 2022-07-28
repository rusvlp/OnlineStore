package com.example.onlinestore.repositories;

import com.example.onlinestore.entites.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category, Long> {
    Category findByTitle(String name);
}
