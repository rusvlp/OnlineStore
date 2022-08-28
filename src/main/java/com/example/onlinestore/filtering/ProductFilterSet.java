package com.example.onlinestore.filtering;

import com.example.onlinestore.entites.Product;

import java.util.List;
import java.util.Map;

public class ProductFilterSet extends AbstractFilterSet<Product>{
    public ProductFilterSet(Filters<Product> filters, Map<String, String> params){
        super();
        this.params = params;
        this.filters = filters;
    }

    @Override
    public List<Product> executeFilters(List<Product> entities){
        return filters.execute(params, entities);
    }
}
