package com.case_study.casemd3.controller;

import com.case_study.casemd3.model.Food;
import com.case_study.casemd3.service.food.FoodService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Servlet", value = "/food")
public class FoodServlet extends HttpServlet {
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
                showCreateFoodForm(request, response);
                break;
            case "edit":
                showUpdateFoodForm(request, response);
                break;
            case "delete":
                showDeleteFoodForm(request, response);
                break;
            case "view":
                viewFood(request, response);
                break;
            default:
                listFoods(request, response);
                break;
        }
    }

    private void showCreateFoodForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("food/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showUpdateFoodForm(HttpServletRequest request, HttpServletResponse response) {
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

    private void showDeleteFoodForm(HttpServletRequest request, HttpServletResponse response) {

    }

    private void viewFood(HttpServletRequest request, HttpServletResponse response) {

    }

    private void listFoods(HttpServletRequest request, HttpServletResponse response) {
        List<Food> foods = foodService.findAll();
        request.setAttribute("foods",foods);
        RequestDispatcher dispatcher = request.getRequestDispatcher("food/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
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
                createFood(request, response);
                break;
            case "edit":
                editFood(request, response);
                break;
            case "delete":
                deleteFood(request, response);
                break;
            default:
                break;
        }
    }

    private void createFood(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
    }

    private void editFood(HttpServletRequest request, HttpServletResponse response) {
    }

    private void deleteFood(HttpServletRequest request, HttpServletResponse response) {

    }
}
