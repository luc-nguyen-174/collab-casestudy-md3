package com.case_study.casemd3.service.user;

import com.case_study.casemd3.model.Address;
import com.case_study.casemd3.model.User;
import com.case_study.casemd3.service.address.AddressService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.case_study.casemd3.connect.ConnectDB.getConnection;

public class UserService implements IUser {
    AddressService addressService = new AddressService();
    private static final String SELECT_ALL_USERS = "select ad.id, ad.address_name, ur.id, ur.name, ur.email, ur.phone " +
            "from user ur join address ad on ur.address_id = ad.id where is_active = true";
    private static final String INSERT = "insert into user(id, username, password, email, name, phone, address_id,is_active) " +
            "values(?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String SELECT_USER_BY_ID = "select ur.username, ur.password, ur.email, ur.name, ur.phone,ur.is_active,ur.address_id," +
            "ad.id, ad.address_name from user ur join address ad on ur.address_id= ad.id where ur.id=?" ;
    private static final String UPDATE_USER_BY_ID = "update user set username = ?, password = ?, name = ?,email=?, phone = ?," +
            " address_id=?, is_active = ? where id = ? ";
    private static final String DISABLE_USER_BY_ID = "UPDATE user set is_active = false where id = ?";
    private static final String SEARCH_USER_BY_NAME = "select ur.id, ur.username, ur.password, ur.email, ur.name, " +
            "ur.phone, ur.address_id, ur.is_active, a.address_name, a.id from user ur join address a on ur.address_id = a.id where ur.name = ?";


    @Override
    public List<User> findAll() {
        List<User> users = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(SELECT_ALL_USERS);
            rs = statement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String email = rs.getString("email");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                int address_id = rs.getInt("ad.id");
                Address address = addressService.findById(address_id);
                boolean is_active = rs.getBoolean("is_active");
                users.add(new User(id, email, name, phone, address, is_active));
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
        return users;
    }

    @Override
    public void save(User user) {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(INSERT);
            statement.setInt(1, user.getId());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getName());
            statement.setString(4, user.getPhone());
            statement.setInt(5, user.getAddress_id());
            statement.setBoolean(6, user.isIs_active());
            statement.executeUpdate();
            connection.commit();
            connection.setAutoCommit(true);

        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            } finally {
                try {
                    if (statement != null) statement.close();
                    connection.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        }
    }

    @Override
    public User findById(int id) {
        User user = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(SELECT_USER_BY_ID);
            statement.setInt(1, id);
            rs = statement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");

                int address_id = Integer.parseInt(rs.getString("ad.id"));
                Address address = addressService.findById(address_id);

                boolean is_active = rs.getBoolean("ur.is_active");
                user = new User(id, email, name, phone, address, is_active);

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

        return user;
    }

    @Override
    public boolean update(int id, User user) {
        boolean rowUpdate = false;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(UPDATE_USER_BY_ID);
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPhone());
            statement.setInt(4, user.getAddress_id());
            statement.setBoolean(5, user.isIs_active());
            statement.setInt(6, id);
            rowUpdate = statement.executeUpdate() > 0;
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
        return rowUpdate;
    }

    @Override
    public boolean remove(int id) {
        boolean rowDisable = false;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(DISABLE_USER_BY_ID);
            statement.setInt(1, id);
            rowDisable = statement.executeUpdate() > 0;
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
        return rowDisable;
    }

    public List<User> findUserByName(String name) {
        List<User> users = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(SEARCH_USER_BY_NAME);
            statement.setString(1, name);
            rs = statement.executeQuery();
            while (rs.next()) {

                int id = Integer.parseInt(rs.getString("ur.id"));
                String email = rs.getString("ur.email");
                String phone = rs.getString("ur.phone");
                int address_id = Integer.parseInt(rs.getString("ad.id"));
                Address address = addressService.findById(address_id);
                boolean is_active = rs.getBoolean("ur.is_active");
                users.add(new User(id, email, name, phone, address, is_active));

                connection.commit();
            }

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
        return users;
    }
}
