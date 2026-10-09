<!DOCTYPE html>
<html>
<head>

    <title>Add Internship | InternTrack</title>

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
            font-size: 14px;
        }

        .container {
            max-width: 850px;
            margin: 45px auto;
            padding: 0 20px;
        }

        .heading {
            margin-bottom: 25px;
        }

        .heading h1 {
            font-size: 30px;
            margin-bottom: 8px;
        }

        .heading p {
            color: #7b8495;
            font-size: 14px;
        }

        .form-card {
            background: white;
            padding: 35px;
            border-radius: 18px;
            box-shadow: 0 5px 25px rgba(20,30,60,0.06);
        }

        .section-title {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 22px;
            padding-bottom: 12px;
            border-bottom: 1px solid #edf0f5;
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

        .field.full {
            grid-column: 1 / 3;
        }

        label {
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 8px;
            color: #394256;
        }

        input,
        select,
        textarea {
            padding: 12px 14px;
            border: 1px solid #dfe3eb;
            border-radius: 9px;
            font-size: 14px;
            outline: none;
            background: white;
        }

        input:focus,
        select:focus,
        textarea:focus {
            border-color: #5267df;
        }

        textarea {
            height: 110px;
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
            border-radius: 9px;
            text-decoration: none;
            color: #697386;
            border: 1px solid #dfe3eb;
            font-size: 14px;
        }

        .save {
            padding: 12px 22px;
            border: none;
            border-radius: 9px;
            background: #5267df;
            color: white;
            font-weight: bold;
            cursor: pointer;
            font-size: 14px;
        }

        .save:hover {
            background: #4054c7;
        }

        @media(max-width: 700px) {

            .grid {
                grid-template-columns: 1fr;
            }

            .field.full {
                grid-column: 1;
            }

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

    <div class="heading">

        <h1>Add Internship</h1>

        <p>
            Add a new internship application to your tracker.
        </p>

    </div>


    <div class="form-card">

        <div class="section-title">
            Internship Information
        </div>


        <form action="InternshipServlet" method="post">

            <input type="hidden"
                   name="action"
                   value="add">


            <div class="grid">


                <div class="field">

                    <label>Company Name *</label>

                    <input type="text"
                           name="company"
                           placeholder="e.g. Google"
                           required>

                </div>


                <div class="field">

                    <label>Role *</label>

                    <input type="text"
                           name="role"
                           placeholder="e.g. Data Analyst Intern"
                           required>

                </div>


                <div class="field">

                    <label>Location</label>

                    <input type="text"
                           name="location"
                           placeholder="e.g. Bangalore / Remote">

                </div>


                <div class="field">

                    <label>Internship Type</label>

                    <select name="internshipType">

                        <option value="Remote">
                            Remote
                        </option>

                        <option value="On-site">
                            On-site
                        </option>

                        <option value="Hybrid">
                            Hybrid
                        </option>

                    </select>

                </div>


                <div class="field">

                    <label>Stipend (?)</label>

                    <input type="number"
                           name="stipend"
                           placeholder="e.g. 15000"
                           min="0">

                </div>


                <div class="field">

                    <label>Application Date</label>

                    <input type="date"
                           name="applicationDate"
                           required>

                </div>


                <div class="field">

                    <label>Status</label>

                    <select name="status">

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


                <div class="field">

                    <label>Application Source</label>

                    <input type="text"
                           name="source"
                           placeholder="LinkedIn / Internshala / Company Website">

                </div>


                <div class="field full">

                    <label>Notes</label>

                    <textarea
                        name="notes"
                        placeholder="Add any important details about this application..."></textarea>

                </div>

            </div>


            <div class="actions">

                <a href="InternshipServlet?action=list"
                   class="cancel">
                    Cancel
                </a>

                <button type="submit"
                        class="save">
                    Save Internship
                </button>

            </div>

        </form>

    </div>

</div>

</body>
</html>