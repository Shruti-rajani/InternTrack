<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>InternTrack | Internship Manager</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f5f7fc;
            color: #172137;
            min-height: 100vh;
        }

        /* ================= HEADER ================= */

        header {
            height: 82px;
            background: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 7.5%;
            border-bottom: 1px solid #e9edf5;
        }

        .logo {
            font-size: 28px;
            font-weight: 800;
            letter-spacing: -1px;
        }

        .logo .intern {
            color: #586ce5;
        }

        .logo .track {
            color: #172137;
        }

        .header-right {
            color: #68758d;
            font-size: 14px;
        }

        /* ================= HERO ================= */

        .hero {
            max-width: 1400px;
            margin: auto;
            min-height: calc(100vh - 82px);
            display: grid;
            grid-template-columns: 1.15fr 0.85fr;
            align-items: center;
            gap: 70px;
            padding: 65px 7.5%;
        }

        .hero-left {
            max-width: 650px;
        }

        /* ================= BADGE ================= */

        .badge {
            display: inline-flex;
            align-items: center;
            gap: 9px;
            background: #edf0ff;
            color: #586ce5;
            padding: 9px 15px;
            border-radius: 30px;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 0.7px;
            margin-bottom: 25px;
        }

        .badge-icon {
            width: 17px;
            height: 17px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .badge-icon svg {
            width: 16px;
            height: 16px;
            stroke: currentColor;
            fill: none;
            stroke-width: 2;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        /* ================= HEADING ================= */

        h1 {
            font-size: clamp(48px, 5vw, 70px);
            line-height: 1.02;
            letter-spacing: -3px;
            margin-bottom: 25px;
        }

        h1 .highlight {
            color: #586ce5;
        }

        .description {
            color: #65738d;
            font-size: 17px;
            line-height: 1.75;
            max-width: 600px;
            margin-bottom: 34px;
        }

        /* ================= BUTTON ================= */

        .dashboard-button {
            display: inline-flex;
            align-items: center;
            gap: 12px;
            text-decoration: none;
            color: white;
            background: #586ce5;
            padding: 16px 23px;
            border-radius: 11px;
            font-size: 16px;
            font-weight: 700;
            box-shadow: 0 10px 24px rgba(88, 108, 229, 0.25);
            transition: all 0.2s ease;
        }

        .dashboard-button:hover {
            background: #4d60d6;
            transform: translateY(-2px);
            box-shadow: 0 14px 28px rgba(88, 108, 229, 0.30);
        }

        .button-icon {
            display: flex;
            align-items: center;
        }

        .button-icon svg {
            width: 18px;
            height: 18px;
            stroke: currentColor;
            fill: none;
            stroke-width: 2;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        /* ================= RIGHT CARD ================= */

        .overview-wrapper {
            position: relative;
        }

        .overview-card {
            background: white;
            border-radius: 25px;
            padding: 31px;
            box-shadow:
                0 25px 60px rgba(33, 48, 80, 0.10);
            border: 1px solid #edf0f6;
            position: relative;
            z-index: 2;
        }

        .overview-header {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            margin-bottom: 24px;
        }

        .overview-title {
            font-size: 21px;
            font-weight: 750;
            margin-bottom: 5px;
        }

        .overview-subtitle {
            color: #8792a7;
            font-size: 13px;
        }

        .overview-mark {
            width: 38px;
            height: 38px;
            background: #edf0ff;
            border-radius: 11px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #586ce5;
        }

        .overview-mark svg {
            width: 19px;
            height: 19px;
            stroke: currentColor;
            fill: none;
            stroke-width: 2;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        /* ================= FEATURE ITEMS ================= */

        .feature {
            background: #f7f8fc;
            border-radius: 15px;
            padding: 17px;
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 12px;
            transition: all 0.2s ease;
        }

        .feature:last-child {
            margin-bottom: 0;
        }

        .feature:hover {
            background: #f0f2ff;
            transform: translateX(3px);
        }

        .feature-icon {
            width: 44px;
            height: 44px;
            border-radius: 12px;
            background: #e9edff;
            color: #586ce5;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .feature-icon svg {
            width: 21px;
            height: 21px;
            stroke: currentColor;
            fill: none;
            stroke-width: 2;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        .feature-text {
            flex: 1;
        }

        .feature-title {
            font-size: 16px;
            font-weight: 700;
            margin-bottom: 4px;
        }

        .feature-description {
            color: #8792a7;
            font-size: 12px;
        }

        .feature-action {
            color: #586ce5;
            font-size: 12px;
            font-weight: 700;
        }

        /* ================= SMALL FLOATING CARD ================= */

        .floating-card {
            position: absolute;
            bottom: -28px;
            left: -35px;
            background: white;
            border: 1px solid #edf0f6;
            border-radius: 16px;
            padding: 15px 18px;
            box-shadow:
                0 15px 35px rgba(33, 48, 80, 0.10);
            display: flex;
            align-items: center;
            gap: 11px;
            z-index: 3;
        }

        .floating-icon {
            width: 35px;
            height: 35px;
            background: #e9f8f1;
            color: #29916a;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .floating-icon svg {
            width: 18px;
            height: 18px;
            stroke: currentColor;
            fill: none;
            stroke-width: 2;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        .floating-title {
            font-size: 12px;
            font-weight: 700;
            margin-bottom: 3px;
        }

        .floating-text {
            color: #8a95a8;
            font-size: 11px;
        }

        /* ================= DECORATIVE SHAPE ================= */

        .shape {
            position: absolute;
            width: 250px;
            height: 250px;
            background: #edf0ff;
            border-radius: 50%;
            right: -80px;
            top: -70px;
            z-index: 0;
        }

        /* ================= FOOTER DETAIL ================= */

        .trust-line {
            display: flex;
            align-items: center;
            gap: 9px;
            color: #8994a8;
            font-size: 12px;
            margin-top: 25px;
        }

        .trust-dot {
            width: 7px;
            height: 7px;
            border-radius: 50%;
            background: #35a97a;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 950px) {

            .hero {
                grid-template-columns: 1fr;
                padding-top: 55px;
                padding-bottom: 70px;
            }

            .hero-left {
                max-width: 700px;
            }

            .overview-wrapper {
                max-width: 600px;
                width: 100%;
                margin: 0 auto;
            }

            h1 {
                font-size: 54px;
            }
        }

        @media (max-width: 600px) {

            header {
                padding: 0 25px;
            }

            .header-right {
                display: none;
            }

            .hero {
                padding: 45px 25px 70px;
                gap: 55px;
            }

            h1 {
                font-size: 45px;
                letter-spacing: -2px;
            }

            .description {
                font-size: 15px;
            }

            .overview-card {
                padding: 22px;
            }

            .floating-card {
                left: 10px;
                bottom: -45px;
            }
        }

    </style>

</head>


<body>


<!-- ================= HEADER ================= -->

<header>

    <div class="logo">
        <span class="intern">Intern</span><span class="track">Track</span>
    </div>

    <div class="header-right">
        Student Internship Management System
    </div>

</header>


<!-- ================= HERO ================= -->

<section class="hero">


    <!-- LEFT -->

    <div class="hero-left">

        <div class="badge">

            <span class="badge-icon">

                <svg viewBox="0 0 24 24">

                    <path d="M12 3l2.8 5.7L21 9.6l-4.5 4.4
                             1.1 6.2L12 17.3 6.4 20.2
                             7.5 14 3 9.6l6.2-.9L12 3z">
                    </path>

                </svg>

            </span>

            SMART INTERNSHIP TRACKING

        </div>


        <h1>

            Organize your
            <br>

            <span class="highlight">
                career journey.
            </span>

        </h1>


        <p class="description">

            Keep all your internship applications in one place.
            Track applications, interviews, selections and
            opportunities without losing important details.

        </p>


        <a
            href="InternshipServlet?action=list"
            class="dashboard-button">

            Open My Dashboard

            <span class="button-icon">

                <svg viewBox="0 0 24 24">

                    <line x1="5" y1="12"
                          x2="19" y2="12">
                    </line>

                    <polyline points="12 5 19 12 12 19">
                    </polyline>

                </svg>

            </span>

        </a>


        <div class="trust-line">

            <span class="trust-dot"></span>

            Your internship journey, organized in one place

        </div>

    </div>


    <!-- RIGHT -->

    <div class="overview-wrapper">

        <div class="shape"></div>


        <div class="overview-card">

            <div class="overview-header">

                <div>

                    <div class="overview-title">
                        Application Overview
                    </div>

                    <div class="overview-subtitle">
                        Your internship journey
                    </div>

                </div>


                <div class="overview-mark">

                    <svg viewBox="0 0 24 24">

                        <path d="M4 19V5"></path>

                        <path d="M4 19h16"></path>

                        <path d="M8 16v-5"></path>

                        <path d="M12 16V8"></path>

                        <path d="M16 16v-3"></path>

                    </svg>

                </div>

            </div>


            <!-- APPLICATIONS -->

            <div class="feature">

                <div class="feature-icon">

                    <svg viewBox="0 0 24 24">

                        <rect x="3" y="4"
                              width="18" height="17"
                              rx="2">
                        </rect>

                        <line x1="7" y1="8"
                              x2="17" y2="8">
                        </line>

                        <line x1="7" y1="12"
                              x2="17" y2="12">
                        </line>

                        <line x1="7" y1="16"
                              x2="13" y2="16">
                        </line>

                    </svg>

                </div>


                <div class="feature-text">

                    <div class="feature-title">
                        Applications
                    </div>

                    <div class="feature-description">
                        Track every opportunity
                    </div>

                </div>


                <div class="feature-action">
                    TRACK
                </div>

            </div>


            <!-- INTERVIEWS -->

            <div class="feature">

                <div class="feature-icon">

                    <svg viewBox="0 0 24 24">

                        <rect x="3" y="5"
                              width="18" height="14"
                              rx="2">
                        </rect>

                        <path d="M8 5V3"></path>

                        <path d="M16 5V3"></path>

                        <line x1="3" y1="10"
                              x2="21" y2="10">
                        </line>

                        <path d="M8 14h2"></path>

                        <path d="M14 14h2"></path>

                    </svg>

                </div>


                <div class="feature-text">

                    <div class="feature-title">
                        Interviews
                    </div>

                    <div class="feature-description">
                        Never miss an update
                    </div>

                </div>


                <div class="feature-action">
                    MANAGE
                </div>

            </div>


            <!-- CAREER PROGRESS -->

            <div class="feature">

                <div class="feature-icon">

                    <svg viewBox="0 0 24 24">

                        <polyline points="4 17 9 12 13 15 20 7">
                        </polyline>

                        <polyline points="15 7 20 7 20 12">
                        </polyline>

                    </svg>

                </div>


                <div class="feature-text">

                    <div class="feature-title">
                        Career Progress
                    </div>

                    <div class="feature-description">
                        Monitor your progress
                    </div>

                </div>


                <div class="feature-action">
                    GROW
                </div>

            </div>

        </div>


        <!-- FLOATING STATUS -->

        <div class="floating-card">

            <div class="floating-icon">

                <svg viewBox="0 0 24 24">

                    <polyline points="20 6 9 17 4 12">
                    </polyline>

                </svg>

            </div>

            <div>

                <div class="floating-title">
                    Stay organized
                </div>

                <div class="floating-text">
                    Track every opportunity
                </div>

            </div>

        </div>

    </div>

</section>


</body>

</html>