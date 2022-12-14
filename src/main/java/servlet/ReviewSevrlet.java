package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import dao.ReviewDao;
import db.DbConnect;
import detail.Product;
import detail.Review;

/**
 * Servlet implementation class ReviewSevrlet
 */
@WebServlet("/ReviewSevrlet")
public class ReviewSevrlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      int user_id = Integer.parseInt(request.getParameter("uid"));
      int product_id = Integer.parseInt(request.getParameter("pid"));
      String review = request.getParameter("review");
      int star = Integer.parseInt(request.getParameter("rating"));

      ReviewDao reviewdao = new ReviewDao(DbConnect.getCon());
      boolean flag = reviewdao.addReview(user_id, product_id, review, star);
      if (flag) {
         ProductDao productDao = new ProductDao(DbConnect.getCon());
         Product product = productDao.getProduct(product_id);
         List<Review> reviews = reviewdao.getReview(product_id);
         int sum = 0;
         for (Review r : reviews) {
            sum += r.getStars();
         }
         int product_star = sum / reviews.size();
         product.setStar(product_star);
         boolean flag2 = productDao.updateStar(product);
         if (flag2) {
            response.sendRedirect("productdetail.jsp?id=" + product_id);
         }
      } else {
         request.setAttribute("error", "There was some problem in collecting your review, please try again..");
         response.sendRedirect("pageNotFound.jsp");
      }

   }

}
