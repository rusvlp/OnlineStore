package com.example.onlinestore.repositories;

import com.example.onlinestore.entites.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Long> {
}
