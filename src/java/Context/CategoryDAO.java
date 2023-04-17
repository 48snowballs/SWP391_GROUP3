/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Context;
import Model.Category;
import java.sql.ResultSet;
import java.util.ArrayList;
/**
 *
 * @author pc
 */
public class CategoryDAO extends DBContext{
    public ArrayList<Category> getAllCategory() {
        try ( ResultSet rs = executeQuery("SELECT * FROM [Category]")) {
            ArrayList<Category> list = new ArrayList<>();

            while (rs.next()) {
                int id = rs.getInt("CategoryID");
                String name = rs.getNString("Name");
                list.add(new Category(id, name,name));
            }

            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) {
        CategoryDAO c=new CategoryDAO();
        ArrayList<Category> t=c.getAllCategory();
        for(Category cate:t){
            System.out.println(cate.getName());
        }
    }
}
