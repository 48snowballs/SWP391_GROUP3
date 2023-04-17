/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Context;

import Model.Order;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author vuman
 */
public class OrderDAO extends DBContext {

    public void addOrder(int productId, int quantity, int payment, int userid) {
        try {
            executeUpdate("INSERT INTO [Order](ProductID, BillID, Quantity, Payment) VALUES (?, (SELECT TOP 1 BillID FROM Bill WHERE [CustomerID] = ? ORDER BY BillID DESC), ?, ?)", productId, userid, quantity, payment);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Order> getAllOrders() {
        try ( ResultSet rs = executeQuery("SELECT * FROM [Order]")) {
            ArrayList<Order> list = new ArrayList<>();

            while (rs.next()) {
                int oid = rs.getInt("OrderID");
                int pid = rs.getInt("ProductID");
                int bid = rs.getInt("BillID");
                int quantity = rs.getInt("Quantity");
                int payment = rs.getInt("Payment");

                list.add(new Order(oid, pid, bid, quantity, payment));
            }

            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public int getRevenue(int month) {
        int revenue = 0;
        try ( ResultSet rs = executeQuery("SELECT SUM(Payment) AS revenue FROM [Order]\n"
                + "full join Bill\n"
                + "on [Order].BillID=[Bill].BillID\n"
                + "WHERE MONTH(Bill.Date) =? ",month)) {
            while (rs.next()) {
                revenue= rs.getInt("revenue");              
            }
            return revenue;
        } catch (Exception e) {
        }
        return 0;
    }
    public static void main(String[] args) {
        OrderDAO o=new OrderDAO();
        System.out.println(o.getRevenue(3));
    }
}


