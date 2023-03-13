/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class Mark {
    private String id;
    private String value;
    private String testID;

    public Mark() {
    }

    public Mark(String id, String value, String testID) {
        this.id = id;
        this.value = value;
        this.testID = testID;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getTestID() {
        return testID;
    }

    public void setTestID(String testID) {
        this.testID = testID;
    }

    @Override
    public String toString() {
        return "Mark{" + "id=" + id + ", value=" + value + ", testID=" + testID + '}';
    }
    
}
