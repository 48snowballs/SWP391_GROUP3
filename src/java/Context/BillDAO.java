/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Context;

import Model.Bill;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Map;

/**
 *
 * @author vuman
 */
public class BillDAO extends DBContext {

    public void addBill(Integer customerId, Date date, String address) {
        try {
            executeUpdate("INSERT INTO [Bill]([CustomerID], [Date], [Address]) VALUES (?, ?, ?)", customerId, date, address);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Map.Entry<Bill, String>> getAllBills() {
        try ( ResultSet rs = executeQuery("SELECT *, (SELECT [Name] FROM [User] WHERE [Bill].[CustomerID] = [User].[UserID]) AS [CustomerName] FROM [Bill]")) {
            ArrayList<Map.Entry<Bill, String>> result = new ArrayList<>();

            while (rs.next()) {
                result.add(new AbstractMap.SimpleEntry<>(
                        new Bill(rs.getInt("BillID"), rs.getInt("CustomerID"), rs.getDate("Date"), rs.getNString("Address")),
                        rs.getNString("CustomerName")
                ));
            }

            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Bill> getAllBillsByUsername(String username) {
        try ( ResultSet rs = executeQuery("SELECT [Bill].* FROM [Bill], [Account] WHERE [Bill].[CustomerID] = [Account].[UserID] AND [Username] = ?", username)) {
            ArrayList<Bill> result = new ArrayList<>();

            while (rs.next()) {
                result.add(new Bill(rs.getInt("BillID"), rs.getInt("CustomerID"), rs.getDate("Date"), rs.getNString("Address")));
            }

            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
