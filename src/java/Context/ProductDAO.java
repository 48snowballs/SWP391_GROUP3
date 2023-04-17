/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Context;

import Model.Brand;
import Model.Product;
import java.sql.ResultSet;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Map;

/**
 *
 * @author vuman
 */
public class ProductDAO extends DBContext {

    public ArrayList<Map.Entry<Brand, Product>> getAllproductsEx() {
        try ( ResultSet rs = executeQuery("SELECT *, (SELECT [Name] FROM [Brand] WHERE [Brand].[BrandID] = [Product].[BrandID]) AS [BrandName] FROM [Product]")) {
            ArrayList<Map.Entry<Brand, Product>> list = new ArrayList<>();

            while (rs.next()) {
                int productId = rs.getInt("ProductID");
                String name = rs.getString("Name");
                String descrip = rs.getNString("Description");
                int price = rs.getInt("Price");
                String img = rs.getString("Image");
                int brandId = rs.getInt("BrandID");

                String color = rs.getString("Color");

                int categoryID = rs.getInt("CategoryID");

                list.add(new AbstractMap.SimpleEntry<>(
                        new Brand(brandId, rs.getNString("BrandName")),
                        new Product(productId, name, descrip, price, img, brandId, color, categoryID)
                ));
            }

            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Product> getAllproducts() {
        try ( ResultSet rs = executeQuery("SELECT * FROM [Product]")) {
            ArrayList<Product> list = new ArrayList<>();

            while (rs.next()) {
                int productId = rs.getInt("ProductID");
                String name = rs.getString("Name");
                String descrip = rs.getNString("Description");
                int price = rs.getInt("Price");
                String img = rs.getString("Image");
                int brandId = rs.getInt("BrandID");

                String color = rs.getString("Color");

                int categoryID = rs.getInt("CategoryID");
                list.add(new Product(productId, name, descrip, price, img, brandId, color, categoryID));
            }

            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Product getProductByProductId(int productId) {
        try ( ResultSet rs = executeQuery("SELECT * FROM [Product] WHERE [ProductID] = ?", productId)) {
            while (rs.next()) {

                String name = rs.getString("Name");
                String descrip = rs.getNString("Description");
                int price = rs.getInt("Price");
                String img = rs.getString("Image");
                int brandId = rs.getInt("BrandID");

                String color = rs.getString("Color");

                int categoryID = rs.getInt("CategoryID");
                return new Product(productId, name, descrip, price, img, brandId, color, categoryID);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Product> getProductsByBrand(String brand) {
        try ( ResultSet rs = executeQuery("SELECT * FROM [Product], [Brand] WHERE Product.BrandID = Brand.BrandID AND Brand.Name = ?", brand)) {
            ArrayList<Product> list = new ArrayList<>();

            while (rs.next()) {
                int productId = rs.getInt("ProductID");
                String name = rs.getString("Name");
                String descrip = rs.getNString("Description");
                int price = rs.getInt("Price");
                String img = rs.getString("Image");
                int brandId = rs.getInt("BrandID");

                String color = rs.getString("Color");

                int categoryID = rs.getInt("CategoryID");
                list.add(new Product(productId, name, descrip, price, img, brandId, color, categoryID));
            }
            return list;
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    public void editProduct(Product p) {
        try {
            executeUpdate(
                    "UPDATE Product SET [Name] = ?, [Description] = ?, [Image] = ?, [BrandID] = ?, "
                    + "[Color]=?, [Price] = ?,[CategoryID]=?"
                    + " WHERE [ProductID] = ?",
                    p.getName(),
                    p.getDescrip(),
                    p.getImg(),
                    p.getBrandId(),
                    p.getColor(),
                    p.getPrice(),
                    p.getCategoryID(),
                    p.getProductId()
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void createProduct(Product p) {
        try {
            executeUpdate(
                    " insert into  [Product]"
                    + "(Name,Description,Price,Image,BrandID,Color,CategoryID)"
                    + " VALUES(?,?,?,?,?,?,?)",
                    p.getName(),
                    p.getDescrip(),
                    p.getPrice(),
                    p.getImg(),
                    p.getBrandId(),
                    p.getColor(),
                    p.getCategoryID()
                    
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteProductByID(int id) {
        try {
            executeUpdate("DELETE FROM [Product] WHERE [ProductID] = ?", id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Product> getBestSellerProduct() {
        try ( ResultSet rs = executeQuery("Select* from Product where ProductID in(\n"
                + "SELECT TOP 4 Product.ProductID\n"
                + "FROM Product\n"
                + "INNER JOIN [Order] ON Product.ProductID = [Order].ProductID\n"
                + "GROUP BY Product.ProductID\n"
                + "ORDER BY SUM(Quantity) DESC)")) {
            ArrayList<Product> list = new ArrayList<>();

            while (rs.next()) {
                int productId = rs.getInt("ProductID");
                String name = rs.getString("Name");
                String descrip = rs.getNString("Description");
                int price = rs.getInt("Price");
                String img = rs.getString("Image");
                int brandId = rs.getInt("BrandID");

                String color = rs.getString("Color");

                int categoryID = rs.getInt("CategoryID");
                list.add(new Product(productId, name, descrip, price, img, brandId, color, categoryID));
            }

            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getLastProductId() {
        int id = 0;
        try ( ResultSet rs = executeQuery(
                "select MAX(ProductID)as [Last] from Product")) {
            
            while (rs.next()) {
                id=rs.getInt("Last");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }

    public static void main(String[] args) {
        ProductDAO p = new ProductDAO();
        p.createProduct(new Product(p.getLastProductId()+1,"Oppo Reno 6","None",6000000,"images\\brand-banner\\S22Ultra.jpg",4,"Blue",1));
    }
}
