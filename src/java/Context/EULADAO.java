/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Context;

import Model.Cart;
import Model.EULA;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author baqua
 */
public class EULADAO extends DBContext {

    public ArrayList<EULA> getAllEULA() {
        try ( ResultSet rs = executeQuery("SELECT * FROM [EULA]")) {
            ArrayList<EULA> list = new ArrayList<>();

            while (rs.next()) {
                Integer id = rs.getInt("ID");
                String content = rs.getString("EULA");
                list.add(new EULA(id, content));
            }

            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void editEULA(EULA eula) {
        try {
            executeUpdate("UPDATE [EULA] SET [EULA].[EULA] = ? WHERE [ID] = ?", eula.getContent(), eula.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
