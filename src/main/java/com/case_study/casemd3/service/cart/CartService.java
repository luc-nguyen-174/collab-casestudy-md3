package com.case_study.casemd3.service.cart;

import com.case_study.casemd3.model.*;
import com.case_study.casemd3.service.coupon.CouponService;
import com.case_study.casemd3.service.food.FoodService;
import com.case_study.casemd3.service.user.UserService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.case_study.casemd3.connect.ConnectDB.getConnection;

public class CartService implements ICart {

    FoodService foodService = new FoodService();
    CouponService couponService = new CouponService();
    UserService userService = new UserService();
    public static final String UPDATE_CART_BY_ID = "UPDATE cart SET quantity = ?, food_id = ?, coupon_id = ?, user_id = ?,is_active = ? WHERE id = ?";
    public static final String DISABLE_CART = "UPDATE cart SET cart.is_active = false WHERE id =?";
    public static final String SELECT_CART_BY_ID = "" +
            "select c.*,\n" +
            "       u.id           user_id,\n" +
            "       u.name         user_name,\n" +
            "       u.phone        user_phone,\n" +
            "       a.address_name user_address,\n" +
            "       f.id,\n" +
            "       f.name         food_name,\n" +
            "       f.price        food_price,\n" +
            "       f.detail       food_detail,\n" +
            "       f.img_link     food_image,\n" +
            "       f.certificate  food_cetificate,\n" +
            "       c2.id,\n" +
            "       c2.name        coupon_name,\n" +
            "       c2.value       coupon_value\n" +
            "       from cart c\n" +
            "         left join coupon c2 on c2.id = c.coupon_id\n" +
            "         left join food f on f.id = c.food_id\n" +
            "         left join `user` u on u.id = c.user_id\n" +
            "         left join address a on u.address_id = a.id\n" +
            "         left join merchant m on f.merchant_id = m.id\n" +
            "       where c.id = ? " +
            "       and c.is_active = true;; ";

    public static final String SELECT_CART = "" +
            "       select c.*," +
            "       u.id           user_id," +
            "       u.name         user_name," +
            "       u.phone        user_phone," +
            "       a.address_name user_address," +
            "       f.id,\n" +
            "       f.name         food_name," +
            "       f.price        food_price," +
            "       f.detail       food_detail," +
            "       f.img_link     food_image," +
            "       f.certificate  food_cetificate," +
            "       c2.id," +
            "       c2.name        coupon_name," +
            "       c2.value       coupon_value" +
            "       from cart c" +
            "         left join coupon c2 on c2.id = c.coupon_id" +
            "         left join food f on f.id = c.food_id" +
            "         left join `user` u on u.id = c.user_id" +
            "         left join address a on u.address_id = a.id" +
            "         left join merchant m on f.merchant_id = m.id" +
            "       where c.is_active = true;";

    @Override
    public List<Cart> findAll() {
        List<Cart> carts = new ArrayList<>();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            conn.setAutoCommit(false);
            statement = conn.prepareStatement(SELECT_CART);
            rs = statement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("c.id");
                int quantity = rs.getInt("quantity");
                int food_id = rs.getInt("food_id");
                int coupon_id = rs.getInt("coupon_id");
                int user_id = rs.getInt("user_id");
                boolean is_active = rs.getBoolean("is_active");

                Food food = foodService.findById(food_id);
                Coupon coupon = couponService.findById(coupon_id);
                User user = userService.findById(user_id);

                carts.add(new Cart(id, quantity, food, coupon, user, is_active));
            }
            conn.commit();
        } catch (SQLException e) {
            try {
                conn.rollback();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
        } finally {
            try {
                if (rs != null) rs.close();
                if (statement != null) statement.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return carts;
    }

    @Override
    public void save(Cart cart) {
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = getConnection();
            conn.setAutoCommit(false);
            statement = conn.prepareStatement("INSERT INTO cart (id,quantity, food_id,coupon_id,user_id,is_active) values (?,?,?,?,?,?)");
            statement.setInt(1, cart.getId());
            statement.setInt(2, cart.getQuantity());
            statement.setInt(3, cart.getFood_id());
            statement.setInt(4, cart.getCoupon_id());
            statement.setInt(5, cart.getUser_id());
            statement.setBoolean(6, cart.isIs_active());
            statement.executeUpdate();
            conn.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (statement != null) statement.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public Cart findById(int id) {
        Cart cart = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(SELECT_CART_BY_ID);
            statement.setInt(1, id);
            rs = statement.executeQuery();
            while (rs.next()) {
                int quantity = rs.getInt("quantity");
                int food_id = rs.getInt("food_id");
                int coupon_id = rs.getInt("coupon_id");
                int user_id = rs.getInt("user_id");
                boolean is_active = rs.getBoolean("is_active");
                Food food = foodService.findById(food_id);
                Coupon coupon = couponService.findById(coupon_id);
                User user = userService.findById(user_id);
                cart = new Cart(id, quantity,food, coupon, user, is_active);
            }
            connection.commit();
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
        } finally {
            try {
                if (rs != null) rs.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return cart;
    }

    @Override
    public boolean update(int id, Cart cart) {
        boolean rowUpdated = false;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(UPDATE_CART_BY_ID);
            statement.setInt(1, cart.getQuantity());
            statement.setInt(2,cart.getFood_id());
            statement.setInt(3,cart.getCoupon_id());
            statement.setInt(4,cart.getUser_id());
            statement.setBoolean(5, cart.isIs_active());
            statement.setInt(6, id);
            rowUpdated = statement.executeUpdate() > 0;
            connection.commit();
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return rowUpdated;
    }

    @Override
    public boolean remove(int id) {
        boolean rowDisable = false;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(DISABLE_CART);
            statement.setInt(1, id);
            rowDisable = statement.executeUpdate() > 0;
            connection.commit();
        } catch (SQLException e) {

            try {
                connection.rollback();
            } catch (SQLException ex) {
                e.printStackTrace();
            }
        } finally {
            try {
                if (connection != null) connection.close();
                if (statement != null) statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return rowDisable;
    }
}
