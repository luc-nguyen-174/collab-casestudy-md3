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
    public void init() throws ServletException {
        merchantService = new MerchantService();
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
        int id = Integer.parseInt(request.getParameter("id"));
        Merchant merchant = merchantService.findById(id);
        request.setAttribute("merchant", merchant);
        RequestDispatcher dispatcher = request.getRequestDispatcher("merchant/view.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void list(HttpServletRequest request, HttpServletResponse response) {
        List<Merchant> merchants = merchantService.findAll();
        request.setAttribute("merchants", merchants);
        RequestDispatcher dispatcher = request.getRequestDispatcher("merchant/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void create(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String id_number = request.getParameter("id_number");
        int address_id = Integer.parseInt(request.getParameter("address_id"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        boolean is_active = Boolean.parseBoolean(request.getParameter("is_active"));
        Merchant merchant = new Merchant(id, name, age, id_number, address_id, phone, email, is_active);
        merchantService.save(merchant);
        RequestDispatcher dispatcher = request.getRequestDispatcher("merchant/create.jsp");
        request.setAttribute("message", "New merchant was created");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void edit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String id_number = request.getParameter("id_number");
        int address_id = Integer.parseInt(request.getParameter("address_id"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String active = request.getParameter("is_active");
        boolean is_active = Boolean.parseBoolean(active);
        Merchant merchant = new Merchant(id, name, age, id_number, address_id, phone, email, is_active);
        merchantService.update(id, merchant);
        RequestDispatcher dispatcher = request.getRequestDispatcher("merchant/edit.jsp");
        request.setAttribute("message", "Merchant information was updated");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        merchantService.remove(id);
        try {
            response.sendRedirect("/merchants");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
