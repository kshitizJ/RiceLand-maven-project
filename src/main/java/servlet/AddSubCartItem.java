package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDao;
import db.DbConnect;

@WebServlet("/AddSubCartItem")
public class AddSubCartItem extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      // get request parameters from the page.
      boolean flag = false;
      // Integer.parseInt() will convert string number "1" to int number 1.
      int uid = Integer.parseInt(request.getParameter("uid"));
      int pid = Integer.parseInt(request.getParameter("pid"));
      int prc = Integer.parseInt(request.getParameter("prc"));
      HttpSession session = request.getSession();
      if ("add".equals(request.getParameter("msg"))) {
         // if in msg parameter the message is 'add' then we will add the quantity of the
         // particular product in the cart.

         // CartDao class contains the method to add the quantity of the product inside
         // the cart.
         CartDao cartdao = new CartDao(DbConnect.getCon());
         flag = cartdao.addQuantity(uid, pid, prc);
      } else if ("sub".equals(request.getParameter("msg"))) {
         // if in msg parameter the message is 'sub' then we will subtract the quantity
         // of the particular product in the cart.

         // CartDao class contains the method to subtract the quantity of the product
         // inside the cart.
         CartDao cartdao = new CartDao(DbConnect.getCon());
         flag = cartdao.subQuantity(uid, pid, prc);
      }
      if (flag) {
         // if the flag is true then there is no error and quantity has increased or
         // decreased.
         response.sendRedirect("cart.jsp");
      } else {
         // if flag is false then the product quantity cannot be less than 0, or some
         // other error has occurred.
         session.setAttribute("msg", "Product quantity cannot be less than 0, please remove the product..");
         response.sendRedirect("cart.jsp");
      }
   }
}
