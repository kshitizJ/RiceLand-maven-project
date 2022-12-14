package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import detail.Admin;

public class AdminDao {
   private Connection con;

   public AdminDao(Connection con) {
      super();
      this.con = con;
   }

   public Admin checkadmin(String email, String pass) {
      Admin admin = null;

      try {
         String query = "select * from admin where email = ? and pass = ?";
         PreparedStatement ps = con.prepareStatement(query);
         ps.setString(1, email);
         ps.setString(2, pass);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            admin = new Admin(rs.getInt("admin_id"), rs.getString("fname"), rs.getString("lname"),
                  rs.getString("email"), rs.getString("pass"), rs.getDate("date"));
         }
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println(e.getMessage());
      }

      return admin;

   }
}
