package com.case_study.casemd3.model;

public class Food {
    private int id;
    private String name;
    private double price;
    private String detail;
    private String img_link;
    private int merchant_id;
    private Merchant merchant;
    private boolean certificate = true;
    private boolean is_active = true;

    public Food() {
    }

    public Food(String name, double price, String detail, String img_link, int merchant_id) {
        this.name = name;
        this.price = price;
        this.detail = detail;
        this.img_link = img_link;
        this.merchant_id = merchant_id;
    }

    public Food(String name, double price, String detail, String img_link, Merchant merchant) {
        this.name = name;
        this.price = price;
        this.detail = detail;
        this.img_link = img_link;
        this.merchant = merchant;
    }

    public Food(int id, String name, double price, String detail, String img_link, boolean certificate, boolean is_active) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.detail = detail;
        this.img_link = img_link;
        this.certificate = certificate;
        this.is_active = is_active;
    }

    public Food(int id, String name, double price, String detail, String img_link, Merchant merchant, boolean certificate, boolean is_active) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.detail = detail;
        this.img_link = img_link;
        this.merchant = merchant;
        this.certificate = certificate;
        this.is_active = is_active;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getImg_link() {
        return img_link;
    }

    public void setImg_link(String img_link) {
        this.img_link = img_link;
    }

    public boolean isCertificate() {
        return certificate;
    }

    public void setCertificate(boolean certificate) {
        this.certificate = certificate;
    }

    public boolean isIs_active() {
        return is_active;
    }

    public void setIs_active(boolean is_active) {
        this.is_active = is_active;
    }

    public Merchant getMerchant() {
        return merchant;
    }

    public void setMerchant(Merchant merchant) {
        this.merchant = merchant;
    }

    public int getMerchant_id() {
        return merchant_id;
    }

    public void setMerchant_id(int merchant_id) {
        this.merchant_id = merchant_id;
    }
}
