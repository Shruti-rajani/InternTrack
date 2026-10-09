package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Internship;

public class InternshipDAO {

    // CREATE - Add a new internship
public boolean addInternship(Internship internship) {

    String sql = "INSERT INTO INTERNSHIPS "
            + "(COMPANY, ROLE, LOCATION, INTERNSHIP_TYPE, STIPEND, "
            + "APPLICATION_DATE, STATUS, NOTES, SOURCE) "
            + "VALUES (?, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?)";

    try {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, internship.getCompany());
        ps.setString(2, internship.getRole());
        ps.setString(3, internship.getLocation());
        ps.setString(4, internship.getInternshipType());
        ps.setDouble(5, internship.getStipend());
        ps.setString(6, internship.getApplicationDate());
        ps.setString(7, internship.getStatus());
        ps.setString(8, internship.getNotes());
        ps.setString(9, internship.getSource());

        int result = ps.executeUpdate();

        ps.close();
        con.close();

        return result > 0;

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

    // READ - Get all internships
    public List<Internship> getAllInternships() {

        List<Internship> list = new ArrayList<>();

        String sql = "SELECT * FROM INTERNSHIPS ORDER BY ID DESC";

        try {
            Connection con = DBConnection.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {

                Internship internship = new Internship();

                internship.setId(rs.getInt("ID"));
                internship.setCompany(rs.getString("COMPANY"));
                internship.setRole(rs.getString("ROLE"));
                internship.setLocation(rs.getString("LOCATION"));
                internship.setInternshipType(
                        rs.getString("INTERNSHIP_TYPE"));
                internship.setStipend(rs.getDouble("STIPEND"));

                if (rs.getDate("APPLICATION_DATE") != null) {
                    internship.setApplicationDate(
                            rs.getDate("APPLICATION_DATE").toString());
                }

                internship.setStatus(rs.getString("STATUS"));
                internship.setNotes(rs.getString("NOTES"));
                internship.setSource(rs.getString("SOURCE"));

                list.add(internship);
            }

            rs.close();
            st.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // UPDATE - Update internship
    public boolean updateInternship(Internship internship) {

        String sql = "UPDATE INTERNSHIPS SET "
                + "COMPANY=?, ROLE=?, LOCATION=?, INTERNSHIP_TYPE=?, "
                + "STIPEND=?, APPLICATION_DATE=TO_DATE(?, 'YYYY-MM-DD'), "
                + "STATUS=?, NOTES=? WHERE ID=?";

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, internship.getCompany());
            ps.setString(2, internship.getRole());
            ps.setString(3, internship.getLocation());
            ps.setString(4, internship.getInternshipType());
            ps.setDouble(5, internship.getStipend());
            ps.setString(6, internship.getApplicationDate());
            ps.setString(7, internship.getStatus());
            ps.setString(8, internship.getNotes());
            ps.setInt(9, internship.getId());

            int result = ps.executeUpdate();

            ps.close();
            con.close();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // DELETE - Delete internship
    public boolean deleteInternship(int id) {

        String sql = "DELETE FROM INTERNSHIPS WHERE ID=?";

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            int result = ps.executeUpdate();

            ps.close();
            con.close();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}