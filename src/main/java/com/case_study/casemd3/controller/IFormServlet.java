package com.case_study.casemd3.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface IFormServlet {
    void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    void showDeleteForm(HttpServletRequest request, HttpServletResponse response);
    void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    void viewDetails(HttpServletRequest request, HttpServletResponse response);
    void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;


    void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    void delete(HttpServletRequest request, HttpServletResponse response);

}
