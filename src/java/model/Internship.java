package model;

public class Internship {

    private int id;
    private String company;
    private String role;
    private String location;
    private String internshipType;
    private double stipend;
    private String applicationDate;
    private String status;
    private String notes;
    private String source;

    // Default constructor
    public Internship() {
    }

    // Parameterized constructor
    public Internship(String company, String role, String location,
            String internshipType, double stipend,
            String applicationDate, String status,
            String notes, String source) {

        this.company = company;
        this.role = role;
        this.location = location;
        this.internshipType = internshipType;
        this.stipend = stipend;
        this.applicationDate = applicationDate;
        this.status = status;
        this.notes = notes;
        this.source = source;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getInternshipType() {
        return internshipType;
    }

    public void setInternshipType(String internshipType) {
        this.internshipType = internshipType;
    }

    public double getStipend() {
        return stipend;
    }

    public void setStipend(double stipend) {
        this.stipend = stipend;
    }

    public String getApplicationDate() {
        return applicationDate;
    }

    public void setApplicationDate(String applicationDate) {
        this.applicationDate = applicationDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }
}