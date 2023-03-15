package com.case_study.casemd3.model;

public class Cart {
    private int id;
    private int quantity;
    private int food_id;
    private Food food;
    private int coupon_id;
    private Coupon coupon;
    private int user_id;
    private User user;
    private boolean is_active;

    public Cart() {
    }

    public Cart(int id, int quantity, int food_id, int coupon_id, int user_id, boolean is_active) {
        this.id = id;
        this.quantity = quantity;
        this.food_id = food_id;
        this.coupon_id = coupon_id;
        this.user_id = user_id;
        this.is_active = is_active;
    }

    public Cart(int id, int quantity, int food_id, Food food, Coupon coupon, User user, boolean is_active) {
        this.id = id;
        this.quantity = quantity;
        this.food_id = food_id;
        this.food = food;
        this.coupon = coupon;
        this.user = user;
        this.is_active = is_active;
    }

    public Cart(int id, int quantity, Food food, Coupon coupon, User user, boolean is_active) {
        this.id = id;
        this.quantity = quantity;
        this.food = food;
        this.coupon = coupon;
        this.user = user;
        this.is_active = is_active;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getFood_id() {
        return food_id;
    }

    public void setFood_id(int food_id) {
        this.food_id = food_id;
    }

    public Food getFood() {
        return food;
    }

    public void setFood(Food food) {
        this.food = food;
    }

    public int getCoupon_id() {
        return coupon_id;
    }

    public void setCoupon_id(int coupon_id) {
        this.coupon_id = coupon_id;
    }

    public Coupon getCoupon() {
        return coupon;
    }

    public void setCoupon(Coupon coupon) {
        this.coupon = coupon;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public boolean isIs_active() {
        return is_active;
    }

    public void setIs_active(boolean is_active) {
        this.is_active = is_active;
    }
}
