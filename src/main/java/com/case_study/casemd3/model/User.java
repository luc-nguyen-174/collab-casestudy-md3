package com.case_study.casemd3.model;

public class User {
    private int id;
    private String username;
    private String password;
    private String email;
    private String name;
    private String phone;
    private int address_id;
    private Address address;
    private  boolean is_active = true;

    public User() {
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(int id, String username, String password, String email, String name, String phone, int address_id, boolean is_active) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.address_id = address_id;
        this.is_active = is_active;
    }

    public User(int id, String username, String password, String email, String name, String phone, Address address, boolean is_active) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.is_active = is_active;
    }

    public User(int id, String email, String name, String phone, Address address, boolean is_active) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.is_active = is_active;
    }

    public User(int id, String name, String email, String phone, int address_id, boolean is_active) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.address_id = address_id;
        this.is_active = is_active;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public boolean isIs_active() {
        return is_active;
    }

    public void setIs_active(boolean is_active) {
        this.is_active = is_active;
    }

    public User(int id, String email, String name, String phone, int address_id) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.address_id = address_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getAddress_id() {
        return address_id;
    }

    public void setAddress_id(int address_id) {
        this.address_id = address_id;
    }
}
