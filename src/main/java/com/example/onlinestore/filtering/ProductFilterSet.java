package com.example.onlinestore.filtering;

import com.example.onlinestore.entites.Product;
import lombok.Data;
import lombok.ToString;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Data
public class ProductFilterSet extends AbstractFilterSet<Product>{
    private String priceSort;
    private String searchQuery;
    private Integer page;
    private Integer priceFrom;
    private Integer priceTo;


    public ProductFilterSet(){super();}

    public ProductFilterSet(Filters<Product> filters, Map<String, String> params){
        super();
        this.params = params;
        this.filters = filters;
    }

    @Override
    public List<Product> executeFilters(List<Product> entities){
        this.params = new HashMap<>();
        this.params.put("priceSort", this.priceSort);
        this.params.put("searchQuery", this.searchQuery);
        this.params.put("priceFrom", this.priceFrom + "");
        this.params.put("priceTo", this.priceTo + "");
        List<Product> results = filters.execute(params, entities);
        this.params = null;
        return results;
    }
}
