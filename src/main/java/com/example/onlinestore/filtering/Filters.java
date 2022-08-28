package com.example.onlinestore.filtering;

import java.util.List;
import java.util.Map;


@FunctionalInterface
public interface Filters <T>{
    List<T> execute (Map<String, String> params, List<T> entities);

}
