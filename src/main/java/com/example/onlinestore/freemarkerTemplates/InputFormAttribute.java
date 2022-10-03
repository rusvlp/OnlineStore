package com.example.onlinestore.freemarkerTemplates;

import lombok.Builder;

import java.util.HashMap;
import java.util.Map;

@Builder
public class InputFormAttribute implements FormAttribute {
    private static String tagName = "input";

    public String type;
    public String id;
    public String value;
    public String clazz;
    public Map<String, String> styles = new HashMap<>();

    @Override
    public String getHtmlCode(){
        String toRet = "<"+tagName + " type='" + type + "' id='" + id + "' class='" + clazz + "' value='" + value + "' ";

        toRet+=Util.addStyles(styles);
        toRet+=">";

        return toRet;
    }
}
