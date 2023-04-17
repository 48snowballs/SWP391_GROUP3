/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Context;

import Model.Brand;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author vuman
 */
public class BrandDAO extends DBContext {

    public ArrayList<Brand> getAllBrands() {
        try ( ResultSet rs = executeQuery("SELECT * FROM [Brand]")) {
            ArrayList<Brand> list = new ArrayList<>();

            while (rs.next()) {
                int id = rs.getInt("BrandID");
                String name = rs.getNString("Name");
                list.add(new Brand(id, name));
            }

            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Brand getBrandByName(String name) {
        try ( ResultSet rs = executeQuery("SELECT * FROM [Brand] WHERE [Name] = ?", name)) {
            if (rs.next()) {
                int id = rs.getInt("BrandID");
                return new Brand(id, name);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Brand getBrandByID(int id) {
        try ( ResultSet rs = executeQuery("SELECT * FROM [Brand] WHERE [BrandID] = ?", id)) {
            if (rs.next()) {
                String name = rs.getNString("Name");
                return new Brand(id, name);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public String getDescription(int brandId){
         try ( ResultSet rs = executeQuery("SELECT [Description] FROM [Brand] WHERE [BrandID] = ?",brandId)) {
            if (rs.next()) {
                String des = rs.getString("Description");
                return des;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) {
        BrandDAO b=new BrandDAO();
        System.out.println(b.getDescription(1));
    }
    }

