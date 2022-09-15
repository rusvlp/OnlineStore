package com.example.onlinestore.entites;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class CartProduct {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;


    @ManyToOne
    private Product product;

    @Column(name = "quantity")
    private Integer quantity;

    public static Builder builder(){
        return new CartProduct().new Builder();
    }

    public class Builder{
        private Builder(){}

        public Builder id(Long id){
            CartProduct.this.id = id;
            return this;
        }

        public Builder product(Product product){
            CartProduct.this.product = product;
            return this;
        }

        public Builder quantity(int quantity){
            CartProduct.this.quantity = quantity;
            return this;
        }

        public CartProduct build(){
            return CartProduct.this;
        }
    }

    public void setQuantity(int quantity){
        if (quantity < 0){
            throw new IllegalArgumentException("Quantity must be positive");
        }
        this.quantity = quantity;
    }

    public void increaseQuantity(){
        this.quantity++;
    }

    public void decreaseQuantity(){
        if (this.quantity-1 < 0){
            throw new RuntimeException("Product's quantity must be positive");
        }
        this.quantity--;
    }

    public long calculateSum(){
        return this.product.getPrice() * this.quantity;
    }
}
