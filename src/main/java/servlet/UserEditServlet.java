package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import db.DbConnect;
import detail.User;

/**
 * Servlet implementation class UserEditServlet
 */
@WebServlet("/UserEditServlet")
public class UserEditServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      // We get the user session from the login page.
      HttpSession session = request.getSession();
      User user = (User) session.getAttribute("user");

      // If the user updates his/her details than we get the following parameter from
      // the client.
      String fname = request.getParameter("fname");
      String lname = request.getParameter("lname");
      String email = request.getParameter("email");
      String number = request.getParameter("number");
      String address = request.getParameter("address");
      String state = request.getParameter("state");
      String city = request.getParameter("city");
      int zip = Integer.parseInt(request.getParameter("zip"));
      // Integer.parseInt() will convert string number "1" to int number 1.

      // updating the current user credentials.
      user.setFname(fname);
      user.setLname(lname);
      user.setEmail(email);
      user.setNumber(number);
      user.setAddress(address);
      user.setState(state);
      user.setCity(city);
      user.setZip(zip);
      try {

         // UserDao class contains the query to update the user credentials.
         // DbConnect.getCon() is passed as a parameter to UserDao class to connect our
         // back-end with database.
         UserDao userdao = new UserDao(DbConnect.getCon());

         // editDetails(user) function edits the current user credentials in the
         // database.
         boolean flag = userdao.editDetails(user);
         if (flag) {
            session.setAttribute("success", "Your details have been changed successfully...");
            session.setAttribute("user", user);
            response.sendRedirect("profile.jsp");
         } else {
            session.setAttribute("error", "Something went wrong please try again...");
            response.sendRedirect("pageNotFound.jsp");
         }
      } catch (Exception e) {
         // if some error occurs then it gets printed in the console.
         e.printStackTrace();
         System.out.println(e.getMessage());
      }
   }

}
