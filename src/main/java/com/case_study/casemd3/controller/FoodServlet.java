package com.case_study.casemd3.controller;

import com.case_study.casemd3.model.Food;
import com.case_study.casemd3.service.food.FoodService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Servlet", value = "/food")
public class FoodServlet extends HttpServlet implements IFormServlet{
    private FoodService foodService;

    public void init() {
        foodService = new FoodService();
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







    //-------------------------------Method Post---------------------------------
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
        RequestDispatcher dispatcher = request.getRequestDispatcher("food/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {

    }

    @Override
    public void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Food food = foodService.findById(id);

        RequestDispatcher dispatcher = request.getRequestDispatcher("food/edit.jsp");
        request.setAttribute("food", food);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void viewDetails(HttpServletRequest request, HttpServletResponse response) {

    }

    @Override
    public void list(HttpServletRequest request, HttpServletResponse response) {
        List<Food> foods = foodService.findAll();
        request.setAttribute("foods", foods);
        RequestDispatcher dispatcher = request.getRequestDispatcher("food/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void create(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String detail = request.getParameter("detail");
        String img_link = request.getParameter("img_link");
        int merchant = Integer.parseInt(request.getParameter("merchant_id"));
        Food food = new Food(name, price, detail, img_link, merchant);
        try {
            foodService.save(food);
        } catch (Exception e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("food/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void edit(HttpServletRequest request, HttpServletResponse response) {

    }

    @Override
    public void delete(HttpServletRequest request, HttpServletResponse response) {

    }
}
