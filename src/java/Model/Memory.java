/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author vuman
 */
public class Memory {

    private int id;
    private String size;
    private int quantity;
    private float priceRatio;

    public Memory() {
    }

    public Memory(int id, String size, int quantity, float priceRatio) {
        this.id = id;
        this.size = size;
        this.quantity = quantity;
        this.priceRatio = priceRatio;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPriceRatio() {
        return priceRatio;
    }

    public void setPriceRatio(float priceRatio) {
        this.priceRatio = priceRatio;
    }

}