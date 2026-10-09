# InternTrack — Internship Management System

## About the Project
InternTrack is a Java-based web application designed to help students manage and track their internship applications in one place. It allows users to record internship details, monitor application status, and maintain organized records.

## Features
- **Create:** Add new internship applications with details such as company name, role, location, stipend, and application date.
- **Read:** View internship records through a dashboard.
- **Update:** Edit existing internship details and application status.
- **Delete:** Remove internship records when they are no longer needed.
- **Status Tracking:** Track applications as Applied, Interview, Selected, or Rejected.
- **Dashboard:** View application summaries and status counts.

## Technologies Used
- **Frontend:** JSP, HTML, CSS
- **Backend:** Java Servlets and Java
- **Database:** Oracle Database XE
- **Database Connectivity:** JDBC
- **Server:** GlassFish Server 4.1.1
- **IDE:** NetBeans IDE 8.2

## Project Structure

```text
InternTrack/
├── Web Pages/
│   ├── WEB-INF/
│   ├── index.jsp
│   ├── dashboard.jsp
│   ├── addInternship.jsp
│   └── editInternship.jsp
├── Source Packages/
│   ├── controller/
│   │   └── InternshipServlet.java
│   ├── dao/
│   │   └── InternshipDAO.java
│   └── model/
│       └── Internship.java
├── Libraries/
│   └── ojdbc6.jar
├── Configuration Files/
│   └── MANIFEST.MF
└── build.xml
```

*Note: `DBConnection.java` is also part of the project it is located in your DAO or another source package.*

## Architecture
The application follows a simple MVC-style structure:
- **Model:** `Internship.java` represents internship data.
- **Controller:** `InternshipServlet.java` handles user requests.
- **DAO:** `InternshipDAO.java` performs database operations.
- **View:** JSP pages provide the user interface.
- **Database Connection:** JDBC connects the Java application to Oracle XE.

## Purpose
InternTrack provides a centralized way to organize internship applications and track progress throughout the application process. It demonstrates Java web development, database connectivity, and CRUD operations.

## Future Enhancements
- User authentication and individual student accounts.
- Search and filter internships.
- Application deadline reminders.
- Export internship records to CSV or PDF.
