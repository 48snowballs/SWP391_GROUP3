/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Context;

import Model.Memory;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author vuman
 */
public class MemoryDAO extends DBContext {

    public ArrayList<Memory> getAllMemoryByProductId(int pid) {
        ArrayList<Memory> list = new ArrayList<>();
        try ( ResultSet rs = executeQuery("SELECT * FROM Memory WHERE ProductID = ?", pid)) {
            while (rs.next()) {
                String name = rs.getString("Name");
                int quantity = rs.getInt("Quantity");
                float priceRatio=rs.getFloat("priceRatio");
                list.add(new Memory(pid, name, quantity, priceRatio));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public void deleteSizeAfterBuy(int pid, String name, int quantity) {
        try {
            executeUpdate("UPDATE Memory SET Quantity = Quantity - ? WHERE ProductID = ? AND Name = ?", quantity, pid, name);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
