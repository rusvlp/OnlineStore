package com.example.onlinestore.enums;

public enum PriceFilter {
    FILTER_PRICE_DECREASE("increasing"),
    FILTER_PRICE_INCREASE("decreasing");

    private String filter;

    PriceFilter(String filter){
        this.filter = filter;
    }

    public String getFilter(){
        return this.filter;
    }
}
