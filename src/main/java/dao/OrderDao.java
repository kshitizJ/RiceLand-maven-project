package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import detail.Order;

public class OrderDao {
   private Connection con;

   public OrderDao(Connection con) {
      super();
      this.con = con;
   }

   public boolean insertOrder(int uid, int pid, String name, int prc, int quant, int stotal, String st) {
      boolean flag = false;
      try {
         String query = "insert into RiceLand.order(user_id, product_id, product_name, price, quantity, subtotal, status) values(?, ?, ?, ?, ?, ?, ?);";
         PreparedStatement ps = con.prepareStatement(query);
         ps.setInt(1, uid);
         ps.setInt(2, pid);
         ps.setString(3, name);
         ps.setInt(4, prc);
         ps.setInt(5, quant);
         ps.setInt(6, stotal);
         ps.setString(7, st);
         int i = ps.executeUpdate();
         if (i == 1) {
            flag = true;
         }
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println(e.getMessage());
      }
      return flag;
   }

   public List<Order> getOrder(int uid) {
      List<Order> orders = new ArrayList<Order>();
      Order order;
      try {
         String query = "select * from RiceLand.order where user_id = ? ;";
         PreparedStatement ps = con.prepareStatement(query);
         ps.setInt(1, uid);
         ResultSet rs = ps.executeQuery();
         while (rs.next()) {
            order = new Order(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getInt(6),
                  rs.getInt(7), rs.getString(8));
            orders.add(order);
         }
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println(e.getMessage());
      }
      return orders;
   }

   public boolean completedOrder(int id, String sts) {
      boolean flag = false;
      try {
         String query = "update RiceLand.order set status = ? where order_id = ?";
         PreparedStatement ps = con.prepareStatement(query);
         ps.setString(1, sts);
         ps.setInt(2, id);
         int i = ps.executeUpdate();
         if (i == 1) {
            flag = true;
         }
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println(e.getMessage());
      }
      return flag;
   }
}
