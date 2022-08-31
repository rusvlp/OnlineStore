package com.example.onlinestore.repositories;

import com.example.onlinestore.entites.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    @Query("SELECT p FROM Product p WHERE p.title like concat ('%', :query, '%')")
    public List<Product> searchByQuery(String query);
}
