package com.case_study.casemd3.model;

public class Order {
    private int order_id;
    private int cart_id;
    private boolean is_active;
    private Cart cart;

    public Order() {
    }

    public Order(int order_id, boolean is_active, Cart cart) {
        this.order_id = order_id;
        this.is_active = is_active;
        this.cart = cart;
    }

    public Order(int order_id, int cart_id, boolean is_active) {
        this.order_id = order_id;
        this.cart_id = cart_id;
        this.is_active = is_active;
    }
}
