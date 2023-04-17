/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Context;

import Model.Cart;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author vuman
 */
public class CartDAO extends DBContext {

    public void addCart(int userId, int productId, int quantity, String size) {
        try ( ResultSet rs = executeQuery("SELECT *, (SELECT Quantity FROM Product WHERE Product.ProductID = Cart.ProductID) AS [StockQuantity] FROM Cart WHERE UserID = ? AND ProductID = ? AND Size = ?", userId, productId, size)) {
            if (rs.next()) {
                int oldQuantity = rs.getInt("Quantity");
                int stockQuantity = rs.getInt("StockQuantity");

                if (oldQuantity + quantity > stockQuantity) {
                    quantity = stockQuantity - oldQuantity;
                }

                executeUpdate("UPDATE [Cart] SET Quantity = Quantity + ? WHERE UserID = ? AND ProductID = ? AND Size = ?", quantity, userId, productId, size);
                return;
            }
            executeUpdate("INSERT INTO [Cart] VALUES (?, ?, ?, ?)", userId, productId, quantity, size);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Cart> getCartListByUserId(int userId) {
        ArrayList<Cart> list = new ArrayList<>();
        try ( ResultSet rs = executeQuery("SELECT * FROM Cart WHERE UserID = ?", userId)) {
            int count = 0;
            while (rs.next()) {
                count++;
                int productId = rs.getInt("ProductID");
                int quantity = rs.getInt("Quantity");
                String size = rs.getString("Size");

                list.add(new Cart(userId, productId, quantity, size));
            }

            if(count != 0){
                return list;
            }

        } catch (Exception e) {
            e.printStackTrace();

        }
        return null;
    }

    public void deleteCartAfterBuy(int userid) {
        try {
            executeUpdate("DELETE FROM Cart WHERE UserID = ?", userid);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void deleteCartProduct(int uid, int pid, String size){
        try {
            executeUpdate("DELETE FROM Cart WHERE UserID = ? AND ProductID = ? AND Size = ?", uid, pid, size);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
