package com.case_study.casemd3.service.coupon;

import com.case_study.casemd3.model.Coupon;
import com.case_study.casemd3.model.Merchant;
import com.case_study.casemd3.service.merchant.MerchantService;

import javax.servlet.RequestDispatcher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.case_study.casemd3.connect.ConnectDB.getConnection;

public class CouponService implements ICoupon{
    MerchantService merchantService = new MerchantService();
    private static final String SELECT_ALL_COUPONS = "" +
            "select c.id coupon_id,\n" +
            "       c.name coupon_name,\n" +
            "       value coupon_value,\n" +
            "       c.merchant_id coupon_merchant,\n" +
            "       c.is_active coupon_is_active,\n" +
            "       m.id merchant_id,\n" +
            "       m.username merchant_name,\n" +
            "       m.password merchant_pass,\n" +
            "       m.name merchant_name,\n" +
            "       m.age merchant_age,\n" +
            "       m.id_number merchant_id_num,\n" +
            "       m.address_id merchant_address,\n" +
            "       m.phone merchant_phone,\n" +
            "       m.email merchant_email,\n" +
            "       m.is_active merchant_is_actice\n" +
            "from coupon c\n" +
            "         join merchant m on m.id = c.merchant_id;";
    private static final String SELECT_COUPON_BY_ID = "select id, name, value, is_active, merchant_id from coupon where id = ?";
    private static final String INSERT = "insert into coupon(id, name, value,merchant_id, is_active) values (?, ?, ?, ?,?)";
    private static final String DISABLE_COUPON = "UPDATE coupon SET is_active = false WHERE id = ?";
    private static final String UPDATE_COUPON = "update coupon set name = ?, value = ?,merchant_id=?, is_active = ? where id =?";
    private static final String SEARCH_COUPON_BY_NAME = "select id, value, is_active from coupon where name = ?";

    public CouponService(){}

    @Override
    public List<Coupon> findAll() {
        List<Coupon> coupons = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(SELECT_ALL_COUPONS);
            rs = statement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("coupon_id");
                String name = rs.getString("coupon_name");
                double value = rs.getDouble("coupon_value");
                int merchant_id = rs.getInt("coupon_merchant");

                Merchant merchant = merchantService.findById(merchant_id);
                boolean is_active = rs.getBoolean("coupon_is_active");
                coupons.add(new Coupon(id, name, value,merchant, is_active));
            }
            connection.commit();
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (Exception ex) {
                throw new RuntimeException(ex);
            }
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return coupons;
    }

    @Override
    public void save(Coupon coupon) {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(INSERT);
            statement.setInt(1, coupon.getId());
            statement.setString(2, coupon.getName());
            statement.setDouble(3, coupon.getValue());
            statement.setInt(4,coupon.getMerchant_id());
            statement.setBoolean(5, coupon.isIs_active());
            statement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null)connection.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }

    @Override
    public Coupon findById(int id) {
        Coupon coupon = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(SELECT_COUPON_BY_ID);
            statement.setInt(1, id);
            rs = statement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                double value = rs.getDouble("value");
                int merchant_id = rs.getInt("merchant_id");
                Merchant merchant = merchantService.findById(merchant_id);
                boolean is_active = rs.getBoolean("is_active");
                coupon = new Coupon(id, name, value,merchant, is_active);
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
        return coupon;
    }
    @Override
    public boolean remove(int id) {
        boolean rowDisable = false;
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(DISABLE_COUPON);
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
    @Override
    public boolean update(int id, Coupon coupon) {
        boolean rowUpdate = false;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(UPDATE_COUPON);
            statement.setString(1, coupon.getName());
            statement.setDouble(2, coupon.getValue());
            statement.setInt(3, coupon.getMerchant_id());
            statement.setBoolean(4, coupon.isIs_active());
            statement.setInt(5, id);
            rowUpdate = statement.executeUpdate() > 0;
            connection.commit();
        } catch (SQLException e){
            try {
                connection.rollback();
            } catch (SQLException exception){
                throw  new RuntimeException(exception);
            }
        }finally {
            try {
                if (statement != null) {statement.close();}
                if (connection != null) {connection.close();}
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
        return rowUpdate;
    }
    public List<Coupon> findCouponByName(String name){
        List<Coupon> coupons = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(SEARCH_COUPON_BY_NAME);
            statement.setString(1, name);
            rs = statement.executeQuery();
            while (rs.next()){
                int id = Integer.parseInt(rs.getString("id"));
                double value = Double.parseDouble(rs.getString("value"));
                int merchant_id = Integer.parseInt(rs.getString("merchant_id"));
                boolean is_value = rs.getBoolean("is_value");
                coupons.add(new Coupon(id, name, value,merchant_id, is_value));
                connection.commit();
            }
        }catch (SQLException e) {
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
        return coupons;
    }
}
