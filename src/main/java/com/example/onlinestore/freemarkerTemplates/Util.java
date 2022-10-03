package com.example.onlinestore.freemarkerTemplates;

import java.util.Map;

public class Util {
    public static String addStyles(Map<String, String> styles){
        String toRet = "";
        if (styles.size()!=0){
            toRet += "style='";
            for (String key: styles.keySet()){
                toRet+=key+": ";
                toRet+=styles.get(key) + ";";
            }
            toRet+="'";
        }
        return toRet;
    }
}
