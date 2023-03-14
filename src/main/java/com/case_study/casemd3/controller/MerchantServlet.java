package com.case_study.casemd3.controller;

import com.case_study.casemd3.model.Merchant;
import com.case_study.casemd3.service.merchant.MerchantService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "MerchantServlet", value = "/merchants")
public class MerchantServlet extends HttpServlet implements IFormServlet{
    private MerchantService merchantService;
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
            default:
                list(request, response);
                break;
            }
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
            default:
                break;
        }
    }

    @Override
    public void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("merchant/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Merchant existingMerchant = merchantService.findById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("merchant/delete.jsp");
        request.setAttribute("merchant", existingMerchant);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Merchant existingMerchant = merchantService.findById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("merchant/edit.jsp");
        request.setAttribute("merchant", existingMerchant);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void viewDetails(HttpServletRequest request, HttpServletResponse response) {

    }

    @Override
    public void list(HttpServletRequest request, HttpServletResponse response) {
        List<Merchant> merchants = merchantService.findAll();
        request.setAttribute("listUser", merchants);
        RequestDispatcher dispatcher = request.getRequestDispatcher("merchant/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void create(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String id_number = request.getParameter("id_number");
        int address_id = Integer.parseInt(request.getParameter("address_id"));
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        boolean is_active = Boolean.parseBoolean(request.getParameter("is_active"));
    }

    @Override
    public void edit(HttpServletRequest request, HttpServletResponse response) {

    }

    @Override
    public void delete(HttpServletRequest request, HttpServletResponse response) {

    }
}
