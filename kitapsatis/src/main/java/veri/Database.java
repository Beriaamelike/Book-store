package veri;


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

import java.sql.Connection;
import java.sql.DriverManager;
public class Database {

        private Connection conn;
        String dbUrl = "jdbc:mysql://localhost:3306/kitapsatissitesi?zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=UTC";
        String user = "root";
        String pass= "Mba_6161";
        
        public Connection baglan(){
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbUrl, user, pass);               
                System.out.println("baglanti basarili");
                
            }
            catch( Exception e) {
               System.out.println("baglantida sorun var" +e);
            }
            return conn;
        }       
}
