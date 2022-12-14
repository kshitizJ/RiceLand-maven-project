package servlet;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import db.DbConnect;
import detail.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   final private static char[] hexArray = "0123456789ABCDEF".toCharArray();

   private String bytesToHex(byte[] bytes) {
      char[] hexChars = new char[bytes.length * 2];
      int v;
      for (int j = 0; j < bytes.length; j++) {
         v = bytes[j] & 0xFF;
         hexChars[j * 2] = hexArray[v >>> 4];
         hexChars[j * 2 + 1] = hexArray[v & 0x0F];
      }
      return new String(hexChars);
   }

   // Change this to something else.
   private static String SALT = "123456";

   // A password hashing method.
   private String hashPassword(String in) {
      try {
         MessageDigest md = MessageDigest.getInstance("SHA-256");
         md.update(SALT.getBytes()); // <-- Prepend SALT.
         md.update(in.getBytes());
         // md.update(SALT.getBytes()); // <-- Or, append SALT.

         byte[] out = md.digest();
         return bytesToHex(out); // <-- Return the Hex Hash.
      } catch (NoSuchAlgorithmException e) {
         e.printStackTrace();
      }
      return "";
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      String fname = request.getParameter("fname");
      String lname = request.getParameter("lname");
      String email = request.getParameter("email");
      String pass = hashPassword(request.getParameter("pass"));
      String number = request.getParameter("number");
      String address = request.getParameter("address");
      String state = request.getParameter("state");
      String city = request.getParameter("city");
      int zip = Integer.parseInt(request.getParameter("zip"));

      User user = new User(fname, lname, email, pass, number, address, state, city, zip);
      UserDao userdao = new UserDao(DbConnect.getCon());
      boolean flag = userdao.adduser(user);
      if (flag) {
         response.sendRedirect("login.jsp");
      } else {
         request.setAttribute("error", "User registration fail, please try again...");
         response.sendRedirect("pageNotFound.jsp");
      }
   }

}
