/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class Student {
    private String id;
    private String name;
    private String facultyID;

    public Student() {
    }

    public Student(String id, String name, String facultyID) {
        this.id = id;
        this.name = name;
        this.facultyID = facultyID;
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

    public String getFacultyID() {
        return facultyID;
    }

    public void setFacultyID(String facultyID) {
        this.facultyID = facultyID;
    }

    @Override
    public String toString() {
        return "Student{" + "id=" + id + ", name=" + name + ", facultyID=" + facultyID + '}';
    }
    
    
}
