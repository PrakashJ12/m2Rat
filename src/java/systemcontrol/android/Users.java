/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package systemcontrol.android;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jasmi
 */
public class Users {
    private static ServletContext application=null;
    public void addUser(String userName, HttpSession session, ServletContext application) {
        if(application==null) {
            Users.application=application;
        }
        Map<String, HttpSession> userSessions=new HashMap<String, HttpSession>();
        userSessions.put(userName, session);
        application.setAttribute("userSessions", userSessions);
    }
    public HttpSession getUserSession(String userName) {
        Map<String, HttpSession> userSessions=(Map<String, HttpSession>) application.getAttribute("userSessions");
        HttpSession get = userSessions.get(userName);
        return get;
    }
    
}
