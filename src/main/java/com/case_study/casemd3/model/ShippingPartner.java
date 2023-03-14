package com.case_study.casemd3.model;

public class ShippingPartner {
    private int id;
    private String name;
    private boolean is_active;

    public ShippingPartner() {
    }

    public ShippingPartner(int id, String name, boolean is_active) {
        this.id = id;
        this.name = name;
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

    public boolean isIs_active() {
        return is_active;
    }

    public void setIs_active(boolean is_active) {
        this.is_active = is_active;
    }
}
