package com.case_study.casemd3.controller;

import com.case_study.casemd3.model.Coupon;
import com.case_study.casemd3.service.coupon.CouponService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CouponServlet", value = "/coupon")
public class CouponServlet extends HttpServlet implements IFormServlet {
    private CouponService couponService;

    public void init() {
        couponService = new CouponService();
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
            case "search":
                showSearchForm(request, response);
                break;
            case "view":
                viewDetails(request, response);
                break;
            default:
                list(request, response);
                break;
        }
    }

    private void showSearchForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("coupon/search.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("coupon/create.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public void showDeleteForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Coupon coupon = couponService.findById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("coupon/delete.jsp");
        request.setAttribute("coupon", coupon);
        dispatcher.forward(request, response);
    }

    public void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Coupon coupon1 = couponService.findById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("coupon/edit.jsp");
        request.setAttribute("coupon", coupon1);
        dispatcher.forward(request, response);
    }

    @Override
    public void viewDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Coupon coupon = couponService.findById(id);
        request.setAttribute("coupon", coupon);
        RequestDispatcher dispatcher = request.getRequestDispatcher("coupon/view.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Coupon> coupons = couponService.findAll();
        RequestDispatcher dispatcher = request.getRequestDispatcher("coupon/list.jsp");
        request.setAttribute("coupons", coupons);
        dispatcher.forward(request, response);
    }

    @Override
    public void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double value = Double.parseDouble(request.getParameter("value"));
        int merchant_id = Integer.parseInt(request.getParameter("merchant_id"));
        boolean is_active = Boolean.parseBoolean(request.getParameter("is_active"));
        Coupon coupon1 = new Coupon(id, name, value,merchant_id, is_active);
        couponService.save(coupon1);
        RequestDispatcher dispatcher = request.getRequestDispatcher("coupon/create.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double value = Double.parseDouble(request.getParameter("value"));
        int merchant_id = Integer.parseInt(request.getParameter("merchant_id"));
        String get_is_active = request.getParameter("is_active");
        boolean is_active = Boolean.parseBoolean(get_is_active);
        Coupon coupon1 = new Coupon(id, name, value,merchant_id, is_active);
        couponService.update(id, coupon1);
        RequestDispatcher dispatcher = request.getRequestDispatcher("coupon/edit.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            couponService.remove(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Coupon> coupons = couponService.findAll();
        request.setAttribute("coupons", coupons);
        RequestDispatcher dispatcher = request.getRequestDispatcher("coupon/delete.jsp");
        dispatcher.forward(request, response);
    }

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
            case "search":
                searchCouponByName(request, response);
                break;
        }
    }

    private void searchCouponByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        List<Coupon> coupons = couponService.findCouponByName(name);
        request.setAttribute("listCoupon", coupons);
        RequestDispatcher dispatcher = request.getRequestDispatcher("coupon/search.jsp");
        dispatcher.forward(request, response);
    }
}
