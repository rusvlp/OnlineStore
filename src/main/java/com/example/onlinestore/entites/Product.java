package com.example.onlinestore.entites;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Iterator;
import java.util.List;

@Entity
@Table(name = "product")
@Data
public class Product implements Iterable<Object>{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "title")
    private String title;

    @Column(name = "description", columnDefinition = "text")
    private String description;

    @Column(name = "price")
    private Integer price;

    @Column(name = "amount")
    private Integer amount;

    @Column(name = "manufacturer")
    private String manufacturer;

    @Column(name = "countryOfManufactory")
    private String countryOfManufactory;

    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    private Category category;

    @Column(name = "dateOfCreate")
    private LocalDateTime dateOfCreate;

    @PrePersist
    private void init(){
        dateOfCreate = LocalDateTime.now();
    }

    @OneToMany(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    private List<Image> images;

    @Override
    public Iterator<Object> iterator() {
        return new Iterator<Object>() {
            @Override
            public boolean hasNext() {
                return false;
            }

            @Override
            public Object next() {
                return null;
            }
        };
    }
}
