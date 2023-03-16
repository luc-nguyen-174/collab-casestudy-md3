package com.case_study.casemd3.controller;

import com.case_study.casemd3.connect.ConnectDB;
import com.case_study.casemd3.model.Cart;
import com.case_study.casemd3.model.Coupon;
import com.case_study.casemd3.model.Food;
import com.case_study.casemd3.model.User;
import com.case_study.casemd3.service.cart.CartService;
import com.case_study.casemd3.service.coupon.CouponService;
import com.case_study.casemd3.service.food.FoodService;
import com.case_study.casemd3.service.user.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/cart")
public class CartServlet extends HttpServlet implements IFormServlet {
    private CartService cartService;
    private FoodService foodService;
    private CouponService couponService;
    private UserService userService;

    public void init() {
        cartService = new CartService();
        foodService = new FoodService();
        couponService = new CouponService();
        userService = new UserService();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showUpdateForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "view":
                viewDetails(request, response);
                break;
            case "addtocart":

                addtocart(request, response);
                break;
            default:
                list(request, response);
                break;
        }
    }

    private void addtocart(HttpServletRequest request, HttpServletResponse response) {
    }


    //------------------------------------------------------------------------------------------------------
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                create(request, response);
                break;
            case "edit":
                edit(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "cartload":
                cartLoad(request, response);
                break;
            default:
                break;
        }
    }

    private void cartLoad(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Food food = foodService.findById(id);
        request.setAttribute("food", food);
        Coupon coupon = couponService.findById(id);
        request.setAttribute("coupon", coupon);
        User user = userService.findById(id);
        request.setAttribute("user", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/cart/addtocart.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    //-------------------------------------------------Method Get-----------------------------------------------------
    @Override
    public void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("cart/create.jsp");
        List<Cart> carts = cartService.findAll();
        request.setAttribute("carts", carts);
        dispatcher.forward(request, response);
    }

    @Override
    public void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Cart cart = cartService.findById(id);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/cart/delete.jsp");
        request.setAttribute("cart", cart);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Cart cart = cartService.findById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("cart/edit.jsp");
        request.setAttribute("cart", cart);
        dispatcher.forward(request, response);
    }

    @Override
    public void viewDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Cart cart = cartService.findById(id);
        request.setAttribute("cart", cart);
        RequestDispatcher dispatcher = request.getRequestDispatcher("cart/view.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cart> carts = cartService.findAll();
        request.setAttribute("carts", carts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("cart/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            System.out.println(e.getMessage());
        }
    }

    //---------------------------------------------------Method Post---------------------------------------------------
    @Override
    public void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
