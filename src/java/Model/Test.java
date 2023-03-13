/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class Test {
    private String id;
    private String category;
    private double weight;
    private String subID;
    private String stuID;

    public Test() {
    }

    public Test(String id, String category, double weight, String subID, String stuID) {
        this.id = id;
        this.category = category;
        this.weight = weight;
        this.subID = subID;
        this.stuID = stuID;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public String getSubID() {
        return subID;
    }

    public void setSubID(String subID) {
        this.subID = subID;
    }

    public String getStuID() {
        return stuID;
    }

    public void setStuID(String stuID) {
        this.stuID = stuID;
    }

    @Override
    public String toString() {
        return "Test{" + "id=" + id + ", category=" + category + ", weight=" + weight + ", subID=" + subID + ", stuID=" + stuID + '}';
    }
    
}
