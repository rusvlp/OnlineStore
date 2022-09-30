package com.example.onlinestore.freemarkerTemplates;

public enum Method {
    METHOD_POST("post"),
    METHOD_GET("get"),
    METHOD_DIALOG("dialog");

    public String name;

    Method(String name){
        this.name = name;
    }
}
