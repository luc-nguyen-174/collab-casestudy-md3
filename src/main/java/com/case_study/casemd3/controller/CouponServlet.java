package com.case_study.casemd3.controller;

import com.case_study.casemd3.model.Coupon;
import com.case_study.casemd3.service.coupon.CouponService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CouponServlet", value = "/CouponServlet")
public class CouponServlet extends HttpServlet {
    private CouponService couponService;
    public void init(){
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
                showNewForm(request, response);
                break;
            case "edit":
                showUpdateForm(request, response);
                break;
            case "delete":
                break;
            default:
                listCoupon(request, response);
                break;
        }
    }
    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Coupon coupon1 = couponService.findById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("coupon/edit.jsp");
        request.setAttribute("coupon", coupon1);
        dispatcher.forward(request, response);
    }

    private void listCoupon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Coupon> coupons = couponService.findAll();
        request.setAttribute("listCoupon", coupons);
        RequestDispatcher dispatcher = request.getRequestDispatcher("coupon/list.jsp");
        dispatcher.forward(request, response);
    }
    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("coupon/create.jsp");
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
                insertCoupon(request,response);
                break;
            case "edit":
                updateCoupon(request, response);
                break;

        }
    }
    private void updateCoupon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double value = Double.parseDouble(request.getParameter("value"));
        boolean is_active = Boolean.parseBoolean(request.getParameter("is_active"));
        Coupon coupon1 = new Coupon(id,name, value, is_active);
        couponService.update(id, coupon1);
        RequestDispatcher dispatcher = request.getRequestDispatcher("coupon/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void insertCoupon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double value = Double.parseDouble(request.getParameter("value"));
        boolean is_active =  Boolean.parseBoolean(request.getParameter("is_active"));
        Coupon coupon1 = new Coupon(id, name,  value, is_active);
        couponService.save(coupon1);
        RequestDispatcher dispatcher = request.getRequestDispatcher("coupon/create.jsp");
        dispatcher.forward(request, response);
    }
}
