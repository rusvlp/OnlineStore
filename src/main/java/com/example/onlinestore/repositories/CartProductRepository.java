package com.example.onlinestore.repositories;

import com.example.onlinestore.entites.CartProduct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartProductRepository extends JpaRepository<CartProduct, Long> {
    @Query("select cp from CartProduct cp where cp.product.id = :product")
    List<CartProduct> getCartProductByProductId(@Param("product")Long id);

    @Modifying
    @Query("delete from CartProduct cp where cp.id = :id")
    void deleteById(@Param("id") Long id);
}
