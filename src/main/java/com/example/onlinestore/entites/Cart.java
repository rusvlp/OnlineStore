package com.example.onlinestore.entites;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@RequiredArgsConstructor
@Data
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ToString.Exclude
    @OneToOne(mappedBy = "cart")
    private User user;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<CartProduct> products = new ArrayList<>();

    public void cleanCart(){
        this.products = new ArrayList<>();
    }


    public int calculateTotalCost(){
        int sum = 0;
        for (CartProduct cp: products){
            sum+=cp.getProduct().getPrice();
        }
        return sum;
    }
}
