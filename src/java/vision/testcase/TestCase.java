/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package vision.testcase;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author Jasmi
 */
public class TestCase {
    public static void main(String[] args) throws MalformedURLException, IOException {
        URL url=new URL("http://localhost:8080/SystemControl/index.jsp");
        InputStream inputStream = url.openConnection().getInputStream();
        byte[] b=new byte[inputStream.available()];
        inputStream.read(b);
        String ss=new String(b);
       
        String s="{\"firstkey\":\"its_value\",\"username\":\"visointux\",\"firstkey3\":\"its_value3\",\"firstkey4\":\"its_value4\"}";
        JSONObject fromObject = JSONObject.fromObject(ss.trim());
        System.out.println(fromObject.get("username"));
         //JSONArray jSONArray=JSONArray.fromObject(ss.trim());
        //Object get = jSONArray.get(2);
        //System.out.println(get);
        
    }
}
