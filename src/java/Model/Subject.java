/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class Subject {
    private String id;
    private String name;
    private int numOfCredits;

    public Subject() {
    }

    public Subject(String id, String name, int numOfCredits) {
        this.id = id;
        this.name = name;
        this.numOfCredits = numOfCredits;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNumOfCredits() {
        return numOfCredits;
    }

    public void setNumOfCredits(int numOfCredits) {
        this.numOfCredits = numOfCredits;
    }

    @Override
    public String toString() {
        return "Subject{" + "id=" + id + ", name=" + name + ", numOfCredits=" + numOfCredits + '}';
    }
    
    
}
