package com.example.onlinestore.services;

import com.example.onlinestore.entites.Category;
import com.example.onlinestore.repositories.CategoryRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class CategoryService {
    private CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository cr){
        this.categoryRepository = cr;
    }

    public Category getCategoryByTitle(String title){
        return categoryRepository.findByTitle(title);
    }
    public List<Category> getAllCategories(){
        List<Category> categories = categoryRepository.findAll();
        log.info("Loaded categories: " + categories);
        return categories;
    }

    public void addCategory(Category category){
        categoryRepository.save(category);
        log.info("Saved category: " + category.getTitle());
    }
}
