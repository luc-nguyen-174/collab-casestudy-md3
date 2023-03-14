package com.case_study.casemd3.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IFormServlet {
    void showCreateForm(HttpServletRequest request, HttpServletResponse response);
    void showDeleteForm(HttpServletRequest request, HttpServletResponse response);
    void showUpdateForm(HttpServletRequest request, HttpServletResponse response);
    void viewDetails(HttpServletRequest request, HttpServletResponse response);
    void list(HttpServletRequest request, HttpServletResponse response);


    void create(HttpServletRequest request, HttpServletResponse response);
    void edit(HttpServletRequest request, HttpServletResponse response);
    void delete(HttpServletRequest request, HttpServletResponse response);

}
