package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDao;
import dao.OrderDao;
import dao.ProductDao;
import db.DbConnect;
import detail.Cart;
import detail.Product;

/**
 * Servlet implementation class PendingProduct
 */
@WebServlet("/CheckoutOrder")
public class CheckoutOrder extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      // Integer.parseInt() will convert string number "1" to int number 1.
      int uid = Integer.parseInt(request.getParameter("uid"));

      // CartDao class contains the cart related query for the cart functionality.
      CartDao cartdao = new CartDao(DbConnect.getCon());

      // OrderDao class contains the cart related query for the order details.
      OrderDao orderdao = new OrderDao(DbConnect.getCon());

      // after clicking on checkout the products inside the cart will be send to order
      // page. getUserCart() will give the cart details of the current user.
      List<Cart> carts = cartdao.getUserCart(uid);
      boolean flag = false;

      // To store the details of the product which then will be added to the order
      // table.
      Product product;

      // ProductDao class contains the product related query to get the product.
      ProductDao productdao = new ProductDao(DbConnect.getCon());
      HttpSession session = request.getSession();

      // In this for loop each cart item is added to the order table.
      for (Cart cart : carts) {
         // new product instance is created every time the loop runs.
         product = new Product();

         // getProduct(id) will give the product details to our product instance.
         product = productdao.getProduct(cart.getPid());

         // insertOrder() inserts the details of the order from the product and the cart.
         flag = orderdao.insertOrder(uid, product.getPid(), product.getName(), product.getPrice(),
               cart.getQuantity(), cart.getStotal(), "pending");
         if (flag)
            continue;
         else
            break;
      }
      if (flag) {
         // if flag is true after completing the order then we will now empty the cart
         // from the database.
         for (Cart cart : carts) {
            product = new Product();
            product = productdao.getProduct(cart.getPid());

            // deleteProductFromCart(user_id, product_id) will delete the cart of the user =
            // 'user_id'.
            flag = cartdao.deleteProductFromCart(uid, product.getPid());
            if (flag)
               continue;
            else
               break;
         }

         // after this we redirect to 'orders.jsp'
         response.sendRedirect("orders.jsp");
      } else {
         // if flag is false, that means some error has occurred in the database so we
         // send the msg to the user.
         session.setAttribute("msg", "Cannot checkout please try again..");

         // after this we redirect to 'cart.jsp'
         response.sendRedirect("cart.jsp");
      }

   }

}
