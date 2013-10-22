/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package vision.testcase;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Jasmi
 */
public class DatabaseCon {
    public static Connection con;
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");//Driver Class loading
            con=DriverManager.getConnection("jdbc:mysql://localhost/remoteControl", "root", "");
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseCon.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DatabaseCon.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ResultSet getResult(String query) {
            ResultSet rs=null;
        try {

            Statement createStatement = con.createStatement();
            rs=createStatement.executeQuery(query);
            
            
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseCon.class.getName()).log(Level.SEVERE, null, ex);
        }
        
            return rs;
    }
    
    public int update(String query) {
            int output=0;
        try {
            Statement createStatement = con.createStatement();
            output=createStatement.executeUpdate(query);
            
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseCon.class.getName()).log(Level.SEVERE, null, ex);
        }
        
            return output;
    }
    
    public static void main(String[] ar) throws SQLException {
        DatabaseCon db=new DatabaseCon();
        ResultSet result = db.getResult("select u_name, password, email from userdata");
        while(result.next()) {
            System.out.println("row value : " +result.getString("u_name"));
            System.out.println("row value : " +result.getString("email"));
            System.out.println("row value : " +result.getString("password"));            
        }
String u="llll@sdasds.com";
        int update = db.update("INSERT INTO  `remotecontrol`.`userdata` ( `u_id` , `u_name` , `password` , `mobile` , `email`)VALUES (NULL ,  'pra',  'dfdf',  'fdfdf',  '"+u+"')");
        if(update>0){
            System.out.println("inserted");
        } else {
                        System.out.println("not inserted");

        }
        
    }
}
