/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thuyvtk.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author ASUS
 */
public class FormatText {

    public static String refineHTML(String source) {
        source = getBody(source);
        source = removeMiscellaneousTags(source);
        return source;
    }

    public static String getBody(String source) {
        String body = source;

        //.match với bất kì kí tự nào, * xuất hiện 0 or more, ? tìm kiếm khớp nhỏ nhất
        String expression = "<body.*?</body>";
        Pattern pattern = Pattern.compile(expression);

        Matcher matcher = pattern.matcher(source);
        if (matcher.find()) {
            body = matcher.group(0);
        }
        return body;
    }
    
    public static String convertEntities(String source){
        source = source.replace("ocirc;", "&#244;").replace("&amp;", "").replace("agrave;", "&#224;").replace("ograve;", "&#242;")
                .replace("acute;", "&#180;").replace("ndash;", "&#8211;");
        return source;
    }

    public static String removeMiscellaneousTags(String source) {
        String result = source;

        // remove all script tag
        String expression = "<script.*?</script>";
        result = result.replaceAll(expression, "");
        
        //remove all comment
        expression = "<!--.*?-->";
        result = result.replaceAll(expression, "");
        
        //remove whitespace(non-breaking space)
        expression = "&nbsp;?";
        result = result.replaceAll(expression, "");
        
        return result;
    }
}
