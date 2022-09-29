package com.example.onlinestore.filtering;

import java.util.List;
import java.util.Map;

public abstract class AbstractFilterSet <T>{
    public Filters<T> filters;

    Map<String, String> params;

    abstract List<T> executeFilters(List<T> entities);

}
