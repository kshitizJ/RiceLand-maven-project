package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      try {

         // sets the session false so that no further changes to the session is done.
         HttpSession session = request.getSession(false);

         // removes the user from the session.
         session.removeAttribute("user");

         // setMaxInactiveInterval sets the session timing for the user. It sets the
         // session as 0 mins after clicking on logout.
         session.setMaxInactiveInterval(0);

         // invalidate() invalidates the session or destroys the session.
         session.invalidate();

         // Then we are redirected to the login page.
         response.sendRedirect("login.jsp");

      } catch (Exception e) {

         // if some error occurs then it gets printed in the console.
         e.printStackTrace();
         System.out.println(e.getMessage());
      }

   }

}
