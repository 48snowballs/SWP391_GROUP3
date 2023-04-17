/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Context;

import java.sql.ResultSet;

/**
 *
 * @author baqua
 */
public class AccountDAO extends DBContext {

    public Integer getRoleByUsername(String username) {
        try ( ResultSet rs = executeQuery("SELECT * FROM [Account] WHERE [Username] = ?", username)) {
            if (rs.next()) {
                return rs.getInt("Role");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updatePassword(String username, String password) {
        try {
            executeUpdate("UPDATE Account SET [Password] = ? WHERE Username = ?", password, username);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteAccount(int id) {
        try {
            executeUpdate("DELETE FROM [Account] WHERE [UserID] = ?", id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
