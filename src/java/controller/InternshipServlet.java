package controller;

import dao.InternshipDAO;
import model.Internship;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/InternshipServlet")
public class InternshipServlet extends HttpServlet {

    private InternshipDAO dao = new InternshipDAO();

    // Handles GET requests
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null || action.equals("list")) {

            List<Internship> internships = dao.getAllInternships();

            request.setAttribute("internships", internships);

            request.getRequestDispatcher("dashboard.jsp")
                    .forward(request, response);

        } else if (action.equals("delete")) {

            int id = Integer.parseInt(
                    request.getParameter("id"));

            dao.deleteInternship(id);

            response.sendRedirect(
                    "InternshipServlet?action=list");
        }
        else if (action.equals("edit")) {

            int id = Integer.parseInt(
                    request.getParameter("id"));

            List<Internship> internships =
                    dao.getAllInternships();

            for (Internship i : internships) {

                if (i.getId() == id) {

                    request.setAttribute(
                            "internship", i);

                    break;
                }
            }

            request.getRequestDispatcher(
                    "editInternship.jsp")
                    .forward(request, response);
        }
    }

    // Handles POST requests
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equals(action)) {

            Internship internship = new Internship();

            internship.setCompany(
                    request.getParameter("company"));

            internship.setRole(
                    request.getParameter("role"));

            internship.setLocation(
                    request.getParameter("location"));

            internship.setInternshipType(
                    request.getParameter("internshipType"));

            String stipend = request.getParameter("stipend");

            internship.setStipend(
                    stipend.isEmpty() ? 0 : Double.parseDouble(stipend));

            internship.setApplicationDate(
                    request.getParameter("applicationDate"));

            internship.setStatus(
                    request.getParameter("status"));

            internship.setNotes(
                    request.getParameter("notes"));
            internship.setSource(
                request.getParameter("source"));

            dao.addInternship(internship);

            response.sendRedirect(
                    "InternshipServlet?action=list");
        }
        else if ("update".equals(action)) {

            Internship internship = new Internship();

            internship.setId(
                    Integer.parseInt(
                            request.getParameter("id")));

            internship.setCompany(
                    request.getParameter("company"));

            internship.setRole(
                    request.getParameter("role"));

            internship.setLocation(
                    request.getParameter("location"));

            internship.setInternshipType(
                    request.getParameter("internshipType"));

            String stipend =
                    request.getParameter("stipend");

            internship.setStipend(
                    stipend.isEmpty()
                    ? 0
                    : Double.parseDouble(stipend));

            internship.setApplicationDate(
                    request.getParameter("applicationDate"));

            internship.setStatus(
                    request.getParameter("status"));

            internship.setSource(
                    request.getParameter("source"));

            internship.setNotes(
                    request.getParameter("notes"));

            dao.updateInternship(internship);

            response.sendRedirect(
                    "InternshipServlet?action=list");
        }
    }
}