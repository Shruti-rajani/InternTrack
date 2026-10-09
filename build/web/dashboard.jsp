<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.temporal.ChronoUnit" %>
<%@ page import="model.Internship" %>

<%
    List<Internship> internships =
            (List<Internship>) request.getAttribute("internships");

    if (internships == null) {
        internships = new java.util.ArrayList<Internship>();
    }

    int total = internships.size();
    int applied = 0;
    int interview = 0;
    int selected = 0;
    int rejected = 0;
    int followUp = 0;

    DateTimeFormatter formatter =
            DateTimeFormatter.ofPattern("yyyy-MM-dd");

    for (Internship i : internships) {

        if ("Applied".equalsIgnoreCase(i.getStatus())) {
            applied++;

            try {
                if (i.getApplicationDate() != null
                        && !i.getApplicationDate().isEmpty()) {

                    LocalDate applicationDate =
                            LocalDate.parse(
                                    i.getApplicationDate(),
                                    formatter
                            );

                    long days =
                            ChronoUnit.DAYS.between(
                                    applicationDate,
                                    LocalDate.now()
                            );

                    if (days >= 7) {
                        followUp++;
                    }
                }
            } catch (Exception e) {
                // Ignore invalid date
            }

        } else if ("Interview".equalsIgnoreCase(i.getStatus())) {
            interview++;

        } else if ("Selected".equalsIgnoreCase(i.getStatus())) {
            selected++;

        } else if ("Rejected".equalsIgnoreCase(i.getStatus())) {
            rejected++;
        }
    }

    int activeApplications = applied + interview;

    int updatedApplications =
            interview + selected + rejected;

    int updateRate = total == 0
            ? 0
            : (updatedApplications * 100) / total;

    int selectionRate = total == 0
            ? 0
            : (selected * 100) / total;

    String smartMessage;

    if (total == 0) {
        smartMessage =
                "Start by adding your first internship application.";
    } else if (interview > 0) {
        smartMessage =
                "You have interview opportunities. Focus on preparation and follow-ups.";
    } else if (followUp > 0) {
        smartMessage =
                "Some applications have been waiting for 7+ days. Consider following up.";
    } else if (applied > 0) {
        smartMessage =
                "Your applications are active. Keep applying consistently.";
    } else if (selected > 0) {
        smartMessage =
                "Congratulations! Keep building your career journey.";
    } else {
        smartMessage =
                "Keep tracking your applications and updating their status.";
    }

    java.time.LocalTime currentTime =
            java.time.LocalTime.now();

    String greeting;

    if (currentTime.isBefore(java.time.LocalTime.NOON)) {
        greeting = "Good morning";
    } else if (currentTime.isBefore(java.time.LocalTime.of(17, 0))) {
        greeting = "Good afternoon";
    } else {
        greeting = "Good evening";
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>InternTrack Dashboard</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f4f6fb;
            color: #17233d;
        }

        /* ================= SIDEBAR ================= */

        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: 285px;
            height: 100vh;
            background: #172137;
            color: white;
            padding: 34px 24px;
        }

        .logo {
            font-size: 30px;
            font-weight: 800;
            margin-bottom: 62px;
            padding-left: 4px;
        }

        .logo span {
            color: #6275ed;
        }

        .menu-title {
            color: #9ba9c8;
            font-size: 13px;
            letter-spacing: 0.5px;
            margin: 0 0 14px 17px;
            text-transform: uppercase;
        }

        .menu {
            margin-bottom: 38px;
        }

        .menu a {
            display: flex;
            align-items: center;
            gap: 14px;
            text-decoration: none;
            color: #e8ecf7;
            padding: 15px 18px;
            border-radius: 12px;
            margin-bottom: 7px;
            font-size: 16px;
            transition: 0.2s;
        }

        .menu a:hover {
            background: rgba(98, 117, 237, 0.15);
        }

        .menu a.active {
            background: #586ce5;
            color: white;
            box-shadow: 0 8px 20px rgba(88, 108, 229, 0.25);
        }

        .nav-icon {
            width: 22px;
            height: 22px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .nav-icon svg {
            width: 19px;
            height: 19px;
            stroke: currentColor;
            fill: none;
            stroke-width: 2;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        /* ================= MAIN ================= */

        .main {
            margin-left: 285px;
            padding: 46px 58px;
        }

        .top-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 38px;
        }

        .welcome h1 {
            font-size: 38px;
            margin-bottom: 8px;
            letter-spacing: -1px;
        }

        .welcome p {
            color: #7a879f;
            font-size: 17px;
        }

        .add-button {
            text-decoration: none;
            background: #586ce5;
            color: white;
            padding: 17px 25px;
            border-radius: 12px;
            font-weight: bold;
            font-size: 16px;
            box-shadow: 0 8px 20px rgba(88, 108, 229, 0.25);
            transition: 0.2s;
        }

        .add-button:hover {
            background: #4d60d6;
            transform: translateY(-1px);
        }

        /* ================= STAT CARDS ================= */

        .stats {
            display: grid;
            grid-template-columns:
                repeat(4, 1fr);
            gap: 24px;
            margin-bottom: 28px;
        }

        .stat-card {
            background: white;
            padding: 27px 29px;
            border-radius: 20px;
            box-shadow:
                0 8px 25px rgba(29, 42, 70, 0.05);
            border: 1px solid #edf0f6;
        }

        .stat-label {
            color: #74829d;
            font-size: 15px;
            margin-bottom: 12px;
        }

        .stat-value {
            font-size: 34px;
            font-weight: 800;
        }

        .stat-card:nth-child(2) .stat-value {
            color: #586ce5;
        }

        .stat-card:nth-child(3) .stat-value {
            color: #e99b3f;
        }

        .stat-card:nth-child(4) .stat-value {
            color: #35a97a;
        }

        /* ================= INTELLIGENCE ================= */

        .intelligence {
            display: grid;
            grid-template-columns: 1.25fr 1fr;
            gap: 24px;
            margin-bottom: 28px;
        }

        .panel {
            background: white;
            border-radius: 20px;
            padding: 27px 30px;
            border: 1px solid #edf0f6;
            box-shadow:
                0 8px 25px rgba(29, 42, 70, 0.05);
        }

        .panel-title {
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 23px;
        }

        /* Pipeline */

        .pipeline-row {
            margin-bottom: 18px;
        }

        .pipeline-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 7px;
            font-size: 14px;
        }

        .pipeline-name {
            color: #64718a;
        }

        .pipeline-number {
            font-weight: bold;
        }

        .progress {
            height: 8px;
            background: #edf0f6;
            border-radius: 20px;
            overflow: hidden;
        }

        .progress-bar {
            height: 100%;
            border-radius: 20px;
            transition: width 0.4s;
        }

        .applied-bar {
            background: #586ce5;
        }

        .interview-bar {
            background: #e99b3f;
        }

        .selected-bar {
            background: #35a97a;
        }

        .rejected-bar {
            background: #e05d6f;
        }

        /* Career Pulse */

        .pulse-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
        }

        .pulse-item {
            background: #f7f8fc;
            border-radius: 14px;
            padding: 18px;
        }

        .pulse-number {
            font-size: 25px;
            font-weight: 800;
            margin-bottom: 5px;
        }

        .pulse-label {
            color: #7b879e;
            font-size: 13px;
        }

        /* Smart Action */

        .smart-action {
            margin-top: 17px;
            background: #f1f3ff;
            border: 1px solid #e0e4ff;
            border-radius: 14px;
            padding: 16px;
        }

        .smart-title {
            font-size: 13px;
            font-weight: bold;
            color: #586ce5;
            margin-bottom: 6px;
            text-transform: uppercase;
        }

        .smart-text {
            font-size: 14px;
            line-height: 1.5;
            color: #58647c;
        }

        /* ================= APPLICATIONS ================= */

        .applications {
            background: white;
            border-radius: 20px;
            padding: 32px;
            border: 1px solid #edf0f6;
            box-shadow:
                0 8px 25px rgba(29, 42, 70, 0.05);
        }

        .application-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .application-title {
            font-size: 22px;
            font-weight: 700;
        }

        .filters {
            display: flex;
            gap: 10px;
        }

        .search-box,
        .status-filter {
            border: 1px solid #dfe4ee;
            border-radius: 10px;
            padding: 12px 15px;
            font-size: 14px;
            outline: none;
            background: white;
        }

        .search-box {
            width: 230px;
        }

        .search-box:focus,
        .status-filter:focus {
            border-color: #586ce5;
        }

        .table-wrapper {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 950px;
        }

        th {
            text-align: left;
            color: #8290a8;
            font-size: 13px;
            padding: 15px 16px;
            border-bottom: 1px solid #e8ebf2;
        }

        td {
            padding: 17px 16px;
            border-bottom: 1px solid #edf0f5;
            font-size: 14px;
        }

        tr:hover td {
            background: #fafbfe;
        }

        .company {
            font-weight: 700;
            color: #1b2944;
        }

        .role {
            color: #69768f;
        }

        .status {
            display: inline-block;
            padding: 7px 11px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }

        .status-applied {
            background: #eef0ff;
            color: #586ce5;
        }

        .status-interview {
            background: #fff4e6;
            color: #c67b1e;
        }

        .status-selected {
            background: #e8f8f1;
            color: #27865f;
        }

        .status-rejected {
            background: #ffedf0;
            color: #c5485b;
        }

        .action {
            text-decoration: none;
            font-weight: 600;
            margin-right: 12px;
        }

        .edit {
            color: #586ce5;
        }

        .delete {
            color: #d95367;
        }

        .empty {
            text-align: center;
            padding: 60px 20px;
            color: #7e8aa1;
        }

        .empty-title {
            font-size: 17px;
            font-weight: 600;
            color: #536079;
            margin-bottom: 7px;
        }

        .empty-subtitle {
            font-size: 14px;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 1200px) {

            .stats {
                grid-template-columns:
                    repeat(2, 1fr);
            }

            .intelligence {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 850px) {

            .sidebar {
                width: 220px;
            }

            .main {
                margin-left: 220px;
                padding: 30px;
            }

            .top-section {
                align-items: flex-start;
                gap: 20px;
            }
        }

        @media (max-width: 650px) {

            .sidebar {
                position: relative;
                width: 100%;
                height: auto;
            }

            .main {
                margin-left: 0;
                padding: 25px;
            }

            .stats {
                grid-template-columns: 1fr;
            }

            .top-section {
                flex-direction: column;
            }

            .filters {
                flex-direction: column;
            }

            .search-box {
                width: 100%;
            }
        }

    </style>

</head>

<body>

<!-- ================= SIDEBAR ================= -->

<div class="sidebar">

    <div class="logo">
        Intern<span>Track</span>
    </div>

    <div class="menu-title">
        Main Menu
    </div>

    <div class="menu">

        <a href="InternshipServlet?action=list"
           class="active">

            <span class="nav-icon">

                <svg viewBox="0 0 24 24">
                    <rect x="3" y="3"
                          width="7" height="7"></rect>
                    <rect x="14" y="3"
                          width="7" height="7"></rect>
                    <rect x="3" y="14"
                          width="7" height="7"></rect>
                    <rect x="14" y="14"
                          width="7" height="7"></rect>
                </svg>

            </span>

            Dashboard

        </a>

        <a href="addInternship.jsp">

            <span class="nav-icon">

                <svg viewBox="0 0 24 24">
                    <line x1="12" y1="5"
                          x2="12" y2="19"></line>
                    <line x1="5" y1="12"
                          x2="19" y2="12"></line>
                </svg>

            </span>

            Add Internship

        </a>

    </div>


    <div class="menu-title">
        Management
    </div>

    <div class="menu">

        <a href="#applications">

            <span class="nav-icon">

                <svg viewBox="0 0 24 24">
                    <rect x="4" y="4"
                          width="16" height="16"
                          rx="2"></rect>
                    <line x1="8" y1="9"
                          x2="16" y2="9"></line>
                    <line x1="8" y1="13"
                          x2="16" y2="13"></line>
                    <line x1="8" y1="17"
                          x2="13" y2="17"></line>
                </svg>

            </span>

            Applications

        </a>

    </div>

</div>


<!-- ================= MAIN ================= -->

<div class="main">

    <!-- HEADER -->

    <div class="top-section">

        <div class="welcome">

            <h1>
                <%= greeting %>, Shruti ?
            </h1>

            <p>
                Here's an overview of your internship journey.
            </p>

        </div>

        <a href="addInternship.jsp"
           class="add-button">

            + Add Internship

        </a>

    </div>


    <!-- ================= STATS ================= -->

    <div class="stats">

        <div class="stat-card">

            <div class="stat-label">
                Total Applications
            </div>

            <div class="stat-value">
                <%= total %>
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-label">
                Applied
            </div>

            <div class="stat-value">
                <%= applied %>
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-label">
                Interviews
            </div>

            <div class="stat-value">
                <%= interview %>
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-label">
                Selected
            </div>

            <div class="stat-value">
                <%= selected %>
            </div>

        </div>

    </div>


    <!-- ================= APPLICATION INTELLIGENCE ================= -->

    <div class="intelligence">

        <!-- PIPELINE -->

        <div class="panel">

            <div class="panel-title">
                Application Pipeline
            </div>


            <div class="pipeline-row">

                <div class="pipeline-header">

                    <span class="pipeline-name">
                        Applied
                    </span>

                    <span class="pipeline-number">
                        <%= applied %>
                    </span>

                </div>

                <div class="progress">

                    <div class="progress-bar applied-bar"
                         style="width:<%= total == 0 ? 0 : (applied * 100 / total) %>%;">
                    </div>

                </div>

            </div>


            <div class="pipeline-row">

                <div class="pipeline-header">

                    <span class="pipeline-name">
                        Interview
                    </span>

                    <span class="pipeline-number">
                        <%= interview %>
                    </span>

                </div>

                <div class="progress">

                    <div class="progress-bar interview-bar"
                         style="width:<%= total == 0 ? 0 : (interview * 100 / total) %>%;">
                    </div>

                </div>

            </div>


            <div class="pipeline-row">

                <div class="pipeline-header">

                    <span class="pipeline-name">
                        Selected
                    </span>

                    <span class="pipeline-number">
                        <%= selected %>
                    </span>

                </div>

                <div class="progress">

                    <div class="progress-bar selected-bar"
                         style="width:<%= total == 0 ? 0 : (selected * 100 / total) %>%;">
                    </div>

                </div>

            </div>


            <div class="pipeline-row">

                <div class="pipeline-header">

                    <span class="pipeline-name">
                        Rejected
                    </span>

                    <span class="pipeline-number">
                        <%= rejected %>
                    </span>

                </div>

                <div class="progress">

                    <div class="progress-bar rejected-bar"
                         style="width:<%= total == 0 ? 0 : (rejected * 100 / total) %>%;">
                    </div>

                </div>

            </div>

        </div>


        <!-- CAREER PULSE -->

        <div class="panel">

            <div class="panel-title">
                Career Pulse
            </div>

            <div class="pulse-grid">

                <div class="pulse-item">

                    <div class="pulse-number">
                        <%= activeApplications %>
                    </div>

                    <div class="pulse-label">
                        Active Applications
                    </div>

                </div>


                <div class="pulse-item">

                    <div class="pulse-number">
                        <%= updateRate %>%
                    </div>

                    <div class="pulse-label">
                        Status Updated
                    </div>

                </div>


                <div class="pulse-item">

                    <div class="pulse-number">
                        <%= selectionRate %>%
                    </div>

                    <div class="pulse-label">
                        Selection Rate
                    </div>

                </div>


                <div class="pulse-item">

                    <div class="pulse-number">
                        <%= followUp %>
                    </div>

                    <div class="pulse-label">
                        Follow-ups Needed
                    </div>

                </div>

            </div>


            <div class="smart-action">

                <div class="smart-title">
                    Smart Next Step
                </div>

                <div class="smart-text">
                    <%= smartMessage %>
                </div>

            </div>

        </div>

    </div>


    <!-- ================= APPLICATION TABLE ================= -->

    <div class="applications"
         id="applications">

        <div class="application-top">

            <div class="application-title">
                Recent Applications
            </div>

            <div class="filters">

                <input
                    type="text"
                    id="searchInput"
                    class="search-box"
                    placeholder="Search company..."
                    onkeyup="filterApplications()"
                >

                <select
                    id="statusFilter"
                    class="status-filter"
                    onchange="filterApplications()">

                    <option value="All">
                        All Status
                    </option>

                    <option value="Applied">
                        Applied
                    </option>

                    <option value="Interview">
                        Interview
                    </option>

                    <option value="Selected">
                        Selected
                    </option>

                    <option value="Rejected">
                        Rejected
                    </option>

                </select>

            </div>

        </div>


        <div class="table-wrapper">

            <table id="applicationTable">

                <thead>

                    <tr>

                        <th>COMPANY</th>
                        <th>ROLE</th>
                        <th>LOCATION</th>
                        <th>TYPE</th>
                        <th>STIPEND</th>
                        <th>STATUS</th>
                        <th>SOURCE</th>
                        <th>ACTION</th>

                    </tr>

                </thead>


                <tbody>

                <%
                    if (internships.isEmpty()) {
                %>

                    <tr>

                        <td colspan="8">

                            <div class="empty">

                                <div class="empty-title">
                                    No internship applications yet.
                                </div>

                                <div class="empty-subtitle">
                                    Click "Add Internship" to start
                                    building your career pipeline.
                                </div>

                            </div>

                        </td>

                    </tr>

                <%
                    } else {

                        for (Internship i : internships) {

                            String statusClass =
                                    "status-applied";

                            if ("Interview".equalsIgnoreCase(
                                    i.getStatus())) {

                                statusClass =
                                        "status-interview";

                            } else if ("Selected".equalsIgnoreCase(
                                    i.getStatus())) {

                                statusClass =
                                        "status-selected";

                            } else if ("Rejected".equalsIgnoreCase(
                                    i.getStatus())) {

                                statusClass =
                                        "status-rejected";
                            }
                %>

                    <tr class="application-row">

                        <td class="company">
                            <%= i.getCompany() %>
                        </td>

                        <td class="role">
                            <%= i.getRole() %>
                        </td>

                        <td>
                            <%= i.getLocation() %>
                        </td>

                        <td>
                            <%= i.getInternshipType() %>
                        </td>

                        <td>
                            ?<%= String.format(
                                    "%.0f",
                                    i.getStipend()) %>
                        </td>

                        <td>

                            <span class="status <%= statusClass %>">

                                <%= i.getStatus() %>

                            </span>

                        </td>

                        <td>
                            <%= i.getSource() %>
                        </td>

                        <td>

                            <a
                                class="action edit"
                                href="InternshipServlet?action=edit&id=<%= i.getId() %>">

                                Edit

                            </a>

                            <a
                                class="action delete"
                                href="InternshipServlet?action=delete&id=<%= i.getId() %>"
                                onclick="return confirm('Delete this internship application?');">

                                Delete

                            </a>

                        </td>

                    </tr>

                <%
                        }
                    }
                %>

                </tbody>

            </table>

        </div>

    </div>

</div>


<!-- ================= JAVASCRIPT ================= -->

<script>

function filterApplications() {

    var search =
        document.getElementById("searchInput")
        .value
        .toLowerCase();

    var status =
        document.getElementById("statusFilter")
        .value;

    var rows =
        document.querySelectorAll(
            "#applicationTable tbody .application-row"
        );

    rows.forEach(function(row) {

        var company =
            row.cells[0].innerText
            .toLowerCase();

        var rowStatus =
            row.cells[5].innerText.trim();

        var companyMatch =
            company.includes(search);

        var statusMatch =
            status === "All"
            || rowStatus === status;

        if (companyMatch && statusMatch) {

            row.style.display = "";

        } else {

            row.style.display = "none";

        }

    });
}

</script>

</body>

</html>