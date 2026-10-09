<%@ page import="model.Internship" %>

<%
    Internship internship =
        (Internship) request.getAttribute("internship");
%>

<!DOCTYPE html>
<html>

<head>

    <title>Edit Internship | InternTrack</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f5f7fb;
            color: #172033;
        }

        .navbar {
            height: 70px;
            background: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 7%;
            border-bottom: 1px solid #e8eaf0;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #5267df;
        }

        .logo span {
            color: #172033;
        }

        .back {
            text-decoration: none;
            color: #697386;
        }

        .container {
            max-width: 850px;
            margin: 45px auto;
            padding: 0 20px;
        }

        h1 {
            font-size: 30px;
            margin-bottom: 8px;
        }

        .subtitle {
            color: #7b8495;
            margin-bottom: 25px;
        }

        .card {
            background: white;
            padding: 35px;
            border-radius: 18px;
            box-shadow: 0 5px 25px rgba(20,30,60,0.06);
        }

        .grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .field {
            display: flex;
            flex-direction: column;
        }

        .full {
            grid-column: 1 / 3;
        }

        label {
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 8px;
        }

        input,
        select,
        textarea {
            padding: 12px;
            border: 1px solid #dfe3eb;
            border-radius: 9px;
            font-size: 14px;
        }

        textarea {
            height: 100px;
            resize: vertical;
        }

        .actions {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            margin-top: 30px;
        }

        .cancel {
            padding: 12px 20px;
            border: 1px solid #dfe3eb;
            border-radius: 9px;
            text-decoration: none;
            color: #697386;
        }

        button {
            padding: 12px 22px;
            border: none;
            border-radius: 9px;
            background: #5267df;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }

    </style>

</head>

<body>

<div class="navbar">

    <div class="logo">
        Intern<span>Track</span>
    </div>

    <a href="InternshipServlet?action=list" class="back">
        ? Back to Dashboard
    </a>

</div>


<div class="container">

    <h1>Edit Internship</h1>

    <p class="subtitle">
        Update your internship application details.
    </p>


    <div class="card">

        <form action="InternshipServlet" method="post">

            <input type="hidden"
                   name="action"
                   value="update">

            <input type="hidden"
                   name="id"
                   value="<%= internship.getId() %>">


            <div class="grid">

                <div class="field">

                    <label>Company Name</label>

                    <input type="text"
                           name="company"
                           value="<%= internship.getCompany() %>"
                           required>

                </div>


                <div class="field">

                    <label>Role</label>

                    <input type="text"
                           name="role"
                           value="<%= internship.getRole() %>"
                           required>

                </div>


                <div class="field">

                    <label>Location</label>

                    <input type="text"
                           name="location"
                           value="<%= internship.getLocation() %>">

                </div>


                <div class="field">

                    <label>Internship Type</label>

                    <select name="internshipType">

                        <option value="Remote"
                            <%= "Remote".equals(internship.getInternshipType())
                            ? "selected" : "" %>>
                            Remote
                        </option>

                        <option value="On-site"
                            <%= "On-site".equals(internship.getInternshipType())
                            ? "selected" : "" %>>
                            On-site
                        </option>

                        <option value="Hybrid"
                            <%= "Hybrid".equals(internship.getInternshipType())
                            ? "selected" : "" %>>
                            Hybrid
                        </option>

                    </select>

                </div>


                <div class="field">

                    <label>Stipend</label>

                    <input type="number"
                           name="stipend"
                           value="<%= internship.getStipend() %>">

                </div>


                <div class="field">

                    <label>Application Date</label>

                    <input type="date"
                           name="applicationDate"
                           value="<%= internship.getApplicationDate() %>"
                           required>

                </div>


                <div class="field">

                    <label>Status</label>

                    <select name="status">

                        <option value="Applied"
                            <%= "Applied".equals(internship.getStatus())
                            ? "selected" : "" %>>
                            Applied
                        </option>

                        <option value="Interview"
                            <%= "Interview".equals(internship.getStatus())
                            ? "selected" : "" %>>
                            Interview
                        </option>

                        <option value="Selected"
                            <%= "Selected".equals(internship.getStatus())
                            ? "selected" : "" %>>
                            Selected
                        </option>

                        <option value="Rejected"
                            <%= "Rejected".equals(internship.getStatus())
                            ? "selected" : "" %>>
                            Rejected
                        </option>

                    </select>

                </div>


                <div class="field">

                    <label>Source</label>

                    <input type="text"
                           name="source"
                           value="<%= internship.getSource() %>">

                </div>


                <div class="field full">

                    <label>Notes</label>

                    <textarea name="notes"><%= internship.getNotes() %></textarea>

                </div>

            </div>


            <div class="actions">

                <a href="InternshipServlet?action=list"
                   class="cancel">
                    Cancel
                </a>

                <button type="submit">
                    Update Internship
                </button>

            </div>

        </form>

    </div>

</div>

</body>

</html>