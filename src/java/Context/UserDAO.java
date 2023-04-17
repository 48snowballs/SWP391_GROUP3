package Context;

import Model.Account;
import Model.User;
import java.sql.ResultSet;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Map;

/**
 *
 * @author baqua
 */
public class UserDAO extends DBContext {

    public boolean checkLogin(String username, String password) {
        try ( ResultSet rs = executeQuery("SELECT * FROM [Account] WHERE [Username] = ? AND [Password] = ?", username, password)) {
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isAccountExist(String username) {
        try ( ResultSet rs = executeQuery("SELECT * FROM [Account] WHERE [Username] = ?", username)) {
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void addUser(User u, Account a) {
        execute("EXEC [sp_create_account] ?, ?, ?, ?, ? ,?, ?",
                a.getUsername(),
                a.getPassword(),
                u.getName(),
                u.getEmail(),
                u.getAddress(),
                u.getPhone(),
                a.getRole()
        );
    }

    public User getUserInforByUsername(String username) {
        try ( ResultSet rs = executeQuery("SELECT [User].UserID, [User].Name, [User].Email, [User].Address, [User].Phone FROM [User], [Account] WHERE [User].UserId = [Account].UserID AND [Account].Username = ?", username)) {
            if (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getNString(2);
                String email = rs.getNString(3);
                String address = rs.getNString(4);
                String phone = rs.getString(5);

                return new User(id, name, email, address, phone);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Map.Entry<Account, User>> getAllUsers() {
        try ( ResultSet rs = executeQuery("SELECT * FROM [Account], [User] WHERE [Account].[UserID] = [User].[UserID]")) {
            ArrayList<Map.Entry<Account, User>> result = new ArrayList<>();

            while (rs.next()) {
                result.add(new AbstractMap.SimpleEntry<>(
                        new Account(rs.getString("username"), rs.getString("password"), rs.getInt("Role")),
                        new User(rs.getInt("UserID"), rs.getNString("name"), rs.getNString("email"), rs.getNString("address"), rs.getNString("phone"))
                ));
            }

            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateUser(User u) {
        try {
            executeUpdate("UPDATE [User] SET Name = ?, Email = ?, Phone = ?, Address = ? WHERE UserID = ?", u.getName(), u.getEmail(), u.getPhone(), u.getAddress(), u.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
