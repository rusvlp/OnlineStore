package com.example.onlinestore.freemarkerTemplates;

import lombok.Builder;

@Builder
public class InputFormAttribute implements FormAttribute {
    private static String tagName = "input";

    public String type;
    public String id;
    public String value;
    public String clazz;

    @Override
    public String getHtmlCode(){
        return "<"+tagName + " type='" + type + "' id='" + id + "' class='" + clazz + "' value='" + value + "'>";
    }
}
