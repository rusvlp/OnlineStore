package com.example.onlinestore.freemarkerTemplates;

import lombok.Builder;
import lombok.Data;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Data
@Builder
public class Form {
    private String action;
    private Method method;
    private String id;
    private String clazz;
    private List<FormAttribute> attributes = new ArrayList<>();
    private String submitText;
    public String getMethod(){
        return method.name;
    }

    public String getHtmlCode(){
        String toRet;
        toRet = "<form action = '" + action + "' class = '" + clazz +"' id = '" + id + "' method = '" + method.name() + "'>\n";
        for (FormAttribute fa: attributes){
            toRet += fa.getHtmlCode() + "\n";
        }
        if(this.method == Method.METHOD_POST){
            toRet+="<input type = 'hidden' name = '_csrf' value = '${_csrf.token}'>\n";
        }
        toRet += "<input type = 'submit' value = '"+ submitText +"'>\n"
                + "</form>";
        return toRet;
    }
}
