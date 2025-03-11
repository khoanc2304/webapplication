package controller;

import model.Product;
import model.ProductReview;
import service.product.IProductService;
import service.product.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet({"/", "/product", "/product-detail", "/add-review", "/delete-review"})
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        if ("/product-detail".equals(action)) {
            showProductDetail(request, response);
        } else {
            showProductList(request, response);
        }
    }


    private void showProductList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageSize = 9; // Số sản phẩm mỗi trang
        int pageNumber = 1; // Mặc định là trang 1
        if (request.getParameter("page") != null) {
            pageNumber = Integer.parseInt(request.getParameter("page"));
        }

        int totalProducts = productService.getTotalProducts();
        int totalPages = (int) Math.ceil(totalProducts / (double) pageSize);

        List<Product> products = productService.getProductsByPage(pageNumber, pageSize);
        request.setAttribute("products", products);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", pageNumber);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

    private void showProductDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("productID"));
        Product product = productService.getProductById(productID);

        if (product != null) {
            List<ProductReview> reviews = productService.getReviewsByProductId(productID);
            request.setAttribute("product", product);
            request.setAttribute("reviews", reviews);
            request.getRequestDispatcher("product-detail.jsp").forward(request, response);
        } else {
            response.sendRedirect("error.jsp");
        }
    }


}
