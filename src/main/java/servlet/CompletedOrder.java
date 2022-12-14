package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDao;
import db.DbConnect;

/**
 * Servlet implementation class CompletedOrder
 */
@WebServlet("/CompletedOrder")
public class CompletedOrder extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      // Integer.parseInt() will convert string number "1" to int number 1.
      int uid = Integer.parseInt(request.getParameter("uid"));
      int id = Integer.parseInt(request.getParameter("id"));

      // OrderDao class contains the following query to complete the user order.
      OrderDao orderdao = new OrderDao(DbConnect.getCon());

      // completedOrder(int, String) is to complete the order of the following user.
      boolean flag = orderdao.completedOrder(id, "completed");
      HttpSession session = request.getSession();
      if (flag) {
         session.setAttribute("msg", "Order Completed..");
         response.sendRedirect("admin/showOrders.jsp?id=" + uid);
      } else {
         session.setAttribute("msg", "Something went wrong..");
         response.sendRedirect("admin/showOrders.jsp?id=" + uid);
      }

   }

}
